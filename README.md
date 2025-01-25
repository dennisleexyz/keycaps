# Keycaps

FR and GF profile keycaps are designed to fit in [https://github.com/dennisleexyz/gridfinity-keyboard-parts](gridfinity-keyswitch-bins) when attached to a switch. Select which switches to target and the cap dimensions will update. For example, selecting

```openscad
supported = [mx, choc_v2];
```

will result in a shorter cap than selecting

```openscad
supported = [mx];
```

Customize width and height parametrically (only rectangular for now; no ISO enter or BAE).

```openscad
// keycap width (cherry: 18, choc: 17.5)
keycw = 18;
// keycap height (cherry: 18, choc: 16.5)
keych = 18;
size = [1, 1];
```

TODO: currently the skirt height is set to the stem height, it should be changed to the switch's top housing height.

TODO: stabilizers are not yet supported.

| ![](docs/images/fr-2u.png) | ![](docs/images/fr-2u-flip.png) |
|----------------------------|---------------------------------|

The stem on MX switches is 1.1mm thick horizontally and 1.3mm thick vertically. These keycaps are generated with symmetric stems, considering that the rest of the profile is symmetric. During testing, this was not found to cause fitment issues. Also, Choc v2 stems are symmetric, according to their datasheet. TODO: add the option for asymmetric stems, particularly for non-square caps.

A 5.5mm diameter stem was found to fit Outemu GTMX and Kailh BOX/Choc v2 switches. It should also fit Gateron KS-33 Low Profile switches (untested; based on datasheet).

```openscad
// stem diameter
d = 5.5;
```

## FR (Flat Rectangular) Profile

The corner radius is concentric with the outside radius of the gridfinity-keyswitch-bins.

## GF (Gridfinity) Profile

Scaled-down version of a real Gridfinity bin! Generated using the excellent [gridfinity-rebuilt-openscad](https://github.com/kennetek/gridfinity-rebuilt-openscad/) by kennetek.

The bin can be set to face up (stem on the bottom side)

| ![](docs/images/gf-up.png) | ![](docs/images/gf-up-flip.png) |
|----------------------------|---------------------------------|

or down (stem on the top side).

```openscad
orientation = "up"; // [up: Up, down: Down]
```

| ![](docs/images/gf.png) | ![](docs/images/gf-flip.png) |
|-------------------------|------------------------------|

The stem can be shortened for stackability, but this was found to make them prone to falling off.

```openscad
stackable = true;
```

![](docs/images/gf-stackable.png)

Down-facing caps can be printed flat, but not up-facing ones unless the stacking lip is removed.

```openscad
// how should the top lip act
style_lip = 2; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]
```

| ![](docs/images/gf-up-nolip.png) | ![](docs/images/gf-up-nolip-flip.png) |
|----------------------------------|---------------------------------------|

TODO: multi-width caps (bigger than 1×1) are not yet supported. There's a 1-1.05mm gap between keycaps, but a 0.5mm gap between Gridfinity bins, which gets even smaller after scaling it down to less than half of its original dimensions. I tried changing the `scale` and the library's `BASE_TOP_DIMENSIONS` but was unsuccessful in getting things to behave in the desired manner.

Additionally, when facing down, the caps are too short to provide a deep enough cutout for switch's top housing clearance without cutting into the bases and leaving holes between them.

| ![](docs/images/gf-3x1.png) | ![](docs/images/gf-3x1-flip.png) |
|-----------------------------|----------------------------------|

For even numbers of bases, when facing up, the stem will be in the middle and interfere with stacking.

![](docs/images/gf-2x1-flip.png)

## License

[Stem generation parameters are from Pseudoku (Asymplex Designs) under GPL-3.0.](https://github.com/pseudoku/PseudoMakeMeKeyCapProfiles) Therefore, keycaps in this repository are under that license.

Copyright (C) 2025 Dennis Lee

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. 
