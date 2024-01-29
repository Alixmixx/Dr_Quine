NAME = Colleen

SRC_FILES = Colleen.s

OBJ_FILES = $(SRC_FILES:.s=.o)

all: $(NAME)

$(NAME): $(OBJ_FILES)
	gcc -o $(NAME) $(OBJ_FILES)

%.o: %.s
	nasm -f macho64 -o $@ $<

diff: $(NAME)
	./$(NAME)

clean:
	rm -f $(OBJ_FILES)

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME)_*

re: fclean all

.PHONY: all clean fclean re diff
