local command = vim.api.nvim_create_user_command
local compile_mode_test = require("compile-mode-test")

command("CompileTestLine", function(opts)
    compile_mode_test.run_line()
end, { nargs = "*" })

command("CompileTestFile", function(opts)
    compile_mode_test.run_file()
end, { nargs = "*" })

command("CompileTestDir", function(opts)
    compile_mode_test.run_dir()
end, { nargs = "*" })

command("CompileTestAll", function(opts)
    compile_mode_test.run_all()
end, { nargs = "*" })
