# Miners

<img src="/planetoid.jpg" width="400">

Another [zero player](https://github.com/eigenhombre/galax#galax)
game involving travel between planetoids.

![build](https://github.com/eigenhombre/miners/actions/workflows/build.yml/badge.svg)

## Small Goals

- [x] named planetoids / asteroids distributed uniformly between an
  annulus extending from the orbit of Mars to the orbit of Jupiter
- [x] "miners" with names, UPP[1], and initial locations
- [x] acceleration (non-relativistic), turnaround, and deceleration at 1 g
  from original planetoid to destination asteroid.
- [ ] add internal states and goals to miners
  - [x] miners can get hungrier (poor things!)
- [ ] add strategies towards solving goals, à la [GPS](https://github.com/norvig/paip-lisp/blob/main/docs/chapter4.md#gps-the-general-problem-solver).

[1] Attributes matching a popular, 1980s-era sci fi RPG

## Example of "Play"

```
$ miners

Miners_______________________________________________________________
Miss Artan La Theola Tijuana Twanda (53297, 859977)
Dr. Im Domonique (53298, 9B894C)
Vicenta IV (53299, 75A647)
Miss Vin (53300, 6A3646)
Fr. Ron My (53301, 867955)
Ei Rie Robin (53302, 63BA85)
Mr. Bern Whitney (53303, B48A49)
Jude Landon Sammy Mich Brian Kenneth (53304, 887956)
Iann Nel (53305, 8986B7)
Josef (53306, 477865)

Planetoids (subset)__________________________________________________
Planetoid DRA3757(1) at (1910.7 -566.3 -192.8)
Planetoid ULAUR8623(2) at (-1471.8 -203.0 -799.9)
Planetoid ESTE8503(3) at (-672.4 -1934.0 545.2)
Planetoid ANNELI6931(4) at (1816.5 -398.3 28.1)
Planetoid SONOBLLI2510(5) at (-586.1 -1011.6 844.4)
Planetoid EARL9718(6) at (2371.4 523.0 77.3)
Planetoid JU9506(7) at (1140.9 -38.6 -593.0)
Planetoid EO7198(8) at (-1984.3 787.9 -431.8)
Planetoid BETH3111(9) at (-1231.4 1262.6 369.2)
Planetoid LAADEL1146(10) at (-2078.4 -1173.8 12.9)

Ten asteroid miners want to visit fifty-three thousand two hundred ninety-six planetoids.

1 second have elapsed, with no trips in flight.
3 seconds have elapsed, with no trips in flight.
7 seconds have elapsed, with no trips in flight.
15 seconds have elapsed, with no trips in flight.
45 seconds have elapsed, with no trips in flight.
2 minutes have elapsed, with no trips in flight.
7 minutes have elapsed, with no trips in flight.
20 minutes have elapsed, with no trips in flight.
44 minutes have elapsed, with no trips in flight.
2 hours have elapsed, with no trips in flight.
4 hours have elapsed, with no trips in flight.
9 hours have elapsed, with no trips in flight.
19 hours have elapsed, with no trips in flight.
2 days have elapsed, with no trips in flight.
3 days have elapsed, with no trips in flight.
6 days have elapsed, with no trips in flight.
Miss Vin leaves from ORI5908 to DEMON2669, a distance of 1818 light seconds.
13 days have elapsed, with one trip in flight.
Miss Vin has arrived at DEMON2669, after 5 days
Iann Nel starts traveling to IC9164 from EE4543, beginning a voyage of 3852 light seconds.
26 days have elapsed, with one trip in flight.
Iann Nel arrives at IC9164, after 8 days
Iann Nel leaves from IC9164 to NIC63, a distance of 3115 light seconds.
After 7 days, Iann Nel arrives at NIC63,
Vicenta IV departs from LI5970 to INDANDR5151, a distance of 2517 light seconds.
52 days have elapsed, with one trip in flight.
Vicenta IV has arrived at INDANDR5151, after 6 days
Dr. Im Domonique departs from LEELISSNNE1252 to JOHNUE7216, a distance of 2754 light seconds.
Dr. Im Domonique arrives at JOHNUE7216, after 7 days
Vicenta IV starts traveling to KATH1402 from INDANDR5151, beginning a voyage of 1614 light seconds.
Iann Nel begins a voyage of 3198 light seconds, from NIC63 to ARIA7390.
Vicenta IV arrives at KATH1402, after 5 days
After 7 days, Iann Nel arrives at ARIA7390,
Miss Vin starts traveling to ANTBR47 from DEMON2669, beginning a voyage of 1753 light seconds.
After 5 days, Miss Vin arrives at ANTBR47,
103 days have elapsed, with no trips in flight.
Thanks for using miners!
```

## License

MIT License

Copyright © 2021 John Jacobsen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
