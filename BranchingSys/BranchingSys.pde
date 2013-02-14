/**************************************
 *           Branching System         *
 * -================================- */

final int dimensions=2;

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
}

