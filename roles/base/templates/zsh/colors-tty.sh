#!/bin/sh

[ "${TERM:-none}" = "linux" ] && \
    printf '%b' '\e]P0{{ color_black_low | remove_hash_from_hex_color }}
                 \e]P1{{ color_red | remove_hash_from_hex_color }}
                 \e]P2{{ color_green | remove_hash_from_hex_color }}
                 \e]P3{{ color_yellow | remove_hash_from_hex_color }}
                 \e]P4{{ color_blue | remove_hash_from_hex_color }}
                 \e]P5{{ color_magenta | remove_hash_from_hex_color }}
                 \e]P6{{ color_cyan | remove_hash_from_hex_color }}
                 \e]P7{{ color_white_high | remove_hash_from_hex_color }}
                 \e]P8{{ color_black_high | remove_hash_from_hex_color }}
                 \e]P9{{ color_red_high | remove_hash_from_hex_color }}
                 \e]PA{{ color_green_high | remove_hash_from_hex_color }}
                 \e]PB{{ color_yellow_high | remove_hash_from_hex_color }}
                 \e]PC{{ color_blue_high | remove_hash_from_hex_color }}
                 \e]PD{{ color_magenta_high | remove_hash_from_hex_color }}
                 \e]PE{{ color_cyan_high | remove_hash_from_hex_color }}
                 \e]PF{{ color_white_high | remove_hash_from_hex_color }}
                 \ec'

