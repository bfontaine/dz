# dz

[![Build Status](https://travis-ci.org/bfontaine/dz.png?branch=master)](https://travis-ci.org/bfontaine/dz)
[![Gem Version](https://badge.fury.io/rb/dz.png)](http://badge.fury.io/rb/dz)
[![Coverage Status](https://coveralls.io/repos/bfontaine/dz/badge.png)](https://coveralls.io/r/bfontaine/dz)
[![Dependency Status](https://gemnasium.com/bfontaine/dz.png)](https://gemnasium.com/bfontaine/dz)

**dz** is a dead simple hexadecimal-to-binary tool. It’s used to create binaries
by hand.

## Install

```
gem install dz
```

## Usage

```
$ dz input.dz output
```

Give it two filenames. It’ll read the first one and write binary data into the
second one. That’s it!

Okay, one more thing: if you give `-` for the input, it'll read on stdin, and if
you give more than two files, it'll assume that the last one is the output and
all the others are parts of the input. So,

```sh
dz input{1,2,3}.dz output.bin
```

is equivalent to:

```sh
cat input{1,2,3}.dz | dz - output.bin
```

### Syntax

I use `.dz` for input files but you can use what you want, they are plain text
files.

Each byte is written as an hexadecimal number. Two bytes must be separated by
one or more spaces and/or newlines. Comments start with a `#` and take the whole
line. Non-hexadecimal chars (outside of comments) are ignored.

#### Example

```
# file header
34 | 00 | 0A 0A

# first part
01 | 00 | 00 00 02 | AA AF
# second part
01 | 0F | 00 00 06 | AA CC 89 3B 01 79
```

Save this in `example.dz`, then run:

```
$ dz example.dz example
```

you can now check the binary using `hexdump`:

```
$ hexdump example
0000000 34 00 0a 0a 01 00 00 00 02 aa af 01 0f 00 00 06
0000010 aa cc 89 3b 01 79
0000016
```

## Tests

```
$ git clone https://github.com/bfontaine/dz.git
$ cd dz
$ bundle install
$ bundle exec rake test
```

It’ll generate a `coverage/index.html`, which you can open in a Web browser.
