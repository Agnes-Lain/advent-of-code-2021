
-----------------------------------------

# advent-of-code-2021
[Advent of Code 2021 🎄](https://adventofcode.com/year/20xx) solutions by `@Agnes-Lain`

The template is based on [aquaj's AoC Ruby template](https://github.com/aquaj/adventofcode-template).

[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## What is Advent of Code?
[Advent of Code](http://adventofcode.com) is an online event created by [Eric Wastl](https://twitter.com/ericwastl).
Each year, starting on Dec 1st, an advent calendar of small programming puzzles are unlocked once a day at midnight
(EST/UTC-5). Developers of all skill sets are encouraged to solve them in any programming language they choose!

## Advent of Code Story

**TODO: Fill in with story pitch from the text of Day 1's challenge**

**These were not written as example of clean or efficient code** but are simply my attempts at finding the answers to
each day's puzzle as quickly as possible. Performance logging was added simply as a fun way to compare implementations
with other competitors.

## Puzzles

<!-- On-hand emojis: ⏳ ✔ 🌟 -->
|       | Day                                                 | Part One | Part Two | Solutions
| :---: | ---                                                 |  :---:   |  :---:   | :---:
|       | [Day 1: TBD](https://adventofcode.com/20xx/day/1)   |          |          | [Solution](day-01.rb)
|       | [Day 2: TBD](https://adventofcode.com/20xx/day/2)   |          |          | [Solution](day-02.rb)
|       | [Day 3: TBD](https://adventofcode.com/20xx/day/3)   |          |          | [Solution](day-03.rb)
|       | [Day 4: TBD](https://adventofcode.com/20xx/day/4)   |          |          | [Solution](day-04.rb)
|       | [Day 5: TBD](https://adventofcode.com/20xx/day/5)   |          |          | [Solution](day-05.rb)
|       | [Day 6: TBD](https://adventofcode.com/20xx/day/6)   |          |          | [Solution](day-06.rb)
|       | [Day 7: TBD](https://adventofcode.com/20xx/day/7)   |          |          | [Solution](day-07.rb)
|       | [Day 8: TBD](https://adventofcode.com/20xx/day/8)   |          |          | [Solution](day-08.rb)
|       | [Day 9: TBD](https://adventofcode.com/20xx/day/9)   |          |          | [Solution](day-09.rb)
|       | [Day 10: TBD](https://adventofcode.com/20xx/day/10) |          |          | [Solution](day-10.rb)
|       | [Day 11: TBD](https://adventofcode.com/20xx/day/11) |          |          | [Solution](day-11.rb)
|       | [Day 12: TBD](https://adventofcode.com/20xx/day/12) |          |          | [Solution](day-12.rb)
|       | [Day 13: TBD](https://adventofcode.com/20xx/day/13) |          |          | [Solution](day-13.rb)
|       | [Day 14: TBD](https://adventofcode.com/20xx/day/14) |          |          | [Solution](day-14.rb)
|       | [Day 15: TBD](https://adventofcode.com/20xx/day/15) |          |          | [Solution](day-15.rb)
|       | [Day 16: TBD](https://adventofcode.com/20xx/day/16) |          |          | [Solution](day-16.rb)
|       | [Day 17: TBD](https://adventofcode.com/20xx/day/17) |          |          | [Solution](day-17.rb)
|       | [Day 18: TBD](https://adventofcode.com/20xx/day/18) |          |          | [Solution](day-18.rb)
|       | [Day 19: TBD](https://adventofcode.com/20xx/day/19) |          |          | [Solution](day-19.rb)
|       | [Day 20: TBD](https://adventofcode.com/20xx/day/20) |          |          | [Solution](day-20.rb)
|       | [Day 21: TBD](https://adventofcode.com/20xx/day/21) |          |          | [Solution](day-21.rb)
|       | [Day 22: TBD](https://adventofcode.com/20xx/day/22) |          |          | [Solution](day-22.rb)
|       | [Day 23: TBD](https://adventofcode.com/20xx/day/23) |          |          | [Solution](day-23.rb)
|       | [Day 24: TBD](https://adventofcode.com/20xx/day/24) |          |          | [Solution](day-24.rb)
|       | [Day 25: TBD](https://adventofcode.com/20xx/day/25) |          |          | [Solution](day-25.rb)

## Running the code

Run `bundle install` to install any dependencies.

Each day computes and displays the answers to both of the day questions and their computing time in ms. To run it type `ruby day<number>.rb`.

If the session cookie value is provided through the SESSION env variable (dotenv is available to provide it) — it will
fetch the input from the website and store it as a file under the `inputs/` folder on its first run.
Lack of a SESSION value will cause the code to raise an exception unless the input file (`inputs/{number}`) already
present. The code will also raise if the input isn't available from AoC's website (`404` error).
