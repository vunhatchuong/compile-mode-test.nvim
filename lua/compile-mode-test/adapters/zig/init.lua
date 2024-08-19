local cmd = require("compile-mode-test.adapters.zig.cmd")
local ts_query = require("compile-mode-test.adapters.zig.query")
local ts = require("compile-mode-test.ts")

local M = {}

---@param bufnr integer
---@return boolean
M.is_enabled = function(bufnr)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    return vim.endswith(bufname, ".zig")
end

M.run_line = function(bufnr, cursor_pos)
    local file = vim.api.nvim_buf_get_name(bufnr)

    return cmd.build({
        type = "single",
        file = file,
        test_name = ts.get_current_test_name(ts_query, bufnr, cursor_pos, "test"):gsub('"', ""),
    })
end

---@param bufnr integer
---@return string
M.run_file = function(bufnr)
    local file = vim.api.nvim_buf_get_name(bufnr)
    return cmd.build({
        type = "single",
        file = file,
    })
end

---@param bufnr integer
---@return string
M.run_dir = function(bufnr)
    return cmd.build({ type = "dir" })
end

---@param bufnr integer
---@return string
M.run_all = function(bufnr)
    return cmd.build({ type = "dir" })
end

return M
