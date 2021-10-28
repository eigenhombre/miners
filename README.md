# Miners

<img src="/planetoid.jpg" width="400">

Another [zero player](https://github.com/eigenhombre/galax#galax)
game involving travel between planetoids.

![build](https://github.com/eigenhombre/miners/actions/workflows/build.yml/badge.svg)

## Small Goals

- [x] named planetoids / asteroids distributed uniformly within an
  annulus extending from the orbit of Mars to the orbit of Jupiter
- [x] "miners" with names, UPP[1], and initial locations
- [x] acceleration (non-relativistic), turnaround, and deceleration at 1 g
  from original planetoid to destination asteroid.
- [x] miners travel on ships, which have names
  - [ ] ships carry crew, passengers and provisions
- [ ] add internal states and goals to miners
  - [x] miners can get hungrier (poor things!)
- [ ] add strategies towards solving goals, à la [GPS](https://github.com/norvig/paip-lisp/blob/main/docs/chapter4.md#gps-the-general-problem-solver).

[1] Attributes matching a popular, 1980s-era sci fi RPG

## Example of "Play"

```
$ miners

Miners_______________________________________________________________
Danica Antoya Kenneth Dusty Lorena (61747, 776847)
Lady Fran Elyn Merrill Denis (61748, 772367)
Mr. And Raguel (61749, 798A37)
Ndra Edyth Tonita Esq. (61750, 56A375)
Heriberto Romaine (61751, B95865)
Laec Rcel (61752, 864A3A)
Herr Feli Cobri (61753, 858593)
Elke Erin Taneka Lena Land Ngriekr (61754, 774658)
Ms. Drahu Long Bra (61755, 7739C5)
Aritrelore Rolvaali Uiessi To Chiquita Etsuko III (61756, 56A989)

Planetoids (subset)__________________________________________________
Planetoid UL7050(1) at (-1790.6 1573.4 838.6)
Planetoid ASHADI896(2) at (-2172.4 -1116.9 -832.1)
Planetoid ER6694(3) at (2517.6 -118.5 -647.7)
Planetoid ANNIHUINA2166(4) at (-943.3 -1966.6 -519.7)
Planetoid EEN3025(5) at (-500.2 1062.0 -537.8)
Planetoid ID8429(6) at (-822.9 2436.0 -555.5)
Planetoid DELI1447(7) at (1189.8 -1938.3 576.6)
Planetoid RINA967(8) at (-1159.9 88.0 -630.6)
Planetoid SYAMA9648(9) at (1015.3 1416.2 353.4)
Planetoid COLAMI6741(10) at (-1975.3 1282.6 778.8)

Ten asteroid miners want to visit sixty-one thousand seven hundred forty-six planetoids.

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
Laec Rcel leaves on the Light Dragonfish from AMECLAVAN3515 to GEOR7193, a distance of 4742 light seconds.
2 days have elapsed, with one trip in flight.
3 days have elapsed, with one trip in flight.
The Fancy Blue Grosbeak, carrying Lady Fran Elyn Merrill Denis, starts traveling to LU3111 from HI9473, beginning a voyage of 3318 light seconds.
Heriberto Romaine begins a voyage of 1809 light seconds on the Cloudy Cicada, from LANDILLA3684 to TONIV487.
Aritrelore Rolvaali Uiessi To Chiquita Etsuko III departs on the Light Fennec Fox from TTE7421 to LIE8264, a distance of 3431 light seconds.
The Fancy Polish Lowland Sheepdog, carrying Ms. Drahu Long Bra, starts traveling to LAUR9421 from ANDI2366, beginning a voyage of 4184 light seconds.
6 days have elapsed, with five trips in flight.
Danica Antoya Kenneth Dusty Lorena departs on the Poised Cross Fox from OND4944 to OS1849, a distance of 2543 light seconds.
The Old-Fashioned Peacock Spider, carrying Mr. And Raguel, starts traveling to RITA6597 from ILLE8548, beginning a voyage of 2763 light seconds.
Herr Feli Cobri begins a voyage of 1504 light seconds on the Long Golden-Crowned Flying Fox, from ANGECHRI7285 to OY5249.
13 days have elapsed, with eight trips in flight.
Elke Erin Taneka Lena Land Ngriekr begins a voyage of 1611 light seconds on the Precious Italian Greyhound, from LIS5739 to NNE6927.
Ndra Edyth Tonita Esq. departs on the Colorful Bandicoot from SIEAROL8398 to KAT5764, a distance of 2008 light seconds.
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
