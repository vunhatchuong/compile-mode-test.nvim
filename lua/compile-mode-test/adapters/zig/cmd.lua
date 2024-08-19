local M = {}

---@class ZigParams
---@field type "single"|"dir"
---@field file string | nil
---@field test_name string | nil

--- @param params ZigParams
--- @return string
function M.build(params)
    local cmd_parts = {}

    if params.type == "single" then
        table.insert(cmd_parts, "zig test")
    else
        return "zig build test --summary all"
    end

    if params.test_name and params.test_name ~= "" then
        table.insert(cmd_parts, '--test-filter "' .. params.test_name .. '"')
    end

    if params.file and params.file ~= "" then
        table.insert(cmd_parts, params.file)
    end

    return table.concat(cmd_parts, " ")
end

return M
