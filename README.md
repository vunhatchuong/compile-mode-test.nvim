# Compile-mode Test

> [!WARNING]
> FOR MY PERSONAL USE, NOT TESTED IN ANY WAY

Wrapper around [compile-mode.nvim](https://github.com/ej-shafran/compile-mode.nvim)
with commands for running tests.

## Installation

```lua

return {
    {
        "vunhatchuong/compile-mode-test.nvim",
        dependencies = "ej-shafran/compile-mode.nvim",
        keys = {
            {
                "<leader>tl",
                "<CMD>CompileTestLine<CR>",
                desc = "[T]est Run [L]line",
            },
            {
                "<leader>tf",
                "<CMD>CompileTestFile<CR>",
                desc = "[T]est Run [F]ile",
            },
            {
                "<leader>td",
                "<CMD>CompileTestDir<CR>",
                desc = "[T]est Run [D]ir",
            },
            {
                "<leader>ta",
                "<CMD>CompileTestAll<CR>",
                desc = "[T]est Run [A]ll",
            },
        },
        config = function()
            require("compile-mode-test").setup({
                adapters = {
                    require("compile-mode-test.adapters.zig"),
                },
            })
        end,
    },
    {
        "ej-shafran/compile-mode.nvim",
        cmd = { "Compile", "Recompile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>ox", "<cmd>Compile<cr>", desc = "Compile" },
            { "<leader>or", "<cmd>Recompile<cr>" desc = "Recompile" },
        },
        config = function()
            vim.g.compile_mode = {}
        end,
    }
}

```

## References

- Copy some from [quicktest.nvim](https://github.com/quolpr/quicktest.nvim).
