# history
setopt hist_ignore_all_dups
setopt share_history
setopt histignorespace
export HISTSIZE=10000

# completion
setopt always_to_end
setopt complete_in_word

# var
setopt RM_STAR_WAIT # enable annoying confirmation before rm *. Just in case.
setopt no_beep # don't beep on error
setopt short_loops # for f in *; echo $f
