return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = false,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
