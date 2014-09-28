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

