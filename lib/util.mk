# match-target: find target rules in current file
# usage: 'all: $(call match-target,.*)'
# $1 match pattern
# $2 makefile name default: Makefile
define match-target
$(eval _PATTERN := $1)
$(eval _MAKE_FILE := $(if $2,$2,Makefile))
$(shell grep -oP '^$(_PATTERN):(?!=)' $(_MAKE_FILE) | sed 's/^ *//;s/ *:$$//')
endef