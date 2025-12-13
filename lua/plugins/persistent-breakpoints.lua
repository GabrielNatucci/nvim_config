return {
    "Weissle/persistent-breakpoints.nvim",

    config = function()
        require('persistent-breakpoints').setup {
            save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
            load_breakpoints_event = "BufReadPost",
            perf_record = false,
            on_load_breakpoint = nil,
        }
    end
}
