# from pi theme (https://github.com/tobyjamesthomas/pi)
PROMPT=' ${return_status} %{$fg_no_bold[cyan]%}%n %{$fg_bold[yellow]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)${prompt_suffix}'

local return_status="%(?:🥔:🍠)"

local prompt_suffix="%{$fg_bold[magenta]%}❯%{$reset_color%} "

# by shashankmehta (https://github.com/shashankmehta)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%}) 💩"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%}) ✨"

# # LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="FxgxexcxhbhchdbhahHfAf"
export LS_COLORS="di=1;35:ln=36:so=34:pi=32:ex=37;41:bd=37;42:cd=37;43:su=31;47:sg=30;47:tw=1;37;45:ow=1;30;45"