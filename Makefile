DEPS += xclip \
	   ripgrep \
	   bash-completion \
	   fd \
	   codespell

.PHONY: all deps

all: deps

deps:
	sudo pacman --needed -S $(DEPS)

