Basic Settings
--------------
* scrolloff to ensure context always shown above and below cursor
* central backup/undo directory to avoid littering the filesystem
* undofile to persist undo state
* various movement settings
* various indentation settings to use smart automatic two-space indenting
* Version checks to ensure config works with 7.3 and 7.4

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
* Gundo for complex undo history
* YouCompleteMe for fast, multipurpose autocomplete (fallback to supertab)
* airline for pretty status bar
* repeat/surround to simplify enclosing character management (brackets and quotes)
* extra syntax highlighting plugins
* netrw for directory navigation (fallback to NERDTree)
* color theme plugins
* nginx plugin is committed directly since it's from the nginx source repo
