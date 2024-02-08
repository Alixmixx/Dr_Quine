NAME = Grace

SRC_FILES = Grace.s

OBJ_FILES = $(SRC_FILES:.s=.o)

all: $(NAME)

$(NAME): $(OBJ_FILES)
	gcc -g -o $(NAME) $(OBJ_FILES)

%.o: %.s
	nasm -f macho64 -o $@ $<

diff: $(NAME)
	./$(NAME)
	diff $(NAME).s $(NAME)_kid.s

clean:
	rm -f $(OBJ_FILES)

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME)_*

re: fclean all

.PHONY: all clean fclean re diff
