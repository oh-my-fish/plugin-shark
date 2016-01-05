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
