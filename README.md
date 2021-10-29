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
Andrew III (9A995A)
Fr. Yuk Ancgerom Fran Lanette (6C7C87)
Mx. Len Ran I (7B267C)
So Eri Tan (828854)
Seth Simonne Salome (477445)
Indira Ber (7A5568)
Claaine Erin (567899)
Maggie Carm (665B66)
Lord Ivelisse Jean (848586)
Mx. Bette Temika Chanel Is (9A5799)

Planetoids (subset)__________________________________________________
Planetoid URNDA2700(id=1) at (-420.8 682.5 841.6)
Planetoid RICKELA5350(id=2) at (-2211.8 -1262.3 -523.6)
Planetoid LORIE6919(id=3) at (-530.5 -1190.1 469.0)
Planetoid INA5350(id=4) at (-404.7 -917.2 233.0)
Planetoid HAN7562(id=5) at (-932.1 593.8 -61.5)
Planetoid ENCE1511(id=6) at (-1614.6 -179.7 -835.2)
Planetoid AHCHEL3804(id=7) at (2390.5 -448.5 283.2)
Planetoid HANTNNET110(id=8) at (-807.2 -636.9 -126.8)
Planetoid NGE1021(id=9) at (896.8 -2014.9 -544.8)
Planetoid RITARELL8902(id=10) at (-1697.0 -544.8 373.7)

Ten asteroid miners want to visit fifty-two thousand one hundred
forty-one planetoids.


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
Mx. Len Ran I departs on the Unusual Siamese Fighting Fish from IO4788
to ANIEINDA4917, a distance of 3122 light seconds.
Mx. Bette Temika Chanel Is leaves on the Blushing Blue Iguana from
RINE7535 to EARL3521, a distance of 3617 light seconds.

19 hours have elapsed, with two trips in flight.

Two days have elapsed, with two trips in flight.
Indira Ber departs on the Attractive Airedoodle from ISHANDI7035 to
RRI8506, a distance of 4020 light seconds.

Three days have elapsed, with three trips in flight.
Fr. Yuk Ancgerom Fran Lanette departs on the Stormy Saarloos Wolfdog
from VERNNO7579 to ORI3311, a distance of 1293 light seconds.
Maggie Carm departs on the Fancy Dolphin from ANDRKALINETH2728 to
ELIN6968, a distance of 1493 light seconds.

Six days have elapsed, with five trips in flight.
So Eri Tan begins a voyage of 3638 light seconds on the Blushing
Brazilian Terrier, from IRSTA3881 to AR802.
Seth Simonne Salome departs on the Sparkling Centipede from ANT5201 to
NCE3678, a distance of 4577 light seconds.
After seven days, Mx. Len Ran I has arrived at ANIEINDA4917 on the
Unusual Siamese Fighting Fish.
After eight days, the Blushing Blue Iguana lands at EARL3521, carrying
Mx. Bette Temika Chanel Is.
After five days, the Stormy Saarloos Wolfdog has arrived at ORI3311,
carrying Fr. Yuk Ancgerom Fran Lanette.
Lord Ivelisse Jean begins a voyage of 1036 light seconds on the Precious
Mastador, from EF7775 to LI3573.
The Fancy Dolphin has arrived at ELIN6968, carrying Maggie Carm after
five days.
After eight days, Indira Ber has arrived at RRI8506 on the Attractive
Airedoodle.
The Distinct Mandrill, carrying Andrew III, starts traveling to
CHANVI8413 from LAND8903, beginning a voyage of 2213 light seconds.
After four days, the Precious Mastador arrives at LI3573, carrying Lord
Ivelisse Jean.

Thirteen days have elapsed, with three trips in flight.
So Eri Tan arrives at AR802 on the Blushing Brazilian Terrier after
eight days.
After nine days, Seth Simonne Salome arrives at NCE3678 on the Sparkling
Centipede.
The Glamorous Bull Shark, carrying Maggie Carm, starts traveling to
FLOR9989 from ELIN6968, beginning a voyage of 1195 light seconds.
After six days, Andrew III has arrived at CHANVI8413 on the Distinct
Mandrill.
Andrew III begins a voyage of 811 light seconds on the Graceful Sucker
Fish, from CHANVI8413 to HANTRANDBETHMON1384.
After four days, Maggie Carm has arrived at FLOR9989 on the Glamorous
Bull Shark.
The Fancy Poochon, carrying So Eri Tan, starts traveling to NA8513 from
AR802, beginning a voyage of 3036 light seconds.
Mx. Bette Temika Chanel Is begins a voyage of 337 light seconds on the
Cloudy Caterpillar, from EARL3521 to ARYLMY9475.
The Attractive Petit Basset Griffon Vendéen, carrying Lord Ivelisse
Jean, starts traveling to ILLEFFOREDEAN3770 from LI3573, beginning a
voyage of 1122 light seconds.
After four days, Andrew III arrives at HANTRANDBETHMON1384 on the
Graceful Sucker Fish.
After two days, the Cloudy Caterpillar arrives at ARYLMY9475, carrying
Mx. Bette Temika Chanel Is.
The Fancy Western Gorilla, carrying Maggie Carm, starts traveling to
MARY3715 from FLOR9989, beginning a voyage of 2985 light seconds.

Twenty-six days have elapsed, with three trips in flight.
The Smoggy Indian Elephant, carrying Claaine Erin, starts traveling to
YL5177 from AMA9225, beginning a voyage of 1921 light seconds.
The Dark Spixs Macaw, carrying Seth Simonne Salome, starts traveling to
ZA2942 from NCE3678, beginning a voyage of 4268 light seconds.
After four days, the Attractive Petit Basset Griffon Vendéen has arrived
at ILLEFFOREDEAN3770, carrying Lord Ivelisse Jean.
The Fancy Poochon lands at NA8513, carrying So Eri Tan after seven days.
Maggie Carm has arrived at MARY3715 on the Fancy Western Gorilla after
seven days.
The Smoggy Indian Elephant lands at YL5177, carrying Claaine Erin after
six days.
The Clear Beagle, carrying So Eri Tan, starts traveling to ICA9938 from
NA8513, beginning a voyage of 922 light seconds.
Maggie Carm begins a voyage of 3759 light seconds on the Bloody
Dragonfly, from MARY3715 to JO978.
Seth Simonne Salome arrives at ZA2942 on the Dark Spixs Macaw after
eight days.
The Clear Beagle lands at ICA9938, carrying So Eri Tan after four days.
The Dark Clumber Spaniel, carrying Mx. Bette Temika Chanel Is, starts
traveling to LLELEAN1510 from ARYLMY9475, beginning a voyage of 4492
light seconds.
The Bloody Dragonfly lands at JO978, carrying Maggie Carm after eight
days.
Fr. Yuk Ancgerom Fran Lanette leaves on the Blushing Lhasapoo from
ORI3311 to CH9100, a distance of 2328 light seconds.
The Ugliest Centipede, carrying Maggie Carm, starts traveling to
MICH5733 from JO978, beginning a voyage of 4563 light seconds.
Lord Ivelisse Jean begins a voyage of 2881 light seconds on the
Grotesque Camel, from ILLEFFOREDEAN3770 to WA4167.
Mx. Len Ran I departs on the Light Gibbon from ANIEINDA4917 to
HRTTELINAMARI2591, a distance of 3418 light seconds.
After nine days, the Dark Clumber Spaniel lands at LLELEAN1510, carrying
Mx. Bette Temika Chanel Is.
After six days, Fr. Yuk Ancgerom Fran Lanette has arrived at CH9100 on
the Blushing Lhasapoo.
Lord Ivelisse Jean has arrived at WA4167 on the Grotesque Camel after
seven days.
The Ugliest Centipede arrives at MICH5733, carrying Maggie Carm after
nine days.

Fifty-two days have elapsed, with one trip in flight.
After seven days, Mx. Len Ran I arrives at HRTTELINAMARI2591 on the
Light Gibbon.
Seth Simonne Salome leaves on the Motionless Amur Leopard from ZA2942 to
RIT3874, a distance of 2607 light seconds.
Mx. Len Ran I departs on the Dull False Killer Whale from
HRTTELINAMARI2591 to GER1332, a distance of 3396 light seconds.
Mx. Bette Temika Chanel Is begins a voyage of 4439 light seconds on the
Bright Loach, from LLELEAN1510 to CHAR1769.
The Elegant Wood Turtle, carrying Indira Ber, starts traveling to DE3284
from RRI8506, beginning a voyage of 2318 light seconds.
Seth Simonne Salome has arrived at RIT3874 on the Motionless Amur
Leopard after seven days.
Seth Simonne Salome leaves on the Dark Millipede from RIT3874 to
ODACQU9079, a distance of 2115 light seconds.
Lord Ivelisse Jean leaves on the Strange Narwhal from WA4167 to RC7499,
a distance of 1452 light seconds.
The Dull False Killer Whale arrives at GER1332, carrying Mx. Len Ran I
after seven days.
So Eri Tan departs on the Fancy Italian Greyhound from ICA9938 to
ADEL3759, a distance of 2879 light seconds.
The Plain Blobfish, carrying Claaine Erin, starts traveling to ELLE3796
from YL5177, beginning a voyage of 3374 light seconds.
Mx. Bette Temika Chanel Is arrives at CHAR1769 on the Bright Loach after
nine days.
After six days, the Elegant Wood Turtle lands at DE3284, carrying Indira
Ber.
Lord Ivelisse Jean arrives at RC7499 on the Strange Narwhal after five
days.
Andrew III begins a voyage of 2824 light seconds on the Grotesque Black
Russian Terrier, from HANTRANDBETHMON1384 to NIA856.
After six days, the Dark Millipede arrives at ODACQU9079, carrying Seth
Simonne Salome.
Mx. Bette Temika Chanel Is departs on the Blue-Eyed Silver Labrador from
CHAR1769 to HERRCARROSRL2076, a distance of 3543 light seconds.
Lord Ivelisse Jean begins a voyage of 3039 light seconds on the Bright
Spotted Lanternfly, from RC7499 to LEE2019.
The Fancy Italian Greyhound arrives at ADEL3759, carrying So Eri Tan
after seven days.
The Plain Blobfish has arrived at ELLE3796, carrying Claaine Erin after
seven days.
Andrew III has arrived at NIA856 on the Grotesque Black Russian Terrier
after seven days.
The Misty Miniature Husky, carrying Claaine Erin, starts traveling to
ALENRINA9731 from ELLE3796, beginning a voyage of 3156 light seconds.
Mx. Len Ran I begins a voyage of 2347 light seconds on the Old-Fashioned
Stag Beetle, from GER1332 to LEAN7698.
The Blue-Eyed Silver Labrador lands at HERRCARROSRL2076, carrying Mx.
Bette Temika Chanel Is after eight days.
So Eri Tan departs on the Average Russell Terrier from ADEL3759 to
CARO2845, a distance of 2175 light seconds.
The Bright Spotted Lanternfly has arrived at LEE2019, carrying Lord
Ivelisse Jean after seven days.
The Misty Miniature Husky has arrived at ALENRINA9731, carrying Claaine
Erin after seven days.
Seth Simonne Salome leaves on the Dull Huskador from ODACQU9079 to
RR1452, a distance of 1626 light seconds.
After six days, the Old-Fashioned Stag Beetle lands at LEAN7698,
carrying Mx. Len Ran I.
Maggie Carm departs on the Glamorous Sulcata Tortoise from MICH5733 to
CHE9517, a distance of 3010 light seconds.
The Average Russell Terrier lands at CARO2845, carrying So Eri Tan after
six days.
Lord Ivelisse Jean begins a voyage of 2343 light seconds on the Shiny
Eskimo Dog, from LEE2019 to AIN452.
The Clear Little Penguin, carrying Fr. Yuk Ancgerom Fran Lanette, starts
traveling to OLA785 from CH9100, beginning a voyage of 3843 light
seconds.
The Stormy Patas Monkey, carrying Andrew III, starts traveling to
LENANC9981 from NIA856, beginning a voyage of 1863 light seconds.
So Eri Tan departs on the Smoggy Tsetse Fly from CARO2845 to UILIE5006,
a distance of 2514 light seconds.
Seth Simonne Salome arrives at RR1452 on the Dull Huskador after five
days.
The Glamorous Sulcata Tortoise has arrived at CHE9517, carrying Maggie
Carm after seven days.
After six days, Lord Ivelisse Jean has arrived at AIN452 on the Shiny
Eskimo Dog.
Mx. Bette Temika Chanel Is leaves on the Quaint Indian Giant Squirrel
from HERRCARROSRL2076 to NDR2058, a distance of 2442 light seconds.
Indira Ber begins a voyage of 1694 light seconds on the Elegant
Porcupine, from DE3284 to AROLCAR8370.
Andrew III has arrived at LENANC9981 on the Stormy Patas Monkey after
six days.
Lord Ivelisse Jean departs on the Gorgeous Mantella Frog from AIN452 to
TRI5823, a distance of 1003 light seconds.
After eight days, the Clear Little Penguin has arrived at OLA785,
carrying Fr. Yuk Ancgerom Fran Lanette.
After six days, the Smoggy Tsetse Fly arrives at UILIE5006, carrying So
Eri Tan.
Lord Ivelisse Jean has arrived at TRI5823 on the Gorgeous Mantella Frog
after four days.
Claaine Erin leaves on the Glamorous Drum Fish from ALENRINA9731 to
ATH895, a distance of 2447 light seconds.
Indira Ber arrives at AROLCAR8370 on the Elegant Porcupine after five
days.
Andrew III leaves on the Motionless Dolphin from LENANC9981 to STEP4947,
a distance of 2724 light seconds.
The Quaint Indian Giant Squirrel has arrived at NDR2058, carrying Mx.
Bette Temika Chanel Is after six days.
The Smoggy Basset Hound, carrying Maggie Carm, starts traveling to
ACQU6572 from CHE9517, beginning a voyage of 3360 light seconds.
Mx. Bette Temika Chanel Is begins a voyage of 3868 light seconds on the
Sparkling American Pygmy Goat, from NDR2058 to ALL3028.
Claaine Erin has arrived at ATH895 on the Glamorous Drum Fish after six
days.
After seven days, the Motionless Dolphin has arrived at STEP4947,
carrying Andrew III.
Lord Ivelisse Jean leaves on the Ugly Crab Spider from TRI5823 to
ANN3515, a distance of 1083 light seconds.

One hundred three days have elapsed, with three trips in flight.
So Eri Tan begins a voyage of 1974 light seconds on the Handsome Cross
River Gorilla, from UILIE5006 to AL8566.
After seven days, the Smoggy Basset Hound arrives at ACQU6572, carrying
Maggie Carm.
After eight days, Mx. Bette Temika Chanel Is has arrived at ALL3028 on
the Sparkling American Pygmy Goat.
After four days, Lord Ivelisse Jean has arrived at ANN3515 on the Ugly
Crab Spider.
Fr. Yuk Ancgerom Fran Lanette begins a voyage of 2730 light seconds on
the Poised Bornean Orang-Utan, from OLA785 to ERE1296.
After six days, the Handsome Cross River Gorilla lands at AL8566,
carrying So Eri Tan.
Andrew III begins a voyage of 1067 light seconds on the Quaint Capybara,
from STEP4947 to LEENYSJUZA3386.
Lord Ivelisse Jean begins a voyage of 1865 light seconds on the Clean
Keel-Billed Toucan, from ANN3515 to STIN675.
The Strange Arctic Wolf, carrying Claaine Erin, starts traveling to
EANNLEN7468 from ATH895, beginning a voyage of 2144 light seconds.
The Blue-Eyed Leopard Frog, carrying Mx. Bette Temika Chanel Is, starts
traveling to ET7422 from ALL3028, beginning a voyage of 1668 light
seconds.
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
