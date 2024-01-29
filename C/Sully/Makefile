NAME = Sully

SRC_FILES = Sully.c

OBJ_FILES = $(SRC_FILES:.c=.o)

all: $(NAME)

$(NAME): $(OBJ_FILES)
	gcc -Wall -Wextra -Werror -o $(NAME) $(OBJ_FILES)

%.o: %.c
	gcc -Wall -Wextra -Werror -c $^ -o $@

diff: $(NAME)
	./$(NAME)

clean:
	rm -f $(OBJ_FILES)
	rm -f $(NAME)_*.c

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME)_*

re: fclean all

.PHONY: all clean fclean re diff