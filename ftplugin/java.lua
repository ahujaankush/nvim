local config = {
  settings = {
    java = { signatureHelp = { enabled = true }, contentProvider = { preferred = "fernflower" } },
  },
  on_init = function(client)
    if client.config.settings then
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
  end,
  cmd = { "jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
