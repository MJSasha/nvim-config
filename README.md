# Neovim Configuration

1. **Lazy Loading:** The configuration uses lazy loading with the `lazy.nvim` plugin. This helps improve startup times by loading plugins and their dependencies only when they are needed, enhancing the overall performance of Neovim.
2. **Telescope Integration:** The setup includes the popular `telescope.nvim` plugin for fuzzy finding, making file navigation, and other tasks more efficient and user-friendly.
3. **LSP Support:** There is robust Language Server Protocol (LSP) support through plugins like `nvim-lspconfig`, `cmp-nvim-lsp`, and `cmp-nvim-lsp-signature-help`, enhancing code navigation, autocompletion, and overall development experience.
4. **Git Integration:** The configuration incorporates `gitsigns.nvim` for Git integration, providing visual cues for Git changes in the code.
5. **Status Line and Icons:** The setup includes a feature-rich status line with `lualine.nvim` and icons with `nvim-web-devicons`, enhancing the visual appeal and information available in the Neovim interface.
6. **Mason Integration:** The configuration includes `mason.nvim` for managing project dependencies, making it easier to handle external dependencies in Neovim plugins.
7. **Toggleterm:** The integration of `toggleterm.nvim` allows for easily toggling a terminal within Neovim, improving the workflow for tasks that require terminal interaction.
8. **Autopairs:** `nvim-autopairs` is included for automatic pairing of brackets, parentheses, etc., streamlining code writing and reducing errors.
9. **Outline View:** The setup incorporates `outline` and `nvim-tree` for an organized and hierarchical view of the code structure.
10. **Dashboard:** The inclusion of `dashboard-nvim` enhances the startup experience by providing a customizable dashboard for easy access to files and projects.
11. **Which Key:** `which-key.nvim` is included for keybinding exploration, making it easier for users to discover and remember available keybindings.
12. **Gruvbox Theme:** The `gruvbox.nvim` theme is configured with options for visual customization, allowing users to personalize the appearance of Neovim.
13. **Flash for Code Highlighting:** The setup includes `flash.nvim` for highlighting and searching code within Neovim, improving visibility and code exploration.
14. **Auto Save:** `auto-save.nvim` is included for automatic saving of files, reducing the risk of data loss and providing a smoother editing experience.
15. **Markdown Preview:** The configuration integrates `markdown-preview.nvim` for previewing Markdown files directly within Neovim.
16. **Neo Tree File Explorer:** `neo-tree.nvim` is used for file navigation with tree-style exploration.
17. **CSS Color Preview:** `vim-css-color` is included for visualizing CSS colors directly in the code.
18. **Neoscroll:** `neoscroll.nvim` provides smooth scrolling within Neovim, enhancing the overall user experience.
19. **Better Quickfix:** `nvim-bqf` improves the Quickfix window with better navigation and features.
20. **Surround:** `nvim-surround` is configured for easy manipulation of surroundings (parentheses, quotes, etc.) in the code.
21. **Treesj:** `treesj` is included for code navigation and manipulation with shortcuts, making it convenient for users to manage and traverse code.
22. **Todo Comments:** `todo-comments.nvim` helps in tracking and managing TODO comments in the codebase.
23. **Markdown Preview:** `markdown-preview.nvim` allows for easy previewing of Markdown files.
24. **Visual Multi:** `vim-visual-multi` enhances visual selection and editing capabilities within Neovim.

These features collectively contribute to a powerful and feature-rich Neovim configuration, providing an improved development environment for users.

## Installing the Neovim configuration

1. Make sure that you have Neovim installed.
2. Install Node.js and Chocolatey.
3. Run the following commands in administrator mode:

```bash
choco install grep
choco install lazygit
```

4. Clone this repository to `~/Local/AppData/nvim/`:

```bash
git clone https://github.com/MJSasha/nvim-config.git ~/Local/AppData/vim
```

5. Launch Neovim and wait for the plugins to load.
