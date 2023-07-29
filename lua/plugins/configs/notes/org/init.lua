local orgmode = require("orgmode")

orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = {'~/Documents/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Documents/org/refile.org',
})
