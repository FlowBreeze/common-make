define -comp
$(eval _COMP_TMP := $(shell mktemp))
@echo "current editing $(1)"
@echo "     l           <---->           r"
@echo "origin file      <---->     changed file"
@echo "----------------------------------------"
@sdiff -w $$(tput cols) --text -o $(_COMP_TMP) $(1) $(2) || [ $$? -eq 1 ] || (echo $1 will not update; exit 1)
cp $(_COMP_TMP) $1
rm -rf $(_COMP_TMP)
endef

# comp: merge origin and changed file then overwrite to origin
# this should be run in an interactive shell
# $1 origin file
# $2 changed file, only one
define comp
$(if $(wildcard $(1)),$(call -comp,$1,$2),cp $2 $1)
endef

# lnro: create readonly link
# $1 target file
# $2 link
define lnro
mount --bind -o ro $(realpath $1) $(realpath $2)
endef