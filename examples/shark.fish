if not functions -q shark
    printf "error: shark not found. See README for install instructions.\n" >&2
    exit 1
end

set -l examples (dirname (status -f))
set -l columns (math $COLUMNS - 1)
set -l data https://gist.githubusercontent.com/bucaran/af98670d9c301c89b3ed/raw

echo "Draw a line."
seq 8 | shark

echo "Draw two lines processing each line as a separate dataset."
printf "%s\n" "1 2 3 4 5" "100 200 300 400 500" | shark -n

echo "Draw two lines processing each line as a single dataset."
printf "%s\n" "1 2 3 4 5" "100 200 300 400 500" | shark -nr
echo

echo "Draw two lines consisting of a compound dataset."
printf "%s\n" "1 2 3 4 5" "100 200 300 400 500" | shark

echo "Draw a random sequence of numbers."
for i in (seq $columns); random; end | shark

echo "Visualize bubble sort."
for i in (seq $columns)
    printf "%s " (random)
end | awk -f $examples/bs.awk | shark -nr\r
echo

echo "Visualize quick sort."
for i in (seq $columns)
    printf "%s " (random)
end | awk -f $examples/qs.awk | shark -nr\r
echo

echo "Display realtime data."
curl -s $data | shark --min=0 --max=32766 -nr\r
echo

echo "Display a moving wave through the terminal."
echo "Press Ctrl^C to exit."
while true
    printf "0$i + 1\n" | bc | read -l i
    ruby -e "
        (0..$COLUMNS - 1).collect{|x|
            printf '%s ', (6 * Math::cos((x + $i) * Math::PI/5)).ceil
        }
    " ^/dev/null | shark -d"[-| ]" --null="" -r\r
end
