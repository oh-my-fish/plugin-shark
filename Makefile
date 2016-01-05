MAN = man/man1
NAME := shark
FILE := $(NAME).fish
SOURCE = src/$(FILE)

.PHONY: all clean

all: $(FILE) $(MAN)/$(NAME).1
	
clean:
	rm -f $(FILE)

$(FILE): $(SOURCE) $(NAME).awk VERSION
	cat  $< > $@
	sed "/##$(NAME).awk##/r $(NAME).awk" $@ >> $@.1
	sed -E "s/(set -l $(NAME)_version).*/\1 `cat VERSION`/" $@.1 > $@.2
	mv -f $@.2 $@ && rm -f $@.{1,2}

$(MAN)/$(NAME).1: $(MAN)/$(NAME).md
	@ronn --manual=$(NAME) -r $^
