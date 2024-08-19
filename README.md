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

## Usage

See commands in [plugin dir](./plugin/compile-mode-test.lua).

## References

- Copy some from [quicktest.nvim](https://github.com/quolpr/quicktest.nvim).
