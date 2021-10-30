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
Herr Es Harieloerr (569689)
Omega Ssrin Nic Wilfredo Denny Cherish (7B7998)
Simona Gar (54C4C9)
Herr Audie Barbera (B97C69)
Mariella Rg Selma (7A8364)
Lizzie Christinia (78356B)
Ms. Ella (A94948)
Matthew Mar (947A57)
Lieros Elul (357A74)
Camila Kathy Hann Lie Th (4AC428)

Planetoids (subset)__________________________________________________
Planetoid IZCHRI3486(id=1) at (-947.1 -1052.5 205.4)
Planetoid SHAWMELIINEHEL8023(id=2) at (753.7 -2233.9 637.7)
Planetoid ETTA5569(id=3) at (-821.3 -1237.8 -324.6)
Planetoid ALIRITAGA9021(id=4) at (422.1 -1038.1 -662.9)
Planetoid ARRI6370(id=5) at (1432.1 654.5 -36.2)
Planetoid RICE2831(id=6) at (-658.5 1779.7 905.8)
Planetoid TRI3323(id=7) at (-243.6 1774.2 -733.2)
Planetoid IS76(id=8) at (974.7 -1489.0 -23.8)
Planetoid JOOUINDA9882(id=9) at (-876.3 -1591.7 671.2)
Planetoid LORI4258(id=10) at (-671.3 -1338.7 766.5)

Ten asteroid miners want to visit thirty-one thousand nine hundred
ninety-five planetoids.


1 second has elapsed, with no trips in flight.

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
The Distinct Seahorse, carrying Herr Audie Barbera, starts traveling to
ESS5721 from OT2267, beginning a voyage of 2928 light seconds.

9 hours have elapsed, with one trip in flight.

19 hours have elapsed, with one trip in flight.

Two days have elapsed, with one trip in flight.

Three days have elapsed, with one trip in flight.
Matthew Mar leaves on the Filthy Affenpinscher from LINISE5437 to
RRSONTRI8986, a journey of 1647 light seconds.
The Misty White-Faced Capuchin, carrying Simona Gar, starts traveling to
JO8454 from FRED6929, beginning a voyage of 1804 light seconds.
Camila Kathy Hann Lie Th begins a voyage of 2727 light seconds on the
Attractive Keeshond, from ARIEEEN2307 to FRAN1824.
The Shiny Anglerfish, carrying Ms. Ella, starts traveling to TRIC8704
from SH9028, beginning a voyage of 2663 light seconds.
Lizzie Christinia departs on the Quaint Rat Terrier, travelling from
RINAAMI8403 to AINETHEROL7076, a distance of 1313 light seconds.

Six days have elapsed, with six trips in flight.
The Distinct Seahorse arrives at ESS5721, carrying Herr Audie Barbera
after seven days.
Herr Audie Barbera begins a voyage of 2742 light seconds on the Bloody
African Wild Dog, from ESS5721 to INDASTA7684.
The Filthy Affenpinscher lands at RRSONTRI8986, carrying Matthew Mar
after five days.
The Misty White-Faced Capuchin arrives at JO8454, carrying Simona Gar
after five days.
The Precious Gila Monster, carrying Lieros Elul, starts traveling to
LAUREANNLV6541 from CARLQU2709, beginning a voyage of 784 light seconds.
Omega Ssrin Nic Wilfredo Denny Cherish leaves on the Shiny Glen Of Imaal
Terrier from JOSE7655 to ONDA2956, a journey of 4462 light seconds.
Camila Kathy Hann Lie Th arrives at FRAN1824 on the Attractive Keeshond
after seven days.
The Quaint Rat Terrier arrives at AINETHEROL7076, carrying Lizzie
Christinia after five days.
The Shiny Anglerfish arrives at TRIC8704, carrying Ms. Ella after seven
days.
Mariella Rg Selma begins a voyage of 1159 light seconds on the Filthy
Okapi, from UR7499 to RENA6359.
The Glamorous Box Turtle, carrying Simona Gar, starts traveling to
JO8488 from JO8454, beginning a voyage of 2958 light seconds.

Thirteen days have elapsed, with five trips in flight.
After four days, Lieros Elul arrives at LAUREANNLV6541 on the Precious
Gila Monster.
The Old-Fashioned Northern Cardinal, carrying Lizzie Christinia, starts
traveling to MON1703 from AINETHEROL7076, beginning a voyage of 2305
light seconds.
Herr Audie Barbera has arrived at INDASTA7684, on the Bloody African
Wild Dog after seven days.
The Magnificent Glass Frog, carrying Matthew Mar, starts traveling to
AV3452 from RRSONTRI8986, beginning a voyage of 2275 light seconds.
Herr Es Harieloerr begins a voyage of 1613 light seconds on the
Wide-Eyed Grasshopper Mouse, from RED7216 to SSALEAN5627.
After four days, Mariella Rg Selma arrives at RENA6359 on the Filthy
Okapi.
Mariella Rg Selma departs on the Beautiful Catfish, travelling from
RENA6359 to ASHA7624, a distance of 1162 light seconds.
The Shiny Glen Of Imaal Terrier has arrived at ONDA2956, carrying Omega
Ssrin Nic Wilfredo Denny Cherish after nine days.
Camila Kathy Hann Lie Th leaves on the Distinct Albacore Tuna from
FRAN1824 to INESIEISHA2484, a journey of 1294 light seconds.
The Dark Darwin’S Fox, carrying Omega Ssrin Nic Wilfredo Denny Cherish,
starts traveling to ALISTRICERN6697 from ONDA2956, beginning a voyage of
2651 light seconds.
After six days, Lizzie Christinia arrives at MON1703 on the
Old-Fashioned Northern Cardinal.
After seven days, the Glamorous Box Turtle arrives at JO8488, carrying
Simona Gar.
The Blue-Eyed Greenland Dog, carrying Lieros Elul, starts traveling to
ILLFLOR5471 from LAUREANNLV6541, beginning a voyage of 2070 light
seconds.
The Wide-Eyed Grasshopper Mouse has arrived at SSALEAN5627, carrying
Herr Es Harieloerr after five days.
The Magnificent Glass Frog has arrived at AV3452, carrying Matthew Mar
after six days.
The Beautiful Catfish has arrived at ASHA7624, carrying Mariella Rg
Selma after four days.
The Bloody Goblin Shark, carrying Herr Es Harieloerr, starts traveling
to IVELIA6847 from SSALEAN5627, beginning a voyage of 3715 light
seconds.
After five days, the Distinct Albacore Tuna has arrived at
INESIEISHA2484, carrying Camila Kathy Hann Lie Th.
Ms. Ella leaves on the Strange Double Doodle from TRIC8704 to ARI7689, a
journey of 1246 light seconds.
Camila Kathy Hann Lie Th departs on the Bloody White-Tail Deer,
travelling from INESIEISHA2484 to ON3224, a distance of 3147 light
seconds.
Lizzie Christinia departs on the Excited Petite Goldendoodle, travelling
from MON1703 to RENAHAN7900, a distance of 3680 light seconds.

Twenty-six days have elapsed, with six trips in flight.
Omega Ssrin Nic Wilfredo Denny Cherish has arrived at ALISTRICERN6697,
on the Dark Darwin’S Fox after seven days.
The Blue-Eyed Greenland Dog has arrived at ILLFLOR5471, carrying Lieros
Elul after six days.
Simona Gar leaves on the Fancy Banded Palm Civet from JO8488 to ISS494,
a journey of 4406 light seconds.
After five days, Ms. Ella arrives at ARI7689 on the Strange Double
Doodle.
After eight days, Herr Es Harieloerr arrives at IVELIA6847 on the Bloody
Goblin Shark.
Omega Ssrin Nic Wilfredo Denny Cherish begins a voyage of 1632 light
seconds on the Misty Fila Brasileiro, from ALISTRICERN6697 to
TRIRDFELILE1480.
Matthew Mar leaves on the Grotesque Havashire from AV3452 to CHRNIT5408,
a journey of 1603 light seconds.
Camila Kathy Hann Lie Th has arrived at ON3224, on the Bloody White-Tail
Deer after seven days.
Lizzie Christinia has arrived at RENAHAN7900, on the Excited Petite
Goldendoodle after eight days.
Herr Es Harieloerr leaves on the Long Saanen Goat from IVELIA6847 to
RGIEERI6861, a journey of 4526 light seconds.
After eight days, Simona Gar has arrived at ISS494, on the Fancy Banded
Palm Civet.
After five days, the Misty Fila Brasileiro arrives at TRIRDFELILE1480,
carrying Omega Ssrin Nic Wilfredo Denny Cherish.
After five days, the Grotesque Havashire arrives at CHRNIT5408, carrying
Matthew Mar.
Simona Gar leaves on the Drab Pomeranian from ISS494 to ICK1420, a
journey of 3228 light seconds.
Camila Kathy Hann Lie Th leaves on the Distinct Polish Lowland Sheepdog
from ON3224 to LENE6354, a journey of 3045 light seconds.
Herr Es Harieloerr has arrived at RGIEERI6861, on the Long Saanen Goat
after nine days.
Omega Ssrin Nic Wilfredo Denny Cherish departs on the Fancy
Ruby-Throated Hummingbird, travelling from TRIRDFELILE1480 to
CARLQU2709, a distance of 1600 light seconds.
Mariella Rg Selma departs on the Fancy Stingray, travelling from
ASHA7624 to AW2638, a distance of 2712 light seconds.
Herr Es Harieloerr leaves on the Motionless Beefalo from RGIEERI6861 to
KR1010, a journey of 2303 light seconds.
After seven days, Simona Gar has arrived at ICK1420, on the Drab
Pomeranian.
Herr Audie Barbera begins a voyage of 1214 light seconds on the Clear
Horseshoe Crab, from INDASTA7684 to STROELEN6005.
Camila Kathy Hann Lie Th arrives at LENE6354 on the Distinct Polish
Lowland Sheepdog after seven days.
The Fancy Ruby-Throated Hummingbird arrives at CARLQU2709, carrying
Omega Ssrin Nic Wilfredo Denny Cherish after five days.
Omega Ssrin Nic Wilfredo Denny Cherish leaves on the Drab Macaw from
CARLQU2709 to MA6553, a journey of 3530 light seconds.
Herr Es Harieloerr arrives at KR1010 on the Motionless Beefalo after six
days.
The Clear Horseshoe Crab has arrived at STROELEN6005, carrying Herr
Audie Barbera after four days.
After seven days, the Fancy Stingray lands at AW2638, carrying Mariella
Rg Selma.
Camila Kathy Hann Lie Th leaves on the Bloody Megamouth Shark from
LENE6354 to STA8160, a journey of 3363 light seconds.

Fifty-two days have elapsed, with two trips in flight.
Ms. Ella departs on the Misty Indian Elephant, travelling from ARI7689
to MAR6913, a distance of 3119 light seconds.
Simona Gar leaves on the Muddy Immortal Jellyfish from ICK1420 to
TEPH6292, a journey of 4038 light seconds.
Omega Ssrin Nic Wilfredo Denny Cherish has arrived at MA6553, on the
Drab Macaw after eight days.
Herr Es Harieloerr departs on the Strange Humboldt Penguin, travelling
from KR1010 to ALIN1702, a distance of 778 light seconds.
The Wide-Eyed Geoffroys Tamarin, carrying Lieros Elul, starts traveling
to ADELSHAW6821 from ILLFLOR5471, beginning a voyage of 3672 light
seconds.
Matthew Mar departs on the Ugly Tawny Owl, travelling from CHRNIT5408 to
IDA6629, a distance of 3702 light seconds.
Mariella Rg Selma departs on the Beautiful Dugong, travelling from
AW2638 to ERRIFL1351, a distance of 1251 light seconds.
After seven days, Camila Kathy Hann Lie Th has arrived at STA8160, on
the Bloody Megamouth Shark.
After seven days, the Misty Indian Elephant arrives at MAR6913, carrying
Ms. Ella.
Omega Ssrin Nic Wilfredo Denny Cherish begins a voyage of 4009 light
seconds on the Quaint Haddock, from MA6553 to ANN9369.
After four days, the Strange Humboldt Penguin lands at ALIN1702,
carrying Herr Es Harieloerr.
The Muddy Immortal Jellyfish has arrived at TEPH6292, carrying Simona
Gar after eight days.
Mariella Rg Selma has arrived at ERRIFL1351, on the Beautiful Dugong
after five days.
Simona Gar begins a voyage of 3537 light seconds on the Gorgeous
Rottweiler, from TEPH6292 to DOR7951.
Camila Kathy Hann Lie Th departs on the Blue-Eyed Black Wasp, travelling
from STA8160 to BERT4156, a distance of 1390 light seconds.
Herr Es Harieloerr departs on the Grotesque Catahoula Leopard,
travelling from ALIN1702 to BERN4313, a distance of 2659 light seconds.
Ms. Ella begins a voyage of 2944 light seconds on the Precious Hawaiian
Crow, from MAR6913 to DA1285.
The Wide-Eyed Geoffroys Tamarin arrives at ADELSHAW6821, carrying Lieros
Elul after eight days.
After eight days, the Ugly Tawny Owl arrives at IDA6629, carrying
Matthew Mar.
The Ugly Australian Labradoodle, carrying Lieros Elul, starts traveling
to YALENARO1309 from ADELSHAW6821, beginning a voyage of 2737 light
seconds.
Omega Ssrin Nic Wilfredo Denny Cherish has arrived at ANN9369, on the
Quaint Haddock after eight days.
After five days, the Blue-Eyed Black Wasp arrives at BERT4156, carrying
Camila Kathy Hann Lie Th.
Mariella Rg Selma begins a voyage of 1736 light seconds on the Ugliest
Camel Cricket, from ERRIFL1351 to LIAN9121.
Simona Gar arrives at DOR7951 on the Gorgeous Rottweiler after eight
days.
Herr Es Harieloerr has arrived at BERN4313, on the Grotesque Catahoula
Leopard after seven days.
Ms. Ella has arrived at DA1285, on the Precious Hawaiian Crow after
seven days.
After seven days, Lieros Elul has arrived at YALENARO1309, on the Ugly
Australian Labradoodle.
Camila Kathy Hann Lie Th departs on the Filthy Emperor Penguin,
travelling from BERT4156 to RLIN4352, a distance of 919 light seconds.
After five days, the Ugliest Camel Cricket lands at LIAN9121, carrying
Mariella Rg Selma.
Lieros Elul leaves on the Average Huntsman Spider from YALENARO1309 to
YE4942, a journey of 3006 light seconds.
After four days, the Filthy Emperor Penguin arrives at RLIN4352,
carrying Camila Kathy Hann Lie Th.
Ms. Ella departs on the Colorful Pelican, travelling from DA1285 to
BERN8869, a distance of 3629 light seconds.
Matthew Mar departs on the Beautiful Turtles, travelling from IDA6629 to
VA2274, a distance of 4214 light seconds.
After seven days, the Average Huntsman Spider has arrived at YE4942,
carrying Lieros Elul.
The Smoggy Appenzeller Dog, carrying Herr Es Harieloerr, starts
traveling to ELOTHENORAESH7941 from BERN4313, beginning a voyage of 1644
light seconds.
The Cute Piranha, carrying Lizzie Christinia, starts traveling to
LIANTERFLOR3357 from RENAHAN7900, beginning a voyage of 3541 light
seconds.
Herr Audie Barbera leaves on the Muddy Malayan Civet from STROELEN6005
to KAR8954, a journey of 1987 light seconds.
Camila Kathy Hann Lie Th leaves on the Blue-Eyed Belgian Tervuren from
RLIN4352 to REDNOR2832, a journey of 2490 light seconds.
The Colorful Pelican arrives at BERN8869, carrying Ms. Ella after eight
days.
Lieros Elul leaves on the Fancy Tarsier from YE4942 to HAN2246, a
journey of 2553 light seconds.
Herr Es Harieloerr has arrived at ELOTHENORAESH7941, on the Smoggy
Appenzeller Dog after five days.
The Muddy Malayan Civet lands at KAR8954, carrying Herr Audie Barbera
after six days.
After eight days, Matthew Mar has arrived at VA2274, on the Beautiful
Turtles.
The Blue-Eyed Belgian Tervuren lands at REDNOR2832, carrying Camila
Kathy Hann Lie Th after six days.
Omega Ssrin Nic Wilfredo Denny Cherish begins a voyage of 2266 light
seconds on the Sparkling Taco Terrier, from ANN9369 to ELL7866.
After eight days, the Cute Piranha arrives at LIANTERFLOR3357, carrying
Lizzie Christinia.
Herr Es Harieloerr departs on the Grotesque Frog, travelling from
ELOTHENORAESH7941 to LIND2743, a distance of 4220 light seconds.
Lizzie Christinia leaves on the Adorable Monkfish from LIANTERFLOR3357
to ABBERAD6025, a journey of 3266 light seconds.
The Fancy Tarsier has arrived at HAN2246, carrying Lieros Elul after six
days.
Ms. Ella begins a voyage of 1055 light seconds on the Colorful Florida
Gar, from BERN8869 to KR2662.
Herr Audie Barbera begins a voyage of 2041 light seconds on the Filthy
Possum, from KAR8954 to FELI498.
After six days, Omega Ssrin Nic Wilfredo Denny Cherish has arrived at
ELL7866, on the Sparkling Taco Terrier.
The Colorful Florida Gar has arrived at KR2662, carrying Ms. Ella after
four days.
Simona Gar departs on the Clean English Shepherd, travelling from
DOR7951 to HARNTIN3669, a distance of 3719 light seconds.
Lizzie Christinia arrives at ABBERAD6025 on the Adorable Monkfish after
seven days.
After eight days, the Grotesque Frog has arrived at LIND2743, carrying
Herr Es Harieloerr.
Herr Audie Barbera has arrived at FELI498, on the Filthy Possum after
six days.
Herr Audie Barbera leaves on the Long Pomapoo from FELI498 to
AIRENA7849, a journey of 2094 light seconds.

One hundred three days have elapsed, with two trips in flight.
The Precious Millipede, carrying Lieros Elul, starts traveling to
GEOR9380 from HAN2246, beginning a voyage of 2652 light seconds.
Omega Ssrin Nic Wilfredo Denny Cherish departs on the Blue-Eyed Snorkie,
travelling from ELL7866 to NDR7215, a distance of 2153 light seconds.
The Sparkling Parrotlet, carrying Ms. Ella, starts traveling to LEN1622
from KR2662, beginning a voyage of 2635 light seconds.
The Clean English Shepherd has arrived at HARNTIN3669, carrying Simona
Gar after eight days.
Mariella Rg Selma leaves on the Homely Japanese Terrier from LIAN9121 to
NEL7808, a journey of 2215 light seconds.
After six days, the Long Pomapoo has arrived at AIRENA7849, carrying
Herr Audie Barbera.
Omega Ssrin Nic Wilfredo Denny Cherish arrives at NDR7215 on the
Blue-Eyed Snorkie after six days.
Lieros Elul arrives at GEOR9380 on the Precious Millipede after seven
days.
Matthew Mar begins a voyage of 4588 light seconds on the Misty
Australian Labradoodle, from VA2274 to RN9867.
Camila Kathy Hann Lie Th departs on the Precious French Bulldog,
travelling from REDNOR2832 to UNAMA5931, a distance of 2156 light
seconds.
Ms. Ella arrives at LEN1622 on the Sparkling Parrotlet after seven days.
After six days, the Homely Japanese Terrier has arrived at NEL7808,
carrying Mariella Rg Selma.
Herr Audie Barbera leaves on the Fancy Little Penguin from AIRENA7849 to
KRISNIE7825, a journey of 730 light seconds.
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
