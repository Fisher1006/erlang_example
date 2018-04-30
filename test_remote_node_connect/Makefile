
ERL       = erl
SRC_DIR   = src
EBIN_DIR  = ebin

LIBDIR    = $(shell erl -eval 'io:format("~s~n", [code:lib_dir()])' -s init stop -noshell)
VERSION   = $(shell cat VERSION | tr -d '\n')
CFLAGS    = -pa $(EBIN_DIR)
CC        = $(ERL) $(CFLAGS)
APP_NAME  = trnc

all: clean compile

clean:
	rm -f $(EBIN_DIR)/*;
	rm -f erl_crash.dump

compile:
	@$(CC) -noinput +B -eval 'case make:all() of up_to_date -> halt(0); error -> halt(1) end.'
	cp -f $(SRC_DIR)/*.app $(EBIN_DIR);


