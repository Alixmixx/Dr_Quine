NAME = Colleen

SRC_FILES = Colleen.c

OBJ_FILES = $(SRC_FILES:.c=.o)

all: $(NAME)

$(NAME): $(OBJ_FILES)
	gcc -Wall -Wextra -Werror -o $(NAME) $(OBJ_FILES)

%.o: %.c
	gcc -Wall -Wextra -Werror -c $^ -o $@

diff: $(NAME)
	./$(NAME) > Colleen_kid.c
	diff Colleen.c Colleen_kid.c	

clean:
	rm -f $(OBJ_FILES)
	rm -f Colleen_kid.c

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re diff