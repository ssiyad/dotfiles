return {
    s('nlog', {
        t('private readonly logger = new Logger('), i(1), t('.name)')
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
        t('this.logger.warn('), i(1), t(')')
    })
}

