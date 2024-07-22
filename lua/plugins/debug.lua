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
                port = 8080,
            },
            {
                type = "server",
                host = "127.0.0.1",
                port = 8081,
            },
            {
                type = "server",
                host = "127.0.0.1",
                port = 8082,
            },
            {
                type = "server",
                host = "127.0.0.1",
                port = 8083,
            },
            {
                type = "server",
                host = "127.0.0.1",
                port = 8084,
            },
            {
                type = "server",
                host = "127.0.0.1",
                port = 8085,
            })
        end

        dap.configurations.java = {
            {
                type = 'java',
                request = 'attach',
                name = "Debug (Attach) - Remote",
                hostName = "127.0.0.1",
                port = 5005,
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
