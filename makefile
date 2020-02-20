cc = clang
cflags = -O2

arrc: arrc_c main.arr
	./arrc_c < main.arr > main.s
	clang main.s -o $@
	# compile the compiler again, with the bootstrap
	./arrc < main.arr > main_bs.s
	clang main_bs.s -o $@

diff:
	diff main.s main_bs.s --side-by-side --color=always | less

arrc_c: main.c
	$(cc) -o $@ $^ $(cflags)

hello: hello.arr arrc
	./arrc_c < $^ > $@.s
	clang $@.s -o $@

clean:
	rm -f `cat .gitignore`
