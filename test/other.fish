test "use custom string to display null values"
    (printf "%s\n" 1,,2,,3,,4 | shark --null="?") = "▂?▄?▆?█"
end

test "no data prints nothing and exits with a 1"
    1 = (
        echo | shark
        echo $status)
end

test "show help information"
    (shark -h | xargs) = "usage: shark [--line] [--field[=<format>]] [--record[=<format>]] [--max=<n>] [--min=<n>] [--delim=<regex>] [--help] -n --line Process each line as a record -f --field=<format> Set field output format -r --record=<format> Set record output format -m --min=<number> Set minimum numeric value -M --max=<number> Set maximum numeric value -d --delim=<regex> Use <regex> as number separator --null=<string> Use <string> to display null values -v --version Show version information -h --help Show this help"
end

test "show version information"
    (shark -v | cut -f1-2 -d " ") = "shark version"
end
