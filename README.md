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
=======
<p align="center">
  <a href="http://github.com/bucaran/shark">
    <img alt="Shark" width=560px  src="https://cloud.githubusercontent.com/assets/8317250/12073365/6aae8b94-b160-11e5-8fbb-5eeef449d693.png">
  </a>
</p>

[![][travis-badge]][travis-link]

## About

Shark is a [sparkline][sparkline] generator for [fish][fish-shell].

* See a [demo][screencast].


## Install

With [Fisherman][fisherman]:

```fish
fisher install shark
seq 8 | shark
$ ▁▂▃▄▅▆▇█
```

## Synopsis

A sparkline is a type of line chart that provides a simple representation of numerical or statistical variation in some measurement, typically over time.

Shark reads the standard input extracting numeric values and produces a stream of UTF-8 block characters of increasing height. Input is read up to NULL and processed as a single record by default. To process each line as a separate record, use the `--line` flag.

To process the input in real time, use `--max`=*number* and `--min`=*number* to set the dataset range in advance.


## Help

See [`shark(1)`][shark-1] for command usage and [examples][examples]. For support and feedback browse the [issues][issues].

## Credits

Shark draws heavily from [Zach Holman](https://github.com/holman)'s original [_Spark_][spark]. Thanks to him.

<!-- Links  -->

[spark]:        https://github.com/holman/spark
[issues]:       http://github.com/bucaran/shark/issues
[shark-1]:      man/man1/shark.md
[examples]:     man/man1/shark.md#examples
[sparkline]:    https://en.wikipedia.org/wiki/Sparkline
[fisherman]:    https://github.com/fisherman/fisherman
[screencast]:   https://asciinema.org/a/32942?autoplay=1
[fish-shell]:   https://github.com/fish-shell/fish-shell
[travis-link]:  https://travis-ci.org/bucaran/shark
[travis-badge]: https://img.shields.io/travis/bucaran/shark.svg?style=flat-square
