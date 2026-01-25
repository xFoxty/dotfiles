local keymap = vim.keymap.set

-- 插入模式下的 jj 退出
keymap("i", "jj", "<Esc>")

-- 插入模式下移动光标
keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-l>", "<Right>")
keymap("i", "<C-j>", "<Down>")
keymap("n", "<leader>o", "o<Esc>", { desc = "在下方创建空行" })
keymap("n", "<leader>O", "O<Esc>", { desc = "在上方创建空行" })
keymap("n", "x", '"_x')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "查找文件" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "全文搜索" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "切换缓冲区" })

-- LSP 快捷键设置
-- gd: 跳转到定义 (Go to Definition)
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "跳转到定义" })

-- gr: 查找引用 (Go to References)
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "查找引用" })

-- gi: 跳转到实现 (Go to Implementation)
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "跳转到实现" })

-- K: 显示悬浮文档 (Hover Documentation) - 类似 VS Code 鼠标悬停
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "显示文档说明" })
-- 一键重命名变量/函数 (Rename)
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名符号" })
-- 报错
-- 1. 查看当前光标的详细报错 (Diagnostic Float)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "显示当前行报错" })

-- 2. 跳转到上一个/下一个报错 (快速横跳)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "上一个报错" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "下一个报错" })
