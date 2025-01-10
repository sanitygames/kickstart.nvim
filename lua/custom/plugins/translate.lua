return {
    'voldikss/vim-translator',

    keys = {
        -- { "<C-k>", function() require('in-and-out').in_and_out() end, mode = "i" }
        { "<leader>tt", "<Cmd>TranslateW<CR>",  mode = { 'n' }, { desc = "Translate" } },
        { "<leader>tt", ":'<,'>TranslateW<CR>", mode = { 'v' }, { desc = "Translate" } },
    },

    config = function()
        vim.g.translator_target_lang = 'ja'
        vim.g.translator_window_type = 'popup'
        vim.g.translator_default_engines = { 'google' }
        vim.g.translator_history_enable = true
        vim.g.translator_window_max_height = 0.9
    end

}
