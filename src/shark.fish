function shark -d "Sparkline Generator"
    set -l field "%s"
    set -l record "\n"
    set -l delim "[, ]"
    set -l line 0
    set -l min -1
    set -l max 0
    set -l null " "

    set -l shark_version

    getopts $argv | while read -l 1 2
        switch $1
            case n line
                set line 1
                switch "$2"
                    case 0 false
                        set line 0
                end

            case null
                set null "$2"

            case m min
                set min "$2"

            case M max
                set max "$2"

            case f field
                set field "$2"

            case r record
                set record "$2"

            case d delim
                set delim "$2"

            case v version
                printf "shark version %s\n" $shark_version
                return

            case h help
                printf "usage: shark [--line] [--field[=<format>]] [--record[=<format>]]  \n"
                printf "             [--max=<n>] [--min=<n>] [--delim=<regex>] [--help] \n\n"

                printf "               -n --line  Process each line as a record         \n"
                printf "     -f --field=<format>  Set field output format               \n"
                printf "    -r --record=<format>  Set record output format              \n"
                printf "       -m --min=<number>  Set minimum numeric value             \n"
                printf "       -M --max=<number>  Set maximum numeric value             \n"
                printf "      -d --delim=<regex>  Use <regex> as number separator       \n"
                printf "         --null=<string>  Use <string> to display null values   \n"
                printf "            -v --version  Show version information              \n"
                printf "               -h --help  Show this help                        \n"
                return

            case \*
                printf "shark: '%s' is not a valid option\n" $1 >& 2
                shark --help >& 2
                return 1
        end
    end

    set -lx LC_ALL "en_US.UTF-8"

    awk -v FS="$delim"      \
        -v line=$line       \
        -v ORS="$record"    \
        -v OFS="$field"     \
        -v null="$null"     \
        -v min="$min"       \
        -v max="$max" '

        ##shark.awk##
    '
end
