<p align="center">
  <a href="http://github.com/bucaran/shark">
    <img alt="Shark" width=560px  src="https://cloud.githubusercontent.com/assets/8317250/12073365/6aae8b94-b160-11e5-8fbb-5eeef449d693.png">
  </a>
</p>

## About

Shark is a [sparkline][sparkline] generator for [fish][fish-shell].

This is a fork of the [official Shark repository][official], packaged to be installable for [Oh My Fish!][OMF].

## Install

With [Oh My Fish!][omf]:

```fish
omf install shark
seq 8 | shark
$ ▁▂▃▄▅▆▇█
```

To install with [Fisherman][fisherman], see the [official repository][official].

## Synopsis

A sparkline is a type of line chart that provides a simple representation of numerical or statistical variation in some measurement, typically over time.

Shark reads the standard input extracting numeric values and produces a stream of UTF-8 block characters of increasing height. Input is read up to NULL and processed as a single record by default. To process each line as a separate record, use the `--line` flag.

To process the input in real time, use `--max`=*number* and `--min`=*number* to set the dataset range in advance.

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

## Help

See [`shark(1)`][shark-1] for command usage and [examples][examples]. For support and feedback browse the [issues][issues].

## Bugs

Issue bugs [here][issues] at the official repository. Contributions are always welcome.

## Credits

Shark draws heavily from [Zach Holman](https://github.com/holman)'s original [_Spark_][spark]. Thanks to him.

## License

[MIT][license] © [Jorge Bucaran](http://bucaran.me) et [al][contributors]

[contributors]: https://github.com/oh-my-fish/plugin-shark/graphs/contributors
[examples]:     man/man1/shark.md#examples
[fish-shell]:   https://fishshell.com
[fisherman]:    https://github.com/fisherman/fisherman
[issues]:       https://github.com/bucaran/shark/issues
[license]:      http://opensource.org/licenses/MIT
[official]:     https://github.com/bucaran/shark
[omf]:          https://github.com/oh-my-fish
[real]:         http://en.wikipedia.org/wiki/Real_number
[screencast]:   https://asciinema.org/a/32942?autoplay=1
[shark-1]:      man/man1/shark.md
[spark]:        https://github.com/holman/spark
[sparkline]:    https://en.wikipedia.org/wiki/Sparkline
