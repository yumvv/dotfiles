# Setup
```bash
$ ./setup.sh
```
or
```bash
$ ./setup_xorg.sh
```

# Local setting

Bash でのカラーコード確認コマンド
```bash
$ for i in {000..255}; do echo -e "\e[38;05;${i}m ${i}"; done | column -c 160 -s ' '; echo -e "\e[m"
```
カラーコードを確認したら `~/.bashrc.local` に
```bash
HOSTCOLOR='\e[38;05;207m' #<- "207"の場所に好きなコードを入れる
export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Cyan [\w]$Color_Off\n$ "
```
