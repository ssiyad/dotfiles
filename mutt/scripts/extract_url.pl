#!/usr/bin/perl

use MIME::Parser;
use Switch;
use HTML::Parser;
use Getopt::Std;

my $version = 1.3;

my %options;
&getopts("lv",\%options);
my $fancymenu = 1;
if ($options{'l'}) { $fancymenu = 0; }
if ($options{'v'}) { print "The extract_url Program, version $version\n"; exit; }

# create a hash of html tag names that may have links
my %link_attr = (
	'a' => {'href'},
	'applet' => {'archive','codebase','code'},
	'area' => {'href'},
	'blockquote' => {'cite'},
	#'body'    => {'background'},
	'embed'   => {'pluginspage', 'src'},
	'form'    => {'action'},
	'frame'   => {'src', 'longdesc'},
	'iframe'  => {'src', 'longdesc'},
	#'ilayer'  => {'background'},
	#'img' => {'src'},
	'input'   => {'src', 'usemap'},
	'ins'     => {'cite'},
	'isindex' => {'action'},
	'head'    => {'profile'},
	#'layer'   => {'background', 'src'},
	'layer'   => {'src'},
	'link'    => {'href'},
	'object'  => {'classid', 'codebase', 'data', 'archive', 'usemap'},
	'q'       => {'cite'},
	'script'  => {'src', 'for'},
	#'table'   => {'background'},
	#'td'      => {'background'},
	#'th'      => {'background'},
	#'tr'      => {'background'},
	'xmp'     => {'href'},
);

# find out the URLVIEW command
my $urlviewcommand="";
my $shortcut = 0; # means open it without checking if theres only 1 URL
my $noreview = 0; # means don't display overly-long URLs to be checked before opening
my $persist  = 0; # means don't exit after viewing a URL (ignored if $shortcut == 0)
my $ignore_empty = 0; # means to throw out URLs that don't have text in HTML
sub getprefs
{
	if (open(PREFFILE,'<',$ENV{'HOME'}."/.extract_urlview")) {
		while (<PREFFILE>) {
			switch ($_) {
				case /^SHORTCUT$/          { $shortcut = 1; }
				case /^NOREVIEW$/          { $noreview = 1; }
				case /^PERSISTENT$/        { $persist = 1; }
				case /^IGNORE_EMPTY_TAGS$/ { $ignore_empty = 1; }
				case /^COMMAND (.*)/ {
					/^COMMAND (.*)/;
					$urlviewcommand=$1;
					chomp $urlviewcommand;
				}
				case /^HTML_TAGS (.*)/ {
					/^HTML_TAGS (.*)/;
					my @tags = split(',', $1);
					my %tags_hash;
					foreach my $tag (@tags) {
						$tags_hash{lc $tag} = 1;
					}
					foreach my $tag (keys %link_attr) {
						delete $link_attr{$tag} if (! exists($tags_hash{$tag}));
					}
				}
			}
		}
		close PREFFILE;
	} elsif (open(URLVIEW,'<',$ENV{'HOME'}."/.urlview")) {
		while (<URLVIEW>) {
			if (/^COMMAND (.*)/) {
				$urlviewcommand=$1;
				chomp $urlviewcommand;
				last;
			}
		}
		close URLVIEW;
	}
	if ($urlviewcommand eq "") {
		$urlviewcommand = "open";
	}
}

my %link_hash;
my %orig_text;
my $newlink = 1;
sub foundurl {
	my($uri) = @_;
	$uri =~ s/mailto:(.*)/$1/;
	if (! $link_hash{$uri}) {
		$link_hash{$uri} = $newlink++;
	}
}
my $foundurl_text_curindex = 0;
my $foundurl_text_lastindex = 0;
my $foundurl_text_prevurl = "";
my $foundurl_text_text;

sub foundurl_text {
	my ($uri,$orig) = @_;
	$foundurl_text_curindex = index($$foundurl_text_text, $orig, $foundurl_text_lastindex);
	my $sincelast = &tidytext(substr($$foundurl_text_text,$foundurl_text_lastindex,($foundurl_text_curindex-$foundurl_text_lastindex)));
	$sincelast =~ s/<$//;
	$sincelast =~ s/^>//;
	&foundurl($uri);
	&process_sincelast($uri, $foundurl_text_prevurl, $sincelast);
	$foundurl_text_lastindex = $foundurl_text_curindex + length($orig);
	$foundurl_text_prevurl = $uri;
}
sub unfindurl {
	my($uri) = @_;
	delete($link_hash{$uri});
	delete($orig_text{$uri});
}
sub sanitizeuri {
	my($uri) = @_;
	my %encoding = (
		#"\!" => "%21",
		#"\*" => "%2A",
		"\'" => "%27",
		#"\(" => "%28",
		#"\)" => "%29",
		#"\;" => "%3B",
		#"\:" => "%3A",
		#"\@" => "%40",
		#"\&" => "%26",
		#"\=" => "%3D",
		#"\+" => "%2B",
		"\\\$" => "%24",
		#"\," => "%2C",
		#"\/" => "%2F",
		#"\?" => "%3F",
		#"\%" => "%25",
		#"\#" => "%23",
		#"\[" => "%5B",
		#"\]" => "%5D",
	);
	foreach $dangerchar (keys %encoding) {
		$uri =~ s/$dangerchar/$encoding{$dangerchar}/g;
	}
	return $uri;
}

my $parser = new MIME::Parser;

my %closedurls;

sub process_sincelast
{
	my($url,$prev,$sincelast) = @_;
	if (length($prev) > 0 && ! exists($closedurls{$prev})) {
		$orig_text{$prev} .= " ".substr($sincelast,0,30);
		$closedurls{$prev} = 1;
		#print "URL(".$link_hash{$prev}.":".$newlink."): $prev ->\n\t".$orig_text{$prev}."\n\n";
	}
	if (! exists($closedurls{$url})) {
		my $beforetext = substr $sincelast, -30;
		if (length($beforetext)) {
			$orig_text{$url} = "$beforetext =>URL<=";
		} else {
			$orig_text{$url} = "=>URL<=";
		}
	}
}

sub extract_url_from_text {
	($foundurl_text_text) = @_;
	# The idea here is to eliminate duplicate URLs - I want the
	# %link_hash to be full of URLs. My regex (in the else statement)
	# is decent, but imperfect. URI::Find is better.
	my $fancyfind=1;
	eval "use URI::Find::Schemeless";
	$fancyfind=0 if ($@);
	if ($fancyfind == 1) {
		my $finder = URI::Find::Schemeless->new(\&foundurl_text);
		$finder->find($foundurl_text_text);
	} else {
		$$foundurl_text_text =~ s{(((mms|ftp|http|https)://|news:)[][A-Za-z0-9_.~!*'();:@&=+$,/?%#-]+[^](,.'">;[:space:]]|(mailto:)?[-a-zA-Z_0-9.+]+@[-a-zA-Z_0-9.]+)}{
			&foundurl_text($1,$1);
		}eg;
	}
}

my $seenstart = 0;
my $seenurl = "";
my $beforetext = "";
my $extendedskipped = "";
my $last10words = "";
my $words_since_link_end = "";

sub tidytext
{
	my ($text) = @_;
	my %rendermap = (
		'[\n]' => '',
		'[\r]' => '',
		'&#[0-9]+;' => '',
		'&#x[0-9a-f]+;' => '',
		'&nbsp;' => ' ',
		'&copy;' => '(c)',
		'&mdash;' => '---',
		'&quot;' => '"',
		'&apos;' => "'",
		'&lt;' => '<',
		'&gt;' => '>',
		'&([ACEINOUY])(grave|acute|circ|tilde|uml|ring|cedil);' => '\1',
		'&amp;' => '&',
		'\s\s+' => ' ',
	);
	foreach $entity (keys %rendermap) {
		my $construct = '$text =~ s/$entity/'.$rendermap{$entity}.'/ig';
		eval $construct;
	}
	$text =~ s/^\s+//;
	$text =~ s/\s+$//;
	return $text;
}

sub find_urls_rec
{
	my($ent) = @_;
	if ($ent->parts > 1 or $ent->mime_type eq "multipart/mixed") {
		for ($i=0;$i<$ent->parts;$i++) {
			find_urls_rec($ent->parts($i));
		}
	} else {
		#print "type: " . $ent->mime_type . "\n";
		switch ($ent->mime_type) {
			case "text/html" {
				my $parser = HTML::Parser->new(api_version=>3);
				$parser->handler(start => sub {
						my($tagname,$pos,$text,$skipped) = @_;
						if (my $link_attr = $link_attr{$tagname}) {
							while (4 <= @$pos) {
								my($k_offset, $k_len, $v_offset, $v_len) = splice(@$pos,-4);
								my $attrname = lc(substr($text, $k_offset, $k_len));
								next unless exists($link_attr->{$attrname});
								next unless $v_offset; # 0 v_offset means no value
								my $v = substr($text, $v_offset, $v_len);
								$v =~ s/^([\'\"])(.*)\1$/$2/;
								&foundurl($v);

								$words_since_link_end .= " $skipped";
								$last10words = &tidytext("$last10words $skipped");
								$last10words = substr $last10words, -50;

								$words_since_link_end = &tidytext($words_since_link_end);
								if (length($seenurl) > 0 && ! exists($closedurls{$seenurl})) {
									my $since_words = substr $words_since_link_end, 0, 30;
									if (length($since_words) > 0) {
										my $space = " ";
										$space = "" if ($since_words =~ /^[.,;!?)-]/);
										$orig_text{$seenurl} .= "$space$since_words";
									}
									$closedurls{$seenurl} = 1;
								}

								$beforetext = substr $last10words, -30;
								$seenstart = 1;
								$seenurl = $v;
							}
						}
					},
					"tagname, tokenpos, text, skipped_text");
				$parser->handler(end => sub {
						my ($text) = @_;
						$text = &tidytext($text);
						$last10words = &tidytext("$last10words $text");
						$last10words = substr $last10words, -50;
						if ($seenstart == 1) {
							if (! exists($closedurls{$seenurl})) {
								my $mtext = "=>$text<=";
								if (length($beforetext)) {
									my $space = " ";
									$space = "" if ($beforetext =~ /[(-]$/);
									$orig_text{$seenurl} = "$beforetext$space$mtext";
								} else {
									$orig_text{$seenurl} = "$mtext";
								}
							}
							if (length($text) == 0 && $ignore_empty == 1 && ! exists($closedurls{$seenurl})) {
								&unfindurl($seenurl);
							}
							$seenstart = 0;
							$extendedskipped .= " $text";
							$words_since_link_end = "";
						} else {
							$words_since_link_end .= " $text";
						}
					},"skipped_text");
				$parser->parse($ent->bodyhandle->as_string);
			}
			case qr/text\/.*/ {
				$ent->head->unfold;
				switch ($ent->head->get('Content-type')) {
					case qr/format=flowed/ {
						my @lines = $ent->bodyhandle->as_lines;
						chomp(@lines);
						my $body = "";
						if ($ent->head->get('Content-type') =~ /delsp=yes/) {
							#print "delsp=yes!\n";
							$delsp=1;
						} else {
							#print "delsp=no!\n";
							$delsp=0;
						}
						for ($i=0;$i<@lines;$i++) {
							my $col = 0;
							my $quotetext = "";
							while (substr($lines[$i],$col,1) eq ">") {
								$quotetext .= ">";
								$col++;
							}
							if ($col > 0) { $body .= "$quotetext "; }
							while ($lines[$i] =~ / $/ && $lines[$i] =~ /^$quotetext[^>]/ && $lines[$i+1] =~ /^$quotetext[^>]/) {
								if ($delsp) {
									$line = substr($lines[$i],$col,length($lines[$i])-$col-1);
								} else {
									$line = substr($lines[$i],$col);
								}
								$line =~ s/ *(.*)/$1/;
								$body .= $line;
								$i++;
							}
							if ($lines[$i] =~ /^$quotetext[^>]/) {
								$line = substr($lines[$i],$col);
								$line =~ s/ *(.*)/$1/;
								$body .= $line."\n";
							}
						}
						&extract_url_from_text(\$body);
					}
					else {
						&extract_url_from_text(\$ent->bodyhandle->as_string);
					}
				}
			}
		}
	}
}

sub urlwrap {
	my($subseq,$text,$linelen,$breaker) = @_;
	my $len = length($text);
	my $i = 0;
	my $output = "";
	if (length($breaker) == 0) { $breaker = "\n"; }
	while ($len > $linelen) {
		if ($i > 0) { $output .= $subseq; }
		my $breakpoint = -1;
		my $chunk = substr($text,$i,$linelen);
		my @chars = ("!","*","'","(",")",";",":","@","&","=","+",",","/","?","%","#","[","]","-","_");
		foreach $chr ( @chars ) {
			my $pt = rindex($chunk,$chr);
			if ($breakpoint < $pt) { $breakpoint = $pt; }
		}
		if ($breakpoint == -1) { $breakpoint = $linelen; }
		else { $breakpoint += 1; }
		$output .= substr($text,$i,$breakpoint) . $breaker;
		if ($i == 0) { $linelen -= length($subseq); }
		$len -= $breakpoint;
		$i += $breakpoint;
	}
	if ($i > 0) { $output .= $subseq; }
	$output .= substr($text,$i);
	return $output;
}

sub isOutputScreen {
	use POSIX;
	return 0 if POSIX::isatty( \*STDOUT) eq "" ; # pipe
	return 1; # screen
} # end of isOutputScreen

&getprefs();
$parser->output_to_core(1);
$entity = $parser->parse(\*STDIN) or die "parse failed\n";
&find_urls_rec($entity);

if (&isOutputScreen) {
	eval "use Curses::UI";
	$fancymenu = 0 if ($@);
} else {
	$fancymenu = 0;
}

if ($fancymenu == 1) {
	#use strict;

	# This is the shortcut...
	if ($shortcut == 1 && 1 == scalar keys %link_hash) {
		my ($url) = each %link_hash;
		$url = &sanitizeuri($url);
		if ($urlviewcommand =~ m/%s/) {
			$urlviewcommand =~ s/%s/'$url'/g;
		} else {
			$urlviewcommand .= " $url";
		}
		system $urlviewcommand;
		exit 0;
	}

	# Curses support really REALLY wants to own STDIN
	close(STDIN);
	open(STDIN,"/dev/tty"); # looks like a hack, smells like a hack...

	my $cui = new Curses::UI(
		-color_support => 1,
		-clear_on_exit => 1
	);
	my $wrapwidth = $cui->width() - 2;
	my %listhash;
	my @listvals;
	foreach $url (sort {$link_hash{$a} <=> $link_hash{$b} } keys(%link_hash)) {
		push(@listvals,$link_hash{$url});
		$listhash{$link_hash{$url}} = $url;
	}

	my @menu = (
		{ -label => 'Keys: q=quit m=menu c=context g=top G=bottom', 
			-submenu => [
			{ -label => 'About', -value => \&about },
			{ -label => 'Show Command', -value => \&show_command },
			{ -label => 'Exit      ^Q', -value => \&exit_dialog  }
			],
		},
	);
	my $menu = $cui->add(
                'menu','Menubar', 
                -menu => \@menu,
        );
	my $win1 = $cui->add(
			'win1', 'Window',
			-border => 1,
			-y    => 1,
			-bfg  => 'green',
		);
	sub about()
	{
		$cui->dialog(
			-message => "The extract_url Program, version $version"
		);
	}
	sub show_command()
	{
		# This extra sprintf work is to ensure that the title
		# is fully displayed even if $urlviewcommand is short
		my $title = "The configured URL viewing command is:";
		my $len = length($title);
		my $cmd = sprintf("%-${len}s",$urlviewcommand);
		$cui->dialog(
			-title => "The configured URL viewing command is:",
			-message => $cmd,
		);
	}
	sub exit_dialog()
	{
		my $return = $cui->dialog(
			-message   => "Do you really want to quit?",
			-buttons   => ['yes', 'no'],
		);
		exit(0) if $return;
	}

	my $listbox = $win1->add(
		'mylistbox', 'Listbox',
		-values    => \@listvals,
		-labels    => \%listhash,
		);
	$cui->set_binding(sub {$menu->focus()}, "\cX");
	$cui->set_binding(sub {$menu->focus()}, "m");
	$cui->set_binding( sub{exit}, "q" );
	$cui->set_binding( \&exit_dialog , "\cQ");
	$cui->set_binding( sub{exit} , "\cc");
	$listbox->set_binding( 'option-last', "G");
	$listbox->set_binding( 'option-first', "g");
	sub madeselection {
		my $rawurl = $listhash{$listbox->get_active_value()};
		my $url = &sanitizeuri($rawurl);
		my $command = $urlviewcommand;
		if ($command =~ m/%s/) {
			$command =~ s/%s/'$url'/g;
		} else {
			$command .= " $url";
		}
		my $return = 1;
		if ($noreview != 1 && length($url) > ($cui->width()-2)) {
				$return = $cui->dialog(
					-message => &urlwrap("  ",$url,$cui->width()-8),
					-title => "Your Choice:",
					-buttons => ['ok', 'cancel'],
				);
		}
		if ($return) {
			system $command;
			exit 0 if ($persist == 0);
		}
	}
	$cui->set_binding( \&madeselection, " ");
	$listbox->set_routine('option-select',\&madeselection);
	use Text::Wrap;
	sub contextual {
		my $rawurl = $listhash{$listbox->get_active_value()};
		$Text::Wrap::columns = $cui->width()-8;
		if (exists($orig_text{$rawurl}) && length($orig_text{$rawurl}) > 1) {
			$cui->dialog(
				-message => wrap('','',$orig_text{$rawurl}),
				-title => "Context:",
				-buttons => ['ok'],
			);
		} else {
			$cui->error(
				-message => "Sorry, I don't have any context for this link",
				-buttons => ['ok'],
				-bfg => 'red',
				-tfg => 'red',
				-fg => 'red',
			);
		}
	}
	$cui->set_binding( \&contextual, "c");

	$listbox->focus();
	$cui->mainloop();
} else {
	# using this as a pass-thru to URLVIEW
	foreach my $value (sort {$link_hash{$a} <=> $link_hash{$b} } keys %link_hash)
	{
		print "$value\n";
	}
}
