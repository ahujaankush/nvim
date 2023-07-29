local notes = os.getenv "HOME" .. "/Documents/Notes"
return {
  config = {
    workspaces = {
      default = notes .."/Wiki",
      journal = notes .. "/Journal",
      wiki = notes .. "/Wiki",
    },
  },
}
