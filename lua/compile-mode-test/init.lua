local compile_mode = require("compile-mode")
local api = vim.api

local M = {}

M.config = {
    adapters = {
        require("compile-mode-test.adapters.zig"),
    },
}

local function get_adapter(config)
    local current_buffer = api.nvim_get_current_buf()

    for _, plug in ipairs(config.adapters) do
        if plug.is_enabled(current_buffer) then
            return plug
        end
    end
end

function M.run_line()
    local adapter = get_adapter(M.config)
    local current_buffer = api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())

    return compile_mode.compile({
        args = adapter.run_line(current_buffer, cursor_pos),
        smods = { vertical = false },
    })
end

function M.run_file()
    local adapter = get_adapter(M.config)
    local current_buffer = api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())

    return compile_mode.compile({
        args = adapter.run_file(current_buffer, cursor_pos),
        smods = { vertical = false },
    })
end

function M.run_dir()
    local adapter = get_adapter(M.config)
    local current_buffer = api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())

    return compile_mode.compile({
        args = adapter.run_dir(current_buffer, cursor_pos),
        smods = { vertical = false },
    })
end

function M.run_all()
    local adapter = get_adapter(M.config)
    local current_buffer = api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())

    return compile_mode.compile({
        args = adapter.run_all(current_buffer, cursor_pos),
        smods = { vertical = false },
    })
end

M.setup = function(config)
    M.config = config
end

return M
