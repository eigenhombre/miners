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
M Rina Tandra III (32913, 548587)
Kimi Tyesha Johnie (32914, 849AAA)
Herr Bi So Ze Jacq Darcel Hannah (32915, 896B98)
Sir Sharali Chas Ecgenerry Corazon (32916, 637777)
Joey Lori I (32917, 564625)
Nakia Jacque Tressa (32918, A77969)
Marlen Yrob I (32919, 8476AA)
Miss Royce Andres Corn (32920, 62A785)
Jude Jamaal (32921, 9B587C)
Nne Star Esq. (32922, 497725)

Planetoids (subset)__________________________________________________
Planetoid AG5883(1) at (608.2 -879.0 -244.6)
Planetoid SY9797(2) at (2067.4 1474.3 132.1)
Planetoid JOSERONALEN3172(3) at (-1244.3 45.5 -124.8)
Planetoid AKILAAT3177(4) at (949.3 -1628.3 -465.4)
Planetoid NIC3977(5) at (2591.4 73.2 181.3)
Planetoid QUE705(6) at (-2446.6 622.0 -860.9)
Planetoid RENE1011(7) at (-2172.1 692.3 26.7)
Planetoid LES7743(8) at (-985.1 1059.8 419.5)
Planetoid ITUD5823(9) at (-275.0 1851.4 332.7)
Planetoid MARIRGUDQU175(10) at (-82.5 -2562.5 -139.9)

Ten asteroid miners want to visit thirty-two thousand nine hundred twelve planetoids.

1 second have elapsed, with zero trips in flight.
3 seconds have elapsed, with zero trips in flight.
7 seconds have elapsed, with zero trips in flight.
15 seconds have elapsed, with zero trips in flight.
45 seconds have elapsed, with zero trips in flight.
2 minutes have elapsed, with zero trips in flight.
7 minutes have elapsed, with zero trips in flight.
20 minutes have elapsed, with zero trips in flight.
44 minutes have elapsed, with zero trips in flight.
2 hours have elapsed, with zero trips in flight.
4 hours have elapsed, with zero trips in flight.
9 hours have elapsed, with zero trips in flight.
19 hours have elapsed, with zero trips in flight.
2 days have elapsed, with zero trips in flight.
3 days have elapsed, with zero trips in flight.
6 days have elapsed, with zero trips in flight.
13 days have elapsed, with zero trips in flight.
Jude Jamaal leaves from AMI6253 to INE7622, a distance of 2018 light seconds.
26 days have elapsed, with one trip in flight.
Jude Jamaal arrived at INE7622 after 6 days of travel!
Kimi Tyesha Johnie departs from NOR3428 to ETH7954, a distance of 808 light seconds.
Herr Bi So Ze Jacq Darcel Hannah begins a voyage of 1430 light seconds, from ANETRICE8490 to UEL602.
Kimi Tyesha Johnie arrived at ETH7954 after 4 days of travel!
Jude Jamaal leaves from INE7622 to RIN8278, a distance of 1282 light seconds.
52 days have elapsed, with two trips in flight.
Herr Bi So Ze Jacq Darcel Hannah arrived at UEL602 after 5 days of travel!
Joey Lori I starts traveling to RI4637 from TRIC7543, beginning a voyage of 3109 light seconds.
Jude Jamaal arrived at RIN8278 after 5 days of travel!
Joey Lori I arrived at RI4637 after 7 days of travel!
M Rina Tandra III leaves from VAN638 to MANLINDEGUAYO8502, a distance of 1302 light seconds.
M Rina Tandra III arrived at MANLINDEGUAYO8502 after 5 days of travel!
Nakia Jacque Tressa departs from ESTTIEFF2482 to ENA369, a distance of 3239 light seconds.
Nakia Jacque Tressa arrived at ENA369 after 7 days of travel!
Miss Royce Andres Corn begins a voyage of 4275 light seconds, from LLENSASC3438 to CATH7956.
Miss Royce Andres Corn arrived at CATH7956 after 8 days of travel!
103 days have elapsed, with zero trips in flight.
Thanks for using miners!
```
