IMG=docs/images

stl:
	openscad fr.scad -D'angle=180' -qo fr.stl
	openscad gf.scad -D'angle=180' -qo gf.stl
	openscad mf.scad -D'angle=180' -qo mf.stl


png:
	openscad fr.scad --render -D'$$fa=0.01' -D'size=[2,1]' -qo $(IMG)/fr-2u.png
	openscad fr.scad --render -D'$$fa=0.01' -D'size=[2,1]' -D'flip=true' -qo $(IMG)/fr-2u-flip.png
	openscad gf.scad --render -D'$$fa=0.01' -D'angle=45' -qo $(IMG)/gf-45.png
	openscad gf.scad --render -D'$$fa=0.01' -D'angle=90' -qo $(IMG)/gf-90.png
	openscad mf.scad --render -D'$$fa=0.01' -D'angle=45' -qo $(IMG)/mf-45.png
	openscad mf.scad --render -D'$$fa=0.01' -D'angle=90' -qo $(IMG)/mf-90.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="down"' -qo $(IMG)/mf-down.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="down"' -D'stackable=true' -D'angle=180' -qo $(IMG)/mf-down-stackable-180.png
	openscad mf.scad --render -D'$$fa=0.01' -D'orientation="down"' -D'angle=180' -qo $(IMG)/mf-down-bad.png
	openscad mf.scad --render -D'$$fa=0.01' -D'style_lip=2' -qo $(IMG)/mf-nolip.png
	openscad mf.scad --render -D'$$fa=0.01' -D'style_lip=2' -D'angle=180' -qo $(IMG)/mf-nolip-180.png
	openscad mf.scad --render -D'$$fa=0.01' -D'size=[3,1]' -D'orientation="down"' -qo $(IMG)/mf-3x1-down.png
	openscad mf.scad --render -D'$$fa=0.01' -D'size=[3,1]' -D'orientation="down"' -D'angle=180' -qo $(IMG)/mf-3x1-down-180.png
	openscad mf.scad --render -D'$$fa=0.01' -D'size=[2,1]' -D'angle=180' -qo $(IMG)/mf-2x1-180.png
