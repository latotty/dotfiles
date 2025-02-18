export SHOW_AWS_PROMPT=false

# load zgen
source "${HOME}/.zgen/zgen.zsh"

export EDITOR=nano

export NVM_HOMEBREW=/opt/homebrew/opt/nvm/
# export NVM_LAZY=1
# export NVM_AUTOLOAD=0

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' auto-load yes
zstyle ':omz:plugins:nvm' silent-autoload yes

export BULLETTRAIN_CONTEXT_DEFAULT_USER=latotty
export BULLETTRAIN_STATUS_EXIT_SHOW=true
export BULLETTRAIN_KCTX_KUBECTL=true
export BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    context
    dir
    screen
    perl
    ruby
    virtualenv
    nvm
    aws
    kube_ps1
    go
    rust
    elixir
    git
    hg
    cmd_exec_time
)

function get_cluster_short() {
    case "$1" in
        arn:aws*)
            echo "aws:$(echo "$1" | cut -d ':' -f4):$(echo "$1" | cut -d / -f2)"
            ;;
        *)
            echo "$1"
    esac
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

function prompt_kube_ps1() {
    prompt_segment blue white "\u2388 ${KUBE_PS1_CONTEXT}:${KUBE_PS1_NAMESPACE}"
}

# Extend nvm, use last line of current
function prompt_nvm() {
  local nvm_prompt
  if type nvm >/dev/null 2>&1; then
    nvm_prompt=$(nvm current 2>/dev/null | tail -n1)
    [[ "${nvm_prompt}x" == "x" || "${nvm_prompt}" == "system" ]] && return
  elif type node >/dev/null 2>&1; then
    nvm_prompt="$(node --version)"
  else
    return
  fi
  nvm_prompt=${nvm_prompt}
  prompt_segment $BULLETTRAIN_NVM_BG $BULLETTRAIN_NVM_FG $BULLETTRAIN_NVM_PREFIX$nvm_prompt
}

# if the init script doesn't exist
if ! zgen saved; then

    # specify plugins here
    zgen oh-my-zsh

    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#aliases
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/nvm
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/macos
    zgen oh-my-zsh plugins/helm
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/kube-ps1

    zgen load lukechilds/zsh-better-npm-completion
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src

    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # generate the init script from plugins above
    zgen save
fi

# Extend https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/aws.plugin.zsh
function aws_profiles() {
    [[ ! -r "${AWS_CREDENTIALS_FILE:-$HOME/.aws/credentials}" && ! -r "${AWS_CONFIG_FILE:-$HOME/.aws/config}" ]] && return 1
    grep --color=never -hoEs '\[.*\]' "${AWS_CONFIG_FILE:-$HOME/.aws/config}" "${AWS_CREDENTIALS_FILE:-$HOME/.aws/credentials}" | sed -E 's/^[[:space:]]*\[(profile)?[[:space:]]*([-_[:alnum:]\.@]+)\][[:space:]]*$/\2/g' | sort | uniq
}

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# autoload -Uz compinit && compinit

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";

[ -n "$(go env GOBIN)" ] && export PATH="$(go env GOBIN):${PATH}"
[ -n "$(go env GOPATH)" ] && export PATH="$(go env GOPATH)/bin:${PATH}"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

eval "$(task --completion zsh)"

# pnpm
export PNPM_HOME="/Users/latotty/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/latotty/.lmstudio/bin"
