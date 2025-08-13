-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {

  -- Normal mode
  n = {
    -- Save
    ["<leader>w"] = { "" },
    ["<leader>ww"] = { "<cmd>w<cr>", desc = "Save" },

    -- Quit
    ["<C-q>"] = { "" },
    ["<leader>q"] = { "" },
    ["<leader>qq"] = { "<cmd>confirm q<cr>", desc = "Quit" },

    -- Cursor
    ["J"] = { "" },
    ["K"] = { "" },
    ["H"] = { "" },
    ["L"] = { "" },

    -- Typo ※teh の h で t を押して the に直す
    ["t"] = { "<left>xp", desc = "Correct the typo" },

    -- Newline
    ["<cr>"] = { "o<esc>", desc = "Append new line" },
    ["<leader><cr>"] = { "O<esc>", desc = "Insert new line before" },

    -- Line edit 
    ["<leader>+"] = { "J", desc = "Concatenate lines" },
    ["<leader>;"] = { "i<cr><esc>", desc = "Split a line" },

    -- Delete
    ["Y"] = { "y$", desc = "Delete to end of line" },
    ["x"] = { '"_x', desc = "Do not copy to clipboard when x is pressed" },
    ["X"] = { '"_X', desc = "Do not copy to clipboard when X is pressed" },
    ["c"] = { '"_c', desc = "Do not copy to clipboard when c is pressed" },
    ["C"] = { '"_C', desc = "Do not copy to clipboard when C is pressed" },
    ["s"] = { '"_s', desc = "Do not copy to clipboard when s is pressed" },
    ["S"] = { '"_S', desc = "Do not copy to clipboard when S is pressed" },
  },

  -- Insert mode
  i = {
  },

  -- Visual mode
  v = {
    -- indent
    ["<"] = { "<gv", desc = "Decrease indent" },
    [">"] = { ">gv", desc = "Increase indent" },

    -- move lines
    ["J"] = { ":move '>+1<cr>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2<cr>gv-gv", desc = "Move lines of code down" },
  },

  -- Terminal mode
  t = {
  },

}
