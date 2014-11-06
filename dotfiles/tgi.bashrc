# gapp.bashrc sources $HOME/.bash_profile (and shouldn't?!) so this breaks recursion
if [ -z $GAPP_BASHRC_LOADED ]; then
    export GAPP_BASHRC_LOADED=1

    if [ -f /gapp/noarch/share/login/gapp.bashrc ]; then
        source /gapp/noarch/share/login/gapp.bashrc
    fi

    unset GAPP_BASHRC_LOADED
fi

if [ -f $HOME/.tgi.bash_aliases ]; then
    source $HOME/.tgi.bash_aliases
fi

# GPG public key
export MYGPGKEY=283A0250

# Function to find/open perl modules.
function plcd () { cd `wtf $1 | xargs dirname`; }
function plvi () { vi `wtf $1`; }

export PATH=$HOME/local_bin:$PATH

# prompt
display_test_env() {
    if [ ! -z $TESTENV ]; then
        echo "TESTENV=$TESTENV"
    fi
}

git_ps1() {
    local red=$(tput setaf 1)
    local green=$(tput setaf 2)
    local cyan=$(tput setaf 6)
    local blue=$(tput setaf 4)
    local clr=$(tput sgr0)

    export PS1="$clr
\d \@ $green\u${clr}@$cyan\h$clr:$(color_path $PWD) $(display_test_env) $red$(display_venv)$clr
$(display_git_branch)$ "
}

export PROMPT_COMMAND="git_ps1"
