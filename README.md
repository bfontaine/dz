# dz

[![Build Status](https://travis-ci.org/bfontaine/dz.png?branch=master)](https://travis-ci.org/bfontaine/dz)

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
$ rake test
```

Set the `COVERAGE` environment variable to activate the code
coverage report, e.g.:

```
$ export COVERAGE=1; rake test
```


It’ll generate a `coverage/index.html`, which you can open in a
Web browser.
