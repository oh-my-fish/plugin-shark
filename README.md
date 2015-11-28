# _shark_

> A [fish][Fish] port of [_spark_][spark] ▂▃▇▃▂▃▁

*(an [Oh My Fish!][OMF] fork of the [original])*

## Synopsis

Parse a string or stream of characters and generate sparklines for any real positive numbers in a dataset.

## Install

```fish
$ omf install shark
$ fish -c "for i in (seq 127); random; end" | shark
▁▂▇▂▃▇▅▆▅▁▅▅▁▆▇▁▁▅▁▁▆▅▅▃▁▅▃▆▁ ...
```

## Tests

_Shark_ comes fully tested and ready for production[¹][issues]. To run the tests:

```
$ chmod +x spec/test
$ spec/test
Testing Shark...
 Shows help with no argv or -h\* option ✔
 Charts piped data ✔
 Charts argv data ✔
 Charts way spaced data ✔
 Handles decimals ✔
 Charts 100 lt 300 ✔
 Charts 50 lt 100 ✔
 Charts 4 lt 8 ✔
 Charts no tier 0 ✔
 Equalizes at midtier on same data ✔
 Charts data in irregular formats ✔
 Neutralizes negative numbers ✔
```

## Usage Instructions

Run `shark <number>...` with a list of [real][real] numbers separated by spaces, commas, anything.

_Shark_ is designed to be used in conjunction with other scripts that can output in that format. You can run Shark through a pipe too and unleash all the power of Unix if you wish so.

```sh
$ shark 0 30 55 80 33 150
▁▂▃▅▂▇

$ shark 1 5 22 13 53
▁▁▃▂█

$ shark 0,30,55,80,33,150
▁▂▃▄▂█

$ echo 9 13 5 17 1 | shark
▄▆▂█▁
```

Invoke the help with `shark -h`.

## What can you do with _Shark_?

Number of commits to the github/github Git repository, by author:

```fish
› git shortlog -s |
      cut -f1 |
      shark
  ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▃▁▁▁▁▁▁▁▁▂▁▁▅▁▂▁▁▁▂▁▁▁▁▁▁▁▁▂▁▁▁▁▁▁▁▁▁▁▁▁▁▁
```

Magnitude of earthquakes over 1.0 in the last 24 hours:

```fish
› curl http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt --silent |
  sed '1d' |
  cut -d, -f9 |
  shark
  ▅▆▂▃▂▂▂▅▂▂▅▇▂▂▂▃▆▆▆▅▃▂▂▂▁▂▂▆▁▃▂▂▂▂▃▂▆▂▂▂▁▂▂▃▂▂▃▂▂▃▂▂▁▂▂▅▂▂▆▆▅▃▆
```

Code visualization. The number of characters of `shark` itself, by line, ignoring empty lines:

```fish
› awk '{ print length($0) }' shark.fish |
  grep -Ev 0 |
  shark
  ▁▁▁▁▅▁▇▁▁▅▁▁▁▁▁▂▂▁▃▃▁▁▃▁▃▁▂▁▁▂▂▅▂▃▂▃▃▁▆▃▃▃▁▇▁▁▂▂▂▇▅▁▂▂▁▇▁▃▁▇▁▂▁▇▁▁▆▂▁▇▁▂▁▁▂▅▁▂▁▆▇▇▂▁▂▁▁▁▂▂▁▅▁▂▁▁▃▁▃▁▁▁▃▂▂▂▁▁▅▂▁▁▁▁▂▂▁▁▁▂▂
```

## Credits

All credit to [Zach Holman](https://github.com/holman), author of the original [_Spark_][spark]:sparkles:

Thanks to [Jorge Bucaran](https://github.com/bucaran) for writing the original port.

## Bugs

Issue bugs [here][issues]. Contributions are always welcome.

## More

Check out the [official wiki][wiki] to see all the wicked cool usage for _Spark_, _Shark_ and relatives.

## License

[MIT][license] © [Jorge Bucaran](http://bucaran.me) et [al][contributors]

[issues]:       http://github.com/oh-my-fish/plugin-shark/issues
[Fish]:         https://fishshell.com
[spark]:        https://github.com/holman/spark
[original]:     https://github.com/bucaran/shark
[fish-tank]:    https://github.com/terlar/fish-tank
[real]:         http://en.wikipedia.org/wiki/Real_number
[OMF]:          https://github.com/oh-my-fish
[wiki]:         https://github.com/holman/spark/wiki/Wicked-Cool-Usage
[license]:      http://opensource.org/licenses/MIT
[contributors]: https://github.com/oh-my-fish/plugin-shark/graphs/contributors
