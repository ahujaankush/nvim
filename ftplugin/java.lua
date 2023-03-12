-- Java Language Server configuration.
-- Locations:
-- 'nvim/ftplugin/java.lua'.
-- 'nvim/lang-servers/intellij-java-google-style.xml'

-- Main Config
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "jdtls",
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
          },
          {
            name = "JavaSE-19",
            path = "/usr/lib/jvm/java-19-openjdk/",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        -- null-ls
        enabled = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/ftplugin/formatting/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      useBlocks = true,
      generateComments = true,
    },
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
}

local new_cmd = vim.api.nvim_create_user_command
new_cmd("JdtCompileInc", function()
  require("jdtls").compile "incremental"
end, {})
new_cmd("JdtCompileFull", function()
  require("jdtls").compile "full"
end, {})
new_cmd("JdtBuildProject", function(opts)
  require("jdtls").build_projects(opts)
end, {nargs = '*'})
new_cmd("JdtUpdateConfig", function()
  require("jdtls").update_project_config()
end, {})
new_cmd("JdtJol", function()
  require("jdtls").jol()
end, {})
new_cmd("JdtBytecode", function()
  require("jdtls").javap()
end, {})
new_cmd("JdtJshell", function()
  require("jdtls").jshell()
end, {})
new_cmd("JdtOrgImp", function()
  require("jdtls").organize_import()
end, {})
new_cmd("JdtExtVar", function()
  require("jdtls").extract_variable()
end, {})
new_cmd("JdtExtConst", function()
  require("jdtls").extract_constant()
end, {})
new_cmd("JdtExtMet", function()
  require("jdtls").extract_method()
end, {})


-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
