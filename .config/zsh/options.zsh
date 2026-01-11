# Zsh Options Configuration

# Directory navigation
setopt AUTO_CD                 # Type directory name to cd
setopt AUTO_PUSHD              # Make cd push to directory stack
setopt PUSHD_IGNORE_DUPS       # Don't push duplicates
setopt PUSHD_SILENT            # Don't print stack after pushd/popd

# Completion system
setopt COMPLETE_IN_WORD        # Complete from both ends
setopt ALWAYS_TO_END           # Move cursor after completion

# Enable advanced globbing
setopt EXTENDED_GLOB           # Use advanced wildcards
