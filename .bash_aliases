alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grubupdate='sudo mount /dev/sda3 /os1;sudo mount /dev/sda1 /os2;sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ramclean='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias configs='/usr/bin/git --git-dir=$HOME/Configs/configsRepo/ --work-tree=$HOME'
alias dt="date +'%a %b%d %Y'"
alias configsupdater='configs add -u;configs commit -m "`dt`";configs push origin master'
alias Codesupdater='cd ~/Codes;git add .;git commit -m "`dt`";git push origin master'
alias Linkupdater='cd ~/Codes/ClassLinks;git add -u;git commit -m "`dt`";git push origin master'
alias vconf='nvim ~/.config/nvim/init.vim'
alias zupdate='lua ~/.config/z.lua/z.lua --init fish > ~/.config/fish/functions/z.fish'
