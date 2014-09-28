# testing related
alias cdd="source $HOME/bin/change_to_deployed_dir"
alias lsd="ls $HOME/deployments"

# genome command related
alias bv="genome model build view"
alias bs="genome model build status"
alias ba="genome model build abandon"

# park related
alias wpd="source $HOME/bin/workon_park_dev"
alias wpu="source /gscmnt/sata400/info/model_data/ParkBeta/workon_park_user.sh"
alias cdp='pushd $PARK_HOME'
alias ri='rex info -cipo'

# LSF
alias bsubu='bsub -u dmorton@genome.wustl.edu'
alias bq="bqueues | grep 'workflow\|apipe\|alignment-pd\|alignment\|^long\s\|short'"

alias tt='test-tracker'
alias v='test-tracker prove -v'
