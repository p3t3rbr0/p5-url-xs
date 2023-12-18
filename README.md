# URL::XS

[![Build Status](https://github.com/ChaoticEvil/p5-url-xs/actions/workflows/ci.yml/badge.svg)](https://github.com/ChaoticEvil/p5-url-xs/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/ChaoticEvil/p5-url-xs/badge.svg?branch=master)](https://coveralls.io/github/ChaoticEvil/p5-url-xs?branch=master)
[![Cpants Kwalitee](https://cpants.cpanauthors.org/release/BRDUCH/URL-XS-0.3.1.svg)](https://cpants.cpanauthors.org/release/BRDUCH/URL-XS-0.3.1)
[![CPAN version](https://badge.fury.io/pl/URL-XS.svg)](https://badge.fury.io/pl/URL-XS)

URL::XS - perl binding to libyaurel (simple C library for parsing URLs with zero-copy and no mallocs).

## Motivation

I've not found in the CPAN repository a small, fast and simple library for parsing url.

The closest to my requirements was the library URI::XS from "Crazy Panda LTD". However, this package contains too much boilerplate code in the src/panda/*.

Therefore, I developed my implementation, which is a simple binding to the libyaurel library. As a result, we have one C-file (libyaurel library itself) and XS-code of three functions. URL::XS does nothing but url's direct parsing, but does it fast and robust.

This is how fast can it be estimated from the following summary table (measurements were taken on my laptop - MacBook Pro 2017 [i5 Dual-Core 2.3 GHz]):

```
              Rate Mojo::URL       URI   URI::XS  URL::XS
Mojo::URL  56296/s        --      -54%      -91%     -91%
URI       121197/s      115%        --      -80%     -81%
URI::XS   608746/s      981%      402%        --      -4%
URL::XS   632644/s     1024%      422%        4%       --
```

## Dependences & requires

Required Perl >= v5.26.0

## Installation

To manual install this module type the following (may be you need root/sudo permission to install into the system):

```
$ git clone git@github.com:ChaoticEvil/p5-url-xs.git
$ cd p5-url-xs/
$ perl Makefile.PL
$ make
$ make test
$ make install
```

To automatical install this module type the following:

```
$ cpan -i URL::XS
```

## Usage

### From shell (as one-liner)

```
perl -MURL::XS=parse_url -MData::Dumper -E \
    "say Dumper parse_url('http://localhost:8989/path/to/test?query=yes#frag=1')"
```

### From perl code

```perl
use URL::XS ();

my $url = 'http://localhost:8989/path/to/test?query=yes#frag=1';
my $parsed_url = URL::XS::parse_url($url);
```

## See also

- [Perl doc](https://metacpan.org/pod/URL::XS)
- [libyuarel](https://github.com/jacketizer/libyuarel)

## CopyRight and license

The MIT License (MIT)

Copyright (c) 2021 Peter P. Neuromantic \<p.brovchenko@protonmail.com\>.\
All rights reserved.

See LICENSE file for more information.
