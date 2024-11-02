# Good to know

## Shortcuts

* Check custom keymaps [here](../lua/config/keymaps.lua) will help.
* Disable format using `<leader>uf`

## Tips & Tricks

* `Alt+h/l` in insert mode - move cursor left or right.
* `Alt+j/k` in insert mode - move cursor line up/down.

* Using `s` will activate `flash` plugin, allowing fast movement inside the code.

* Check available custom keymaps using whichkey plugin:
  * Using `<leader>?`
  * Using Telescope search keymaps - `<leader>sk`

* Diagnostics
  * `[d or ]d` - jump between identified issues

* **Marks**
  * view marks: `:marks`
  * add mark: `ma` (or any letter after character after "m")
  * delete mark: `:delm mymark` or `:delm!` to delete everything

* Spelling built-in shortcuts.

  ```vim
  :set spell – Turn on spell checking
  :set nospell – Turn off spell checking
  ]s – Jump to the next misspelled word
  [s – Jump to the previous misspelled word
  z= – Bring up the suggested replacements
  zg – Good word: Add the word under the cursor to the dictionary
  zw – Woops! Undo and remove the word from the dictionary
  ```
