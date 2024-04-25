return {
  "ThePrimeagen/harpoon",
  event = { "BufReadPre", "BufNewFile" },
  config = function() 
    local harpoon = require('harpoon')
    harpoon.setup({})

    local keymap = vim.keymap

    keymap.set("n", "<leader>ha", "<cmd>lua require(\"harpoon.mark\").add_file()<cr>")
    keymap.set("n", "<leader>hh", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
    keymap.set("n", "<leader>hj", "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>")
    keymap.set("n", "<leader>hk", "<cmd>lua require(\"harpoon.ui\").nav_prev()<cr>")


  end,
}
