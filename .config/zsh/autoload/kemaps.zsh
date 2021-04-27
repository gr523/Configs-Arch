autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey -a '^[^[' vi-insert

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
# #setup key accordingly
bindkey -- "${key[Home]}"       beginning-of-line
bindkey -- "${key[End]}"        end-of-line
bindkey -- "${key[Insert]}"     overwrite-mode
bindkey -- "${key[Backspace]}"  backward-delete-char
bindkey -- "${key[Delete]}"     delete-char
bindkey -- "${key[Up]}"         up-line-or-history
bindkey -- "${key[Down]}"       down-line-or-history
bindkey -- "${key[Left]}"       backward-char
bindkey -- "${key[Right]}"      forward-char
bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# #Finally, make sure the terminal is in application mode, when zle is
# #active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# #Hist Search
# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# 
# [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
# 
#Control-L/R to move between words
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

