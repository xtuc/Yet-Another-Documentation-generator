all:
	make build

build:
	make build-flex
	make build-bison
	g++ \
		-lmstch \
		-std=gnu++0x \
		main.cpp \
		gen/gen.cpp \
		y.tab.c \
		lex.yy.c

build-bison:
	bison -t -d parser/Grammar.y -o y.tab.c

build-flex:
	flex -i -o lex.yy.c lexer/Lexer.l

clean:
	rm -rf \
		./lex.yy.c \
		./y.tab.c \
		./y.tab.h \
		./stack.h.h \
		a.out
