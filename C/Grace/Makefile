NAME = Grace

SRC_FILES = Grace.c

OBJ_FILES = $(SRC_FILES:.c=.o)

all: $(NAME)

$(NAME): $(OBJ_FILES)
	gcc -Wall -Wextra -Werror -o $(NAME) $(OBJ_FILES)

%.o: %.c
	gcc -Wall -Wextra -Werror -c $^ -o $@

diff: $(NAME)
	./$(NAME)
	diff Grace.c Grace_kid.c	

clean:
	rm -f $(OBJ_FILES)
	rm -f Grace_kid.c

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re diff