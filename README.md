# Miners

<img src="/planetoid.jpg" width="400">

Another [zero player](https://github.com/eigenhombre/galax#galax)
game involving travel between planetoids.

## Small Goals

- [x] named planetoids / asteroids distributed uniformly between an
  annulus extending from the orbit of Mars to the orbit of Jupiter
- [x] "miners" with names, UPP[1], and initial locations
- [x] acceleration (non-relativistic), turnaround, and deceleration at 1 g
  from original planetoid to destination asteroid.
- [ ] add internal states and goals to miners
- [ ] add strategies towards solving goals, à la [GPS](https://github.com/norvig/paip-lisp/blob/main/docs/chapter4.md#gps-the-general-problem-solver).

[1] Attributes matching a popular, 1980s-era sci fi RPG

## Example of "Play"

```
$ miners

Miners_______________________________________________________________
Felicitas Jenise II (1037, 86C667)
Herr Francisco Illi Onn Lberav Jr. (1038, 334986)
Damien Fumiko Jayme (1039, 69A967)
Scotty Emely Rose II (1040, 5C68B9)
Chafran Shangi Lemuel Jr. (1041, 648699)
Lady Lora Fe (1042, 3868C8)
Darwin Arlinda Charlene Ita II (1043, 7A9769)
Rcel Dana (1044, 38685C)
Olegenelvcl Jr. (1045, AC5BA8)
Ce Daniera Georcha (1046, 767873)

Planetoids (subset)__________________________________________________
Planetoid TINE1210(1) at (1462.0 -1947.0 -744.5)
Planetoid CI1293(2) at (-1908.6 288.6 -768.9)
Planetoid LVOND5499(3) at (-1112.8 2309.4 -879.7)
Planetoid KATLIS2866(4) at (-1688.1 -1619.4 818.5)
Planetoid EE187(5) at (1414.6 951.2 -563.5)
Planetoid LV5488(6) at (1749.6 658.3 -700.6)
Planetoid CI9771(7) at (1596.5 -147.1 -803.8)
Planetoid ANIE1079(8) at (-1337.4 -1353.4 904.5)
Planetoid EFRELLARO4181(9) at (-2138.1 382.9 813.3)
Planetoid ERRI9982(10) at (1180.1 985.0 -859.0)

Ten asteroid miners want to visit one thousand thirty-six planetoids.

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
Olegenelvcl Jr. starts traveling to MIC5576 from ERRIRITFRED8683, beginning a voyage of 3024 light seconds.
13 days have elapsed, with one trip in flight.
Olegenelvcl Jr. arrived at MIC5576 after 7 days of travel!
Herr Francisco Illi Onn Lberav Jr. starts traveling to PACA2561 from MIC5148, beginning a voyage of 1427 light seconds.
Herr Francisco Illi Onn Lberav Jr. arrived at PACA2561 after 5 days of travel!
26 days have elapsed, with no trips in flight.
Lady Lora Fe begins a voyage of 2004 light seconds, from DOR6160 to ORI6500.
Scotty Emely Rose II begins a voyage of 3720 light seconds, from CRIS9526 to RIESHAWRE3575.
Lady Lora Fe arrived at ORI6500 after 6 days of travel!
Scotty Emely Rose II arrived at RIESHAWRE3575 after 8 days of travel!
52 days have elapsed, with no trips in flight.
Felicitas Jenise II departs from RS9321 to EYYOELO9274, a distance of 2079 light seconds.
Felicitas Jenise II arrived at EYYOELO9274 after 6 days of travel!
Damien Fumiko Jayme leaves from MARL3130 to ILLIANI5963, a distance of 3942 light seconds.
Darwin Arlinda Charlene Ita II begins a voyage of 2039 light seconds, from DAR2220 to BY4048.
Damien Fumiko Jayme arrived at ILLIANI5963 after 8 days of travel!
Darwin Arlinda Charlene Ita II arrived at BY4048 after 6 days of travel!
Olegenelvcl Jr. starts traveling to IN2147 from MIC5576, beginning a voyage of 3779 light seconds.
103 days have elapsed, with one trip in flight.
Olegenelvcl Jr. arrived at IN2147 after 8 days of travel!
Scotty Emely Rose II begins a voyage of 2911 light seconds, from RIESHAWRE3575 to JACQ610.
Scotty Emely Rose II arrived at JACQ610 after 7 days of travel!
Thanks for using miners!
```
