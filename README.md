# Editor Config Repo

Mostly vim, but also stores some other misc + VS Code

# Vim Config

Basic Settings
--------------
* scrolloff to ensure context always shown above and below cursor
* central backup/undo directory to avoid littering the filesystem
* undofile to persist undo state
* various movement settings
* various indentation settings to use smart automatic two-space indenting
* Version checks to ensure config works with different versions and variants

Interesting Settings
--------------
* *Italics* (requires some terminal and font support), transparent terminal background
* Reopens files with cursor at previous position when possible
* Clipboard settings to use system clipboard when possible (only tested on OSX)
* make the s key insert a single character in normal mode as counterpart to x

Plugins
-------
* vim-plug for simple plugin installation, updates, and management
* CtrlP, MRU, and Ag/Ack for rapid navigation in arbitrary projects
* Arpeggio for keybinding shenanigans
* Fugitive / Extradite for git support, vim-signify to show changed lines inline
* NERDCommenter for comment toggling
* lightline for improved status bar
* undotree for visualization of undo history
* repeat/surround to simplify enclosing character management (brackets and quotes)
* extra syntax highlighting plugins
* color theme plugins
* nginx plugin is committed directly since it's from the nginx source repo
* shellcheck for saner shell scripts
