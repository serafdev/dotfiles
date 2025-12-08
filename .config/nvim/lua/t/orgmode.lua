-- require('orgmode').setup_ts_grammar() -- Deprecated in newer versions

-- Orgmode treesitter config moved to main treesitter config

require('orgmode').setup({
    org_agenda_files = { '~/org/**/*' },
    org_default_notes_file = '~/org/refile.org',
})
