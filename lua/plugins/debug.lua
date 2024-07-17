return {
    "rcarriga/nvim-dap-ui",

    dependencies = {
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },

    config = function ()
        local dap = require("dap")
        local dapui = require("dapui")

        -- dap.setup()
        dapui.setup()

        dap.adapters.java = function(callback)
            callback({
                type = "server";
                host = "127.0.0.1";
                port = port;
            })
        end

        dap.configurations.java = {
            {
                type = 'java';
                request = 'attach';
                name = "Debug (Attach) - Remote";
                hostName = "127.0.0.1";
                port = 5005;
            },
        }

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
    end
}

