return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter").setup({})

            local ensure_installed = {
                "c",
                "cpp",
                "lua",
                "python",
                "tsx",
                "typescript",
                "vim",
                "javascript",
                "regex",
                "markdown",
                "markdown_inline",
                "bash",
                "sql",
            }
            local installed = require("nvim-treesitter.config").get_installed()
            local to_install = vim.tbl_filter(function(lang)
                return not vim.list_contains(installed, lang)
            end, ensure_installed)
            if #to_install > 0 then
                require("nvim-treesitter.install").install(to_install)
            end

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                    if vim.bo[args.buf].filetype ~= "python" then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })

            -- Textobjects
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
                move = { set_jumps = true },
            })

            local ts_select = require("nvim-treesitter-textobjects.select")
            local ts_move = require("nvim-treesitter-textobjects.move")
            local ts_swap = require("nvim-treesitter-textobjects.swap")

            -- Select
            vim.keymap.set({ "x", "o" }, "aa", function() ts_select.select_textobject("@parameter.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ia", function() ts_select.select_textobject("@parameter.inner", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end)

            -- Move
            vim.keymap.set({ "n", "x", "o" }, "]m", function() ts_move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]]", function() ts_move.goto_next_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]M", function() ts_move.goto_next_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "][", function() ts_move.goto_next_end("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[m", function() ts_move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[[", function() ts_move.goto_previous_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[M", function() ts_move.goto_previous_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[]", function() ts_move.goto_previous_end("@class.outer", "textobjects") end)

            -- Swap
            vim.keymap.set("n", "<leader>)a", function() ts_swap.swap_next("@parameter.inner") end)
            vim.keymap.set("n", "<leader>)A", function() ts_swap.swap_previous("@parameter.inner") end)
        end,
    },
}
