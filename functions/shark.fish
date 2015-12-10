# NAME
#      shark - sparklines for your fish
#
# SYNOPSIS
#     shark [-h|--help] <value>[,...]
#
# DESCRIPTION
#     Parse a string or stream of characters and generate sparklines
#     for any real positive numbers in a dataset.
#
# EXAMPLES
#     shark 1 5 22 13 53
#       ▁▁▃▂█
#     shark 0,30,55,80,33,150
#       ▁▂▃▄▂█
#     echo 1/2/3/5/6/7/5/8/2 | shark
#       ▁▂▃▅▆▇▅█▂
#     echo 9 13 5 17 1 | shark
#       ▄▆▂█▁
#
# AUTHORS
#      Jorge Bucaran <jbucaran@me.com>
#
# CREDITS
#      Ported to OMF by Stephen Coakley <me@stephencoakley.com>
#      Based on Zach Holman's Spark [github.com/holman/spark]
#
# v0.1.0
#/
function shark -d "Parse a string or stream of characters and generate sparklines for any real positive numbers in a dataset."
  if test (count $argv) -lt 1
    cat ^/dev/null | while read -l line
      set argv $argv $line
    end
  else
    # Show help if -h\* option is set or stdin (0) is a terminal.
    contains -- $argv[1] h -h --h --he --hel --help help
    or test (count $argv) -lt 1 -a -t 0
    and shark.help
      and return 0
  end

  set -l sparks ▁ ▂ ▃ ▄ ▅ ▆ ▇ █
  set -l argv (shark.split $argv)
  set -l list (printf "%s\n" $argv | sort --general-numeric-sort)
  set -l min $list[1]
  set -l max $list[-1]

  # At least 2 blocks to prevent zero division if data is constant.
  test $min -eq $max
    and set sparks ▅ ▆

  set -l fit (math "(($max)/1-($min)/1) * 2^8 / ("(count $sparks)"-1)")
  test $fit -lt 1
    and set fit 1

  for val in $argv
    echo -n $sparks[(math "(($val)/1-($min)/1) * 2^8 / $fit + 1")]
  end
end
