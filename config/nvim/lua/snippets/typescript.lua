local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

ls.add_snippets('typescript', {
    s('clog', {
        t('console.log('), i(1), t(')')
    }),

    s('nlog', {
        t('private readonly logger = new LoggerService('), i(1), t('.name)')
    }),

    s('llog', {
        t('this.logger.log('), i(1), t(')')
    }),

    s('linfo', {
        t('this.logger.info('), i(1), t(')')
    }),

    s('ldebug', {
        t('this.logger.debug('), i(1), t(')')
    }),

    s('lwarning', {
        t('this.logger.warning('), i(1), t(')')
    })
})

