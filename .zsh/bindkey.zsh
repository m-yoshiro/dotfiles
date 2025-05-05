# Search history with fzf
fzf-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | fzf --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history
