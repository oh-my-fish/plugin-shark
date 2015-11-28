function shark.help
  echo "\
USAGE
    shark [-h|--help] <value>[,...]

EXAMPLES
    shark 1 5 22 13 53
      ▁▁▃▂█
    shark 0,30,55,80,33,150
      ▁▂▃▄▂█
    echo 1/2/3/5/6/7/5/8/2 | shark
      ▁▂▃▅▆▇▅█▂
    echo 9 13 5 17 1 | shark
      ▄▆▂█▁"
end
