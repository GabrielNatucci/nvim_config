return {
    "rcarriga/nvim-dap-ui",

    dependencies = {
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },

    config = function()
        local dap = require("dap")

        local dapui = require("dapui")

        vim.fn.sign_define('DapBreakPoint',
            { text = '✔ ', texthl = 'DapBreakPoint', linehl = 'DapBreakPoint', numhl = 'DapBreakPoint' })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dapui.setup()

        dap.adapters.java = function(callback)
            callback(
                {
                    type = "server",
                    host = "127.0.0.1",
                    port = port,
                }
            )
        end

        dap.configurations.java = {
            {
                type = 'java',
                request = 'attach',
                name = "Debug (Attach) - 8080",
                hostName = "127.0.0.1",
                port = 8080,
            },
        }

        dap.configurations.java = {
            {
                -- You need to extend the classPath to list your dependencies.
                -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
                classPaths = {},

                -- If using multi-module projects, remove otherwise.
                projectName = "yourProjectName",

                javaExec = "/path/to/your/bin/java",
                mainClass = "your.package.name.MainClassName",

                -- If using the JDK9+ module system, this needs to be extended
                -- `nvim-jdtls` would automatically populate this property
                modulePaths = {},
                name = "Launch YourClassName",
                request = "launch",
                type = "java"
            },
        }

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }
        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }

        dap.adapters.firefox = {
            type = 'executable',
            command = 'node',
            args = { os.getenv('HOME') .. '/dev_utils/vscode-firefox-debug/dist/adapter.bundle.js' },
        }

        dap.configurations.typescript = {
            {
                name = 'Debug front-end Firefox',
                type = 'firefox',
                request = 'launch',
                reAttach = true,
                url = 'http://localhost:3000',
                webRoot = '${workspaceFolder}',
                firefoxExecutable = '/usr/bin/firefox'
            }
        }

        dap.configurations.javascript = {
            {
                name = 'Debug front-end Firefox',
                type = 'firefox',
                request = 'launch',
                reAttach = true,
                url = 'http://localhost:3000',
                webRoot = '${workspaceFolder}',
                firefoxExecutable = '/usr/bin/firefox'
            }
        }
    end
}
