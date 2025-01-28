IMG=docs/images

all:
	openscad fr.scad --render -D'$$fa=0.01' -D'size=[2,1]' -qo $(IMG)/fr-2u.png
	openscad fr.scad --render -D'$$fa=0.01' -D'size=[2,1]' -D'flip=true' -qo $(IMG)/fr-2u-flip.png
	openscad mf.scad --render -D'$$fa=0.01' -qo $(IMG)/mf.png
	openscad mf.scad --render -D'$$fa=0.01' -D'flip=true' -qo $(IMG)/mf-flip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'stackable=true' -D'flip=true' -qo $(IMG)/mf-stackable-flip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="up"' --render -qo $(IMG)/mf-up.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'flip=true' --render -qo $(IMG)/mf-up-flip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'style_lip=2' --render -qo $(IMG)/mf-up-nolip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'style_lip=2' -D'flip=true' --render -qo $(IMG)/mf-up-nolip-flip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'size=[3,1]' --render -qo $(IMG)/mf-3x1.png
	openscad mf.scad --render -D'$$fa=0.01' -D'size=[3,1]' -D'flip=true' --render -qo $(IMG)/mf-3x1-flip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="up"' -D'size=[2,1]' -D'flip=true' --render -qo $(IMG)/mf-2x1-flip.png
