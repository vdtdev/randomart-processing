/**
 * Branching System
 * =================
 * PathFinder class
 * Uses a string to dictate direction and magnitude
 * ex: u2.l4.d6.r8 = up 2, left 4, down 6, right 8 
 * ------------------------------------------------
 * @author Wade Harkins <vdtdev@gmail.com>
 * @version 1.0.2013.02.14
 */
class PathFinder {
  private String instruction="";
  private String[] cache;
  private int clen=-1;
  public final float[] END_OF_INS=new float[] {
    999f, 999f
  };
  private int ic=0;
  /**
   Constructor
   @param instructions Path instructions
   */
  public PathFinder(String instructions) {
    this.instruction=instructions;
    this.clen=instructions.split(".").length;
    this.cache=instructions.split(".");
  }
  /**
   Return next coord (float[2]) and advance ic
   @return next coordinate, or END_OF_INS if at end
   */
  public float[] next() {
    if (ic>=clen) {
      return END_OF_INS;
    }
    float x=0f, y=0f;
    char i = cache[ic].toCharArray()[0];
    float mag = (float)Integer.valueOf(cache[ic].substring(1, cache[ic].length()-1));
    switch(i) {
    case 'u':
      y=-mag;
      break;
    case 'l':
      x=-mag;
      break;
    case 'r':
      x=mag;
      break;
    case 'd':
      y=mag;
      break;
    }
    ic++;
    return new float[] {
      x, y
    };
  }
  /**
   Check if the ic points beyond last instruction.
   Decrements the ic to offset the advance that takes place in
   this.next() call
   @return atEnd True if past last instruction, false otherwise
   */
  public boolean atEnd() {
    boolean end=(this.next()==END_OF_INS);
    if (end)ic--; // return ic to previous state if needed
    return end;
  }
}

/**
 * Branching System
 * =================
 * Branch class
 * Renders a predefined path using the pathfinder
 * @author Wade Harkins <vdtdev@gmail.com>
 * @version 1.0.2013.02.14
 */
class branch {
  float p[]=new float[] {
    0f, 0f, 0f, 0f
  };
  final int x1=0, y1=1, x2=2, y2=3;
}

