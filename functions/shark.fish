function shark -d "Sparkline Generator"
    set -l field "%s"
    set -l record "\n"
    set -l delim "[, ]"
    set -l line 0
    set -l min -1
    set -l max 0
    set -l null " "

    set -l shark_version

    while set optarg (getopts ":n:line: f:field: r:record: M:max: m:min: d:delim: n:null v:version h:help" $argv)
        switch $optarg[1]
            case n line
                set line 1
                switch "$optarg[2]"
                    case 0 false
                        set line 0
                end

            case null
                set null "$optarg[2]"

            case m min
                set min "$optarg[2]"

            case M max
                set max "$optarg[2]"

            case f field
                set field "$optarg[2]"

            case r record
                set record "$optarg[2]"

            case d delim
                set delim "$optarg[2]"

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
                printf "shark: '%s' is not a valid option\n" $optarg[1] >& 2
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
BEGIN {
    tickLength = split("▁ ▂ ▃ ▄ ▅ ▆ ▇ █", ticks, " ")

    hasMax = max > 0
    hasMin = min >= 0

    max = min > max ? min : max
}

!/^ *$/ {
    if (line) {
        fieldIndex = 0
        min = hasMin ? min : -1
        max = hasMax ? max : 0
    }

    for (n = 1; n <= NF; n++) {
        $n = buffer[++fieldIndex] = ($n ~ /^[0-9]*\.?[0-9]+$/) ? $n : ""

        if (!hasMax) max = ($n > max) ? $n : max
        if (!hasMin) min = (min < 0 || $n < min) ? ($n == "" ? min : $n) : min
        if (hasMax && hasMin) plot($n)
    }

    if (line) {
        if (!(hasMax && hasMin)) {
            plotBuffer(fieldIndex)
        }

        printf(ORS, max, min, fieldIndex)
    }
}

END {
    if (line || !fieldIndex) exit !fieldIndex
    if (!(hasMax && hasMin)) plotBuffer(fieldIndex)

    printf(ORS, max, min, fieldIndex)
}

function plot(value, tickIndex) {
    tickToken = null

    if (value >= 0) {

        tickIndex = int((value / (!max ? 1 : max) * tickLength) - 1) + 1

        tickIndex = (tickIndex <= 0) ? 1 : tickIndex
        tickIndex = (tickIndex > 8 || max == value) ? 8 : tickIndex
        tickIndex = (min == max) ? 5 : tickIndex
        tickIndex = (max == 0) ? 1 : tickIndex

        tickToken = ticks[tickIndex]
    }

    printf(OFS, tickToken, value)
}

function plotBuffer(fieldIndex) {
    for (i = 1; i <= fieldIndex; i++) {
        plot(buffer[i])
    }
}
    '
end