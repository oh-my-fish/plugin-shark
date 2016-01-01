set -l IFS \t
shark --help | __fish_parse_usage | while read -l 1 2 3
    complete -c shark -s "$3" -l "$2" -d "$1"
end
complete -xc shark -d "Sparkline generator" -a "\t"
