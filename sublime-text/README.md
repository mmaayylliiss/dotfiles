# README

### Step 1
First, install [Package Control](https://packagecontrol.io/installation), the Sublime Text package manager.

### Step 2
Then install these packages using Package Control:
* ayu
* BracketHighlighter
* Color Highlighter
* HTML-CSS-JS Prettify
  1. Set node path in `HTMLPrettify.sublime-settings` (E.g.: `"osx": "/Users/maylisagniel/.asdf/installs/nodejs/9.3.0/bin/node"` line 9)
  2. Add `"indent_size": 2` in `.jsbeautifyrc`
* Jade
* MarkdownLight
* PHP-Twig
* Pug
* Sass
* SideBarEnhancements
* Vue Syntax Highlight

### Step 3
Finally, add `subl` bin to `/usr/local/bin` (required to use `subl` shortcut in Terminal):
```bash
ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin
```

### Bonus
[5 great visual tweaks for Sublime Text](https://wesbos.com/sublime-text-5-visual-tweaks/)
