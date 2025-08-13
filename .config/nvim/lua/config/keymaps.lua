-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Mode
-- n(ノーマルモード): デフォルトモード
-- v(ビジュアルモード): テキストの選択を行うモード
-- x(ビジュアルモード): ブロック選択
-- i(インサートモード): テキストを入力するモード
-- s(セレクトモード): 特定の機能によるテキスト選択が行われるモード
-- o(オペレーターペンディングモード): オペレータの対象範囲を待機する状態
-- t(端末モード): 端末エミュレータとして使用されるモード
-- c(コマンドラインモード): コマンドを入力するモード

-- Save
map({ "n", "i", "x", "s" }, "<leader>w", "")
map({ "n", "i", "x", "s" }, "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Quit
map({ "n", "i", "x", "s" }, "<leader>q", "")
map({ "n", "i", "x", "s" }, "<leader>qq", "<cmd>confirm q<cr><esc>", { desc = "Quit" })

-- Cursor
map({ "n", "x", "s" }, "J", "")
map({ "n", "x", "s" }, "K", "")
map({ "n", "x", "s" }, "H", "")
map({ "n", "x", "s" }, "L", "")

-- Typo ※teh の h で t を押して the に直す
map({ "n" }, "t", "<left>xp", { desc = "Correct the typo" })

-- Newline
map({ "n" }, "<cr>", "o<esc>", { desc = "Append new line" })
map({ "n" }, "<leader><cr>", "O<esc>", { desc = "Insert new line before" })

-- Line edit
map({ "n" }, "<leader>+", "J", { desc = "Concatenate lines" })
map({ "n" }, "<leader>;", "i<cr><esc>", { desc = "Split a line" })

-- Delete
map({ "n" }, "Y", "y$", { desc = "Delete to end of line" })
map({ "n" }, "x", '"_x', { desc = "Do not copy to clipboard when the key is pressed" })
map({ "n" }, "X", '"_X', { desc = "Do not copy to clipboard when the key is pressed" })
map({ "n" }, "c", '"_c', { desc = "Do not copy to clipboard when the key is pressed" })
map({ "n" }, "C", '"_C', { desc = "Do not copy to clipboard when the key is pressed" })
map({ "n" }, "s", '"_s', { desc = "Do not copy to clipboard when the key is pressed" })
map({ "n" }, "S", '"_S', { desc = "Do not copy to clipboard when the key is pressed" })

-- Indent
map({ "x" }, "<", "<gv", { desc = "Decrease indent" })
map({ "x" }, ">", ">gv", { desc = "Increase indent" })

-- Move lines
map({ "x" }, "J", ":move '>+1<cr>gv-gv", { desc = "Move lines of code up" })
map({ "x" }, "K", ":move '<-2<cr>gv-gv", { desc = "Move lines of code down" })
