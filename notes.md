# Chapter 1

vim is designed for repetition. 
Common pattern: One keystroke for moving and one for applying a change.

## Keystrokes

- `>G` will increase indentation from this line to the end of the file
- vim will record every keystroke from when we enter insert mode until we switch back to insert mode.
- `A` will start append at the end of the line.
- ';' will repeat the last f, F, t, or T command.
  - ',' will repeat the last f, F, t, or T command in the opposite direction.
- '*' will search for the word under the cursor.
- 'c' accepts a motion and will delete everything in the motion and go into insert mode.
- 's' will delete the character under the cursor and go into insert mode.

# Chapter 2

Think about what defines a chunk that can be undone.
Everything from entering insert mode to going back to normal mode is a chunk.

Using an arrow key in insert mode will start a new "undo chunk."


## Keystrokes

- 'o' will open a new line below the current line and go into insert mode.
- 'daw' will delete a word.
- <C-a> will increment the number under the cursor.
- <C-x> will decrement the number under the cursor.
- 'yy' will yank the current line.
