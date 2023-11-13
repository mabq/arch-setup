#!/bin/sh

[ "${TERM:-none}" = "linux" ] && \
    printf '%b' '\e]P0{{ color_black_low }}
                 \e]P1{{ color_red }}
                 \e]P2{{ color_green }}
                 \e]P3{{ color_yellow }}
                 \e]P4{{ color_blue }}
                 \e]P5{{ color_magenta }}
                 \e]P6{{ color_cyan }}
                 \e]P7{{ color_white_high }}
                 \e]P8{{ color_black_high }}
                 \e]P9{{ color_red_high }}
                 \e]PA{{ color_green_high }}
                 \e]PB{{ color_yellow_high }}
                 \e]PC{{ color_blue_high }}
                 \e]PD{{ color_magenta_high }}
                 \e]PE{{ color_cyan_high }}
                 \e]PF{{ color_white_high }}
                 \ec'

