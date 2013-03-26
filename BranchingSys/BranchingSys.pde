/**************************************
 *           Branching System         *
 * -================================- */

final int dimensions=2;

Branch b;
/**
 @author Wade Harkins <vdtdev@gmail.com>
 @version 1.0.20130214
 */
void setup() {
  if (dimensions==2) {
    size(512, 512, P2D);
  }
  else {
    size(512, 512, P3D);
  }
  smooth();
  b = new Branch(width/2,height/2,#FF0080,1f,"l6u2r9d6l12d4r4u2");
}

void draw(){
  b.render();
}
