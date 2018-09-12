fortune -s -n 200 | hsterminal

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# custora cli
export PATH="#{~/custora_cli/bin}:$PATH"
# fixes mac forking problems: 
# https://blog.phusion.nl/2017/10/13/why-ruby-app-servers-break-on-macos-high-sierra-and-what-can-be-done-about-it/
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES 

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

function join () {
    echo "$*"
}

function quick_grep() {
   args=$(echo "$*")
   if [ "$1" = "" ]
   then
      return 1
   fi
   vi -c "Ack!'$args'"
}

# open fuzzy finder, search for files, use default program to open 
# and cd to dir of file
function smart_open() {
    if [ "$1" = "" ]
    then
        return 1
    fi
    file_kind=$(xdg-mime query filetype $1 | xargs xdg-mime query default)
    if [ "$file_kind" = "sublime_text.desktop" ] || [ "$file_kind" = "" ] || [ "$file_kind" = "atom.desktop" ] || [ "$file_kind" = "gvim.desktop" ]
    then
        vi $1
    else
        xdg-open $1
    fi
}


function smart_cd() {
   dir=$(dirname "$1") && cd "$dir"
}

# interrupt with c-n 
stty intr \^n


