alias ccc="ctags -R --exclude=.git* --exclude=.SDK* --exclude=cscope* --exclude=build* ."
alias gg="git grep -n"
alias gsh="git show"

function git_amend()
{
	git rebase -i ${1}~1
}

function git_rebase_onto()
{
	curr=git symbolic-ref --short -q HEAD
	git rebase --onto ${1} ${2} ${curr}
}

alias gm="git_amend"
alias gonto="git_rebase_onto"
alias ff="find . -name"
alias to="xargs"
alias gdc="git diff --ws-error-highlight=all --cached | diff-so-fancy"
alias gd="git diff --ws-error-highlight=all"
alias gck="git checkout"
alias gds="git diff | diff-so-fancy"
alias dl="diff-so-fancy | less"
setopt no_nomatch

function _ggc ()
{
	git add $1 -u;git commit --amend
}

alias ggc="_ggc"

function _ggr ()
{
	git add $1 -u;git rebase --continue
}

alias ggr="_ggr"

function git_zero()
{
	git checkout -- $1
}
alias g0="git_zero"
alias gR="grep -nR"


function git_delete_all_g()
{
	echo "Found files:"
	git grep -l ${1} ${2} | xargs echo
	git grep -l ${1} ${2} | xargs sed -i "/${1}/d"
}
alias gsedd="git_delete_all_g"

function git_replace_all_g()
{
	echo "Found files:"
	git grep -l ${1} ${3} | xargs echo
	git grep -l ${1} ${3} | xargs sed -i "s/${1}/${2}/g"
}
alias gseds="git_replace_all_g"