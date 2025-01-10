return {
    {
        "yetone/avante.nvim",
        enabled = true,
        event = "VeryLazy",
        lazy = false,
        version = false,
        opts = {
            provider = "copilot",
            auto_suggestions_provider = "copilot",

            -- 動作設定
            behaviour = {
                auto_suggestions = false,
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
                minimize_diff = true,
            },

            -- ウィンドウ設定
            windows = {
                position = "right", -- サイドバーの位置
                wrap = true,        -- テキストの折り返し
                width = 30,         -- サイドバーの幅
                -- その他の詳細設定は省略
            },
        },
        -- 依存関係の設定
        dependencies = {
            -- 必須の依存関係
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- オプションの依存関係
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            -- その他の拡張機能
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
        },
    }
}
