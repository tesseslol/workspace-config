## Vim

* H - move to top of screen
* M - move to middle of screen
* L - move to bottom of screen
* w - jump forwards to the start of a word W(puntaction)
* e - jump forwards to the end of a word E(puntaction)
* b - jump backwards to the start of a word(punctuation)
* 5gg or 5G - go to line 5
* gd - move to local declaration
* gD - move to global declaration
* } - jump to next paragraph (or function/block, when editing code)
* { - jump to previous paragraph (or function/block, when editing code)
* Ctrl + b - move back one full screen
* Ctrl + f - move forward one full screen
* Ctrl + d - move forward 1/2 a screen
* Ctrl + u - move back 1/2 a screen
* o - append (open) a new line below the current line
* #gt - move to tab number #
* # Find the previous/next occurrence of the token under the cursor.


* \>> - indent (move right) line one shiftwidth
* << - de-indent (move left) line one shiftwidth
* \>% - indent a block with () or {} (cursor on brace)             
      
    
* R - replace more than one character, until ESC is pressed.
* J - join line below to the current one with one space in between 
* ciw - change (replace) entire word
* S - delete line and substitute text (same as cc)  

* u - undo
* U - restore (undo) last changed line
* Ctrl + r - redo
* 2yy - yank (copy) 2 lines
* yw - yank (copy) the characters of the word from the cursor position to the start of the next word 
* Y - yank (copy) to end of line 

* p - put (paste) the clipboard after cursor (P for before)

* dd - delete (cut) a line
* 2dd - delete (cut) 2 lines
* dw - delete (cut) the characters of the word from the cursor position to the start of the next word
* diw - delete (cut) word under the cursor

* ma - set current position for mark A
* \`a - jump to position of mark A           
  
* Ctrl + ws - split window

* Ctrl + wv - split window vertically
* Ctrl + ww - switch windows
* Ctrl + wq - quit a window           
* Ctrl + shift +  e = focus file explorerJK
* ctrl+o ctrl+i Move backward/forward through the jump history. Useful if you have followed a chain of method calls and need to get back to where you were.
  

* Advanced
* ^ - jump to the first non-blank character of the line
* $ - jump to the end of the line
