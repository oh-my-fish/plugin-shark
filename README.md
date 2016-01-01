<p align="center">
  <a href="http://github.com/bucaran/shark">
    <img alt="Shark" width=600px  src="https://cloud.githubusercontent.com/assets/8317250/12072529/dfe649be-b125-11e5-82e5-ec9492b68002.png">
  </a>
</p>


[![][travis-badge]][travis-link]

## About

Shark is a [sparkline][sparkline] generator for [fish][fish-shell].

## Install

```fish
git clone https://github.com/bucaran/shark
cd shark
make install
seq 8 | shark
$ ▁▂▃▄▅▆▇█
```

With [Fisherman][fisherman]:

```fish
fisher install shark
```

## Help

See [`shark(1)`][shark-1] for command usage and [examples][examples]. For support and feedback browse the [issues][issues].

## Credits

Shark draws heavily from [Zach Holman](https://github.com/holman)'s original [_Spark_][spark]. Thanks to him.

<!-- Links  -->

[spark]:        https://github.com/holman/spark
[issues]:       http://github.com/bucaran/shark/issues
[shark-1]:      man/man1/shark.md
[examples]:     man/man1/shark.md#Examples
[sparkline]:    https://en.wikipedia.org/wiki/Sparkline
[fisherman]:    https://github.com/fisherman/fisherman
[fish-shell]:   https://github.com/fish-shell/fish-shell
[travis-link]:  https://travis-ci.org/bucaran/shark
[travis-badge]: https://img.shields.io/travis/bucaran/shark.svg?style=flat-square
