
/**
 * Branching System
 * =================
 * Geometry helper class
 * @author W. Harkins <vdtdev@gmail.com>
 * @version 1.0.20130214
 */
public static class Geom {

  /**
   Wrap v from ]0,u[
   @param v Value to wrap
   @param u Upper limit
   @return wrapped value
   */
  public static float wrap(float v, float u) {
    float t;
    t=(v<0)?v+u:v;
    t=(v>u)?v-u:v;
    return t;
  }
}

