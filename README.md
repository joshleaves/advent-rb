# advent-rb

[![Test code](https://github.com/joshleaves/advent-rb/actions/workflows/rspec.yml/badge.svg)](https://github.com/joshleaves/advent-rb/actions/workflows/rspec.yml)

Consistency is hard without proper goals to set a good (let's dare say "atomic") habit, so I'm writing solutions for [Advent of Code](https://adventofcode.com/) in Ruby with all the proper required testing.

I'm also adding notes that may be useful if you're learning Ruby.

Notes for solving:
* [2015, complete](year_2015.md)
* [2016, up to day 21](year_2016.md)
* [2023, up to day 04](year_2023.md)

# How to use
Install dependencies with `bundle install`. If you are in a hurry, just install [RSpec](https://github.com/rspec/rspec-metagem) with `gem install rspec` and run `rspec` in the root directory.

# Regarding RuboCop rules
I use my [own set of rules](.rubocop.yml), which I try to keep as close as possible to the official style, but [some style rules just don't make sense to me](https://rubystyle.guide/#leading-dot-in-multi-line-chains), and RuboCop's default rules are here to [enforce a single style](https://github.com/rubocop/ruby-style-guide/pull/176#issuecomment-18670208).

However, [consistency for the sake of consistency is widely agreed to be plain dumb](https://github.com/rubocop/ruby-style-guide?tab=readme-ov-file#a-note-about-consistency), so I reserve myself the right to disable rules as I require, for the sake of easier code reading.

# Testing guidelines
The tests are written with [Test-driven Development](https://en.wikipedia.org/wiki/Test-driven_development) principles by using the input and results provided by each exercise's samples. The  full input is then used in the tests, and the expected results are validated on the website.

A [GitHub Action](https://docs.github.com/en/actions) is available to test the code as soon as it is pushed.
