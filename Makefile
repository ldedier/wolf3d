# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aherriau <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/13 16:38:41 by aherriau          #+#    #+#              #
#    Updated: 2018/01/05 07:07:40 by ldedier          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
PWD = $(shell pwd)
FRAMEWORKSDIR=$(PWD)/frameworks

INC=-I includes -I $(FRAMEWORKSDIR) -I libft

CFLAGS=-Wall -Wextra -Werror $(INC)

NAME = wolf3d

SRCDIR=srcs

INCLUDESDIR = includes

INCLUDES_NOPREFIX = main.h

SRC_NOPREFIX = ./main.c ./ft_utils.c ./ft_init.c ./ft_key.c ./ft_mouse.c ./ft_move.c\
	  ./ft_render.c ./ft_render_sprites.c ./ft_pick.c ./ft_interact.c\
	  ./ft_weapons.c ./ft_process_weapon.c ./ft_process_enemy.c\
	  ./ft_apply_filter.c ./ft_stack.c ./ft_door.c ./ft_init_enemy.c\
	  ./ft_process_spike_boss.c ./ft_render_hud.c ./ft_key_menu.c\
	  ./ft_mouse_menu.c ./ft_transitions.c ./ft_process_projectiles.c \
	  ./ft_process_butcher.c ./ft_process_sergent.c ./ft_process_vodoo.c\
	  ./ft_process_hitler.c ./ft_free_map.c ./ft_free_sdl.c ./ft_key_2.c\
	  ./ft_key_menu_2.c ./ft_key_menu_3.c ./ft_process_butcher_1.c\
	  ./ft_mouse_menu_click.c ./ft_mouse_menu_click_2.c ./ft_process.c\
	  ./ft_process_2.c ./ft_move_2.c ./ft_init_enemy_sprites_2.c\
	  ./ft_pick_up_1.c ./ft_pick_up_2.c ./ft_apply_surfaces_filter.c\
	  ./ft_free_sdl_2.c ./ft_init_tools.c ./ft_init_objects.c\
	  ./ft_init_textures.c ./ft_init_walls.c ./ft_init_walls_2.c\
	  ./ft_init_others.c ./ft_init_enemy_sprites_1.c ./ft_move_3.c\
	  ./ft_init_enemy_sprites_3.c ./ft_init_player.c ./ft_verify_map.c\
	  ./ft_verify_map_2.c ./ft_init_map.c ./ft_init_map_2.c ./ft_init_enemy_2.c\
	  ./ft_enemy_functions.c ./ft_weapon_interactions.c ./ft_render_2.c\
	  ./ft_render_3.c ./ft_render_4.c ./ft_render_5.c ./ft_process_enemy_2.c\
	  ./ft_process_enemy_3.c ./ft_process_enemy_4.c ./ft_process_enemy_5.c\
	  ./ft_process_enemy_6.c ./ft_process_enemy_7.c ./ft_render_sprites_2.c\
	  ./ft_load_sounds.c ./ft_play_sounds.c ./ft_process_hitler_1.c\
	  ./ft_process_vodoo_1.c ./ft_process_sergent_1.c ./ft_process_sergent_2.c\
	  ./ft_process_enemy_8.c ./ft_process_enemy_9.c ./ft_process_enemy_10.c\
	  ./ft_process_sergent_3.c ./ft_create_projectiles.c ./ft_key_menu_4.c\
	  ./ft_process_map.c

SRC = $(addprefix $(SRCDIR)/,$(SRC_NOPREFIX))
INCLUDES = $(addprefix $(INCLUDESDIR)/,$(INCLUDES_NOPREFIX))

OBJ = $(SRC:.c=.o)

LIBFT_DIR = libft

SDL2_FRAMEWORKS = -framework SDL2\
				  -framework SDL2_image\
				  -framework SDL2_mixer

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

LFLAGS = -L $(LIBFT_DIR) -lft $(CFLAGS) -Wl,-rpath $(FRAMEWORKSDIR)

all: $(NAME) -j8

$(NAME): $(OBJ)
	@$(MAKE) -C $(LIBFT_DIR)
	@$(CC) -o $@ $^ -F $(FRAMEWORKSDIR) $(SDL2_FRAMEWORKS) $(LFLAGS) $(CFLAGS) 
	@echo "$(green)Compilation finished: $(NAME)$(reset)"

%.o: %.c $(INCLUDES)
	$(CC) -o $@ -c $< -F $(FRAMEWORKSDIR) $(CFLAGS) 

clean:
	@$(MAKE) $@ -C $(LIBFT_DIR)
	@rm -f $(OBJ)
	@echo "$(green)Object files deleted: $(NAME)$(reset)"

fclean: clean
	@$(MAKE) $@ -C $(LIBFT_DIR)
	@rm -f $(NAME)
	@echo "$(green)Executable file deleted: $(NAME)$(reset)"

re: fclean all

.PHONY: clean fclean re
