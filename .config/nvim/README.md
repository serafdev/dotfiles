# Neovim Configuration - Quick Reference

## Opening Files/Folders

**Open a folder:**
```bash
nvim .                    # Open current directory
nvim /path/to/folder      # Open specific folder
```

**From inside nvim:**
- `<leader>xf` or `:Ex` - File explorer (like Emacs `C-x C-f`)
- `<leader>pf` - Fuzzy find files in project
- `<leader>pg` - Find git-tracked files
- `:e filename` - Edit/create file

## Key Bindings (Emacs-friendly)

**Leader key:** `Space`  
**Local leader:** `,`

### File Operations
- `<leader>xf` - File explorer (netrw)
- `<leader>pf` - Telescope find files
- `<leader>pg` - Telescope git files  
- `<leader>ps` - Search text in project (grep)

### LSP (Language Server)
- `gd` - Go to definition
- `gf` - Format code  
- `K` - Show documentation/hover
- `gR` - Rename symbol
- `gA` - Code actions
- `gl` - Show line diagnostics

### Navigation
- `h/j/k/l` - Left/Down/Up/Right
- `w/b` - Word forward/backward
- `gg/G` - Top/bottom of file
- `C-u/C-d` - Page up/down

### Editing
- `i` - Insert mode
- `A` - Insert at end of line
- `o/O` - New line below/above
- `dd` - Delete line
- `yy` - Yank (copy) line
- `p/P` - Paste after/before

### Windows/Splits
- `:sp` - Horizontal split
- `:vsp` - Vertical split  
- `C-w h/j/k/l` - Navigate splits
- `C-w c` - Close window

### Completion (Insert Mode)
- `C-n/C-p` - Next/previous completion
- `C-Space` - Trigger completion
- `CR` (Enter) - Accept completion
- `C-e` - Cancel completion

## Essential Commands

### Saving/Quitting
- `:w` - Save file
- `:q` - Quit
- `:wq` or `ZZ` - Save and quit
- `:q!` - Quit without saving

### Package Management  
- `:PackerSync` - Install/update plugins
- `:PackerClean` - Remove unused plugins
- `:PackerStatus` - Check plugin status

### LSP/Mason
- `:Mason` - Open LSP server manager
- `:LspInfo` - Show LSP status
- `:checkhealth vim.lsp` - Check LSP health

### Git (Neogit)
- `:Neogit` - Open git interface

### Undo/Redo
- `u` - Undo
- `C-r` - Redo  
- `:UndotreeToggle` - Visual undo tree

## File Explorer (netrw) Commands

When in file explorer (`<leader>xf`):
- `Enter` - Open file/folder
- `-` - Go up directory
- `%` - Create new file
- `d` - Create new directory
- `D` - Delete file/folder
- `R` - Rename file/folder

## Search and Replace
- `/pattern` - Search forward
- `?pattern` - Search backward  
- `n/N` - Next/previous match
- `:%s/old/new/g` - Replace all in file
- `:s/old/new/g` - Replace in current line

## Tips for Emacs Users
- Think of `<leader>` as your new `C-x` prefix
- `<leader>pf` replaces `C-x C-f` for finding files
- `gd` is like `M-.` for go-to-definition
- Visual mode (`v`) is like Emacs regions
- `:` command mode is like Emacs `M-x`

## Modes
- **Normal** - Navigate and execute commands (default)
- **Insert** - Type text (`i` to enter, `Esc` to exit)
- **Visual** - Select text (`v` to enter)
- **Command** - Run commands (`:` to enter)