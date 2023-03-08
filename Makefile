# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pvong <marvin@42lausanne.ch>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/08 14:49:58 by pvong             #+#    #+#              #
#    Updated: 2023/03/08 18:41:19 by pvong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

# Colors
GREEN			=	\033[0;32m
RED				=	\033[0;31m
BLUE			=	\033[0;34m
END				=	\033[0m

# LIBFT

LIBFT_DIR = org_libft
ISALNUM_DIR = $(addprefix $(LIBFT_DIR)/, ft_isalnum)
LIST_DIR = $(addprefix $(LIBFT_DIR)/, ft_list)
MEM_DIR = $(addprefix $(LIBFT_DIR)/, ft_mem)
PUT_DIR = $(addprefix $(LIBFT_DIR)/, ft_put)
STR_DIR = $(addprefix $(LIBFT_DIR)/, ft_str)

ISALNUM_SOURCES		=	ft_isalnum \
						ft_isalpha \
						ft_isascii \
						ft_isdigit \
						ft_isprint

ISALNUM_PREF		= $(addprefix ./$(ISALNUM_DIR)/, $(ISALNUM_SOURCES))
ISALNUM_SRC			= $(addsuffix .c, $(ISALNUM_PREF))

LIST_SOURCES		=	ft_lstadd_back \
						ft_lstadd_front \
						ft_lstdelone \
						ft_lstlast \
						ft_lstnew \
						ft_lstsize

LIST_PREF			= $(addprefix ./$(LIST_DIR)/, $(LIST_SOURCES))
LIST_SRC			= $(addsuffix .c, $(LIST_PREF))

MEM_SOURCES			=	ft_bzero \
						ft_calloc \
						ft_memchr \
						ft_memcmp \
						ft_memcpy \
						ft_memmove \
						ft_memset

MEM_PREF			= $(addprefix ./$(MEM_DIR)/, $(MEM_SOURCES))
MEM_SRC				= $(addsuffix .c, $(MEM_PREF))

PUT_SOURCES			=	ft_putchar_fd \
						ft_putendl_fd \
						ft_putnbr_fd \
						ft_putstr_fd

PUT_PREF			= $(addprefix ./$(PUT_DIR)/, $(PUT_SOURCES))
PUT_SRC				= $(addsuffix .c, $(PUT_PREF))

STR_SOURCES			=	ft_strchr \
						ft_strdup \
						ft_striteri \
						ft_strjoin \
						ft_strjoin \
						ft_strlcat \
						ft_strlcpy \
						ft_strlen \
						ft_strmapi \
						ft_strncmp \
						ft_strnstr \
						ft_strrchr \
						ft_strtrim \
						ft_substr \
						ft_tolower \
						ft_toupper \

STR_PREF			=	$(addprefix ./$(STR_DIR)/, $(STR_SOURCES))
STR_SRC				=	$(addsuffix .c, $(STR_PREF))

LIBFT_OTHERS		=	ft_atoi \
						ft_itoa \
						ft_split

LIBFT_OTHERS_PREF	=	$(addprefix ./$(LIBFT_DIR)/, $(LIBFT_OTHERS))
LIBFT_OTHERS_SRC	=	$(addsuffix .c, $(LIBFT_OTHERS_PREF))

LIBFT_SOURCES		=	$(ISALNUM_SOURCES) \
						$(LIST_SOURCES) \
						$(MEM_SOURCES) \
						$(PUT_SOURCES) \
						$(STR_SOURCES) \
						$(LIBFT_OTHERS)


LIBFT_SRC =	$(ISALNUM_SRC) \
			$(LIST_SRC) \
			$(MEM_SRC) \
			$(PUT_SRC) \
			$(STR_SRC) \
			$(LIBFT_OTHERS_SRC)

# FT_PRINTF

PRINTF_DIR = ft_printf

PRINTF_SOURCES	=	ft_printf \
					ft_printhex \
					ft_printnbr \
					ft_printptr

PRINTF_PREF		=	$(addprefix ./$(PRINTF_DIR)/, $(PRINTF_SOURCES))
PRINTF_SRC		=	$(addsuffix .c, $(PRINTF_PREF))

# GNL

GNL_DIR = gnl

GNL_SOURCES		=	get_next_line \
					get_next_line_utils

GNL_SOURCESB	=	get_next_line_bonus \
					get_next_line_utils_bonus

GNL_PREF		=	$(addprefix ./$(GNL_DIR)/, $(GNL_SOURCES))
GNL_PREFB		=	$(addprefix ./$(GNL_DIR)/, $(GNL_SOURCESB))

GNL_SRC			=	$(addsuffix .c, $(GNL_PREF))
GNL_SRCB		=	$(addsuffix .c, $(GNL_PREFB))

# SRC

SRC				=	$(LIBFT_SRC) \
					$(PRINTF_SRC) \
					$(GNL_SRC)

SOURCES			=	$(LIBFT_SOURCES) \
					$(PRINTF_SOURCES) \
					$(GNL_SOURCES)

SRCB			=	$(LIBFT_SRC) \
					$(PRINTF_SRC) \
					$(GNL_SRCB)

SOURCESB		=	$(LIBFT_SOURCES) \
					$(PRINTF_SOURCES) \
					$(GNL_SOURCESB)
# OBJS

OBJS_DIR		=	objs
OBJSB_DIR		=	objsb
OBJS			=	$(addprefix ./$(OBJS_DIR)/, $(addsuffix .o, $(SOURCES)))
OBJSB			=	$(addprefix ./$(OBJSB_DIR)/, $(addsuffix .o, $(SOURCESB)))

# COMPILATION

INC				=	-I ./includes
CC				=	gcc
CFLAGS			=	-Wall -Werror -Wextra
BONUS_CACHE		=	.bonus

all: $(NAME)

# all: ; $(info $$var is [${SRC}])

$(OBJS_DIR)/%.o: $(SRC)
	@mkdir -p $(OBJS_DIR)
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@
	@echo -n .

$(OBJSB_DIR)/%.o: $(SRCB)
	@mkdir -p $(OBJSB_DIR)
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@
	@echo -n .

$(NAME):	$(OBJS)
			@ar rcs $(NAME) $(OBJS)
			@echo "$(BLUE)\nCreated $@$(END)"

bonus:	$(BONUS_CACHE)

$(BONUS_CACHE):		$(OBJSB)
			@ar rcs $(NAME) $(OBJSB)
			@echo cache > $(BONUS_CACHE)
			@echo "$(BLUE)\nCreated $(NAME)$(END)"

git:
	git add .
	git commit -am "update"
	git push

clean:
			rm -rf $(OBJS_DIR)
			rm -rf $(OBJSB_DIR)
			rm -f $(BONUS_CACHE)

fclean:		clean
			rm -f $(NAME)

re:			fclean all

.PHONY: all fclean clean re
