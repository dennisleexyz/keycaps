IMG=docs/images

all:
	openscad fr.scad --render -D'$$fa=0.01' -D'size=[2,1]' -qo $(IMG)/fr-2u.png
	openscad fr.scad --render -D'$$fa=0.01' -D'size=[2,1]' -D'flip=true' -qo $(IMG)/fr-2u-flip.png
	openscad gf.scad --render -D'$$fa=0.01' -qo $(IMG)/gf.png
	openscad gf.scad --render -D'$$fa=0.01' -D'flip=true' -qo $(IMG)/gf-flip.png
	openscad gf.scad --render -D'$$fa=0.01' -D'orientation="up"' --render -qo $(IMG)/gf-up.png
	openscad gf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'flip=true' --render -qo $(IMG)/gf-up-flip.png
	openscad gf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'style_lip=2' --render -qo $(IMG)/gf-up-nolip.png
	openscad gf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'style_lip=2' -D'flip=true' --render -qo $(IMG)/gf-up-nolip-flip.png
	openscad gf.scad --render -D'$$fa=0.01' -D'size=[3,1]' --render -qo $(IMG)/gf-3x1.png
	openscad gf.scad --render -D'$$fa=0.01' -D'size=[3,1]' -D'flip=true' --render -qo $(IMG)/gf-3x1-flip.png
	openscad gf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'size=[2,1]' -D'flip=true' --render -qo $(IMG)/gf-2x1-flip.png
