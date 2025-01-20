return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = false,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return false
            end,
        }
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
