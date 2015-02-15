sjs_files := $(wildcard src/*.sjs)
js_files := $(patsubst src/%.sjs, lib/%.js, $(sjs_files))
macros  := $(wildcard macros/*.sjs)
macros_flags := $(patsubst %, -m ./%, $(macros))

test:
	@echo "sjs_files=${sjs_files}"
	@echo "js_files=${js_files}"
	@echo "macros=${macros}"
	@echo "macros_flags=${macros_flags}"

all:	lib/$(js_files)

lib/%.js: src/%.sjs
	@[ -d lib] || mkdir -p lib
	sjs $< -o $@ ${macros_flags}

clean:
	rm -f $(js_files)

.PHONY: clean test
