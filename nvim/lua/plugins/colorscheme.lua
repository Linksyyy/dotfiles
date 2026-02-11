return {
  -- Catppuccin Mocha - bem escuro com tons roxos
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha (mocha é o mais escuro)
      transparent_background = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      color_overrides = {
        mocha = {
          base = "#000000", -- fundo ainda mais escuro
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },
  
  -- Configure o LazyVim para usar o tema
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
