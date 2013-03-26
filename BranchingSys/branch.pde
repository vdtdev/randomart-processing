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
    for(int i=0;i<this.cache.length;i++){
      print(cache[i]);
    }
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

  /**
   Return to the first instruction
   */
  public void restart() {
    this.ic=0;
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
class Branch {
  private float p[]=new float[] {
    0f, 0f, 0f, 0f
  };
  private float size=1.0f;
  private final int x1=0, y1=1, x2=2, y2=3;
  private PathFinder navi;
  private int fg; // foreground color
  /**
   Branch constructor
   @param floatx Starting X position
   @param floaty Starting Y position
   @param forecolor Foreground stroke color
   @param strokeSize Stroke size
   @param path Path instructions
   */
  public Branch(float startx, float starty, int forecolor, float strokeSize, String path) {
    p[x1]=p[x2]=startx;
    p[y1]=p[y2]=starty;
    this.size=strokeSize;
    fg=forecolor;
    this.navi=new PathFinder(path);
  }

  public void render() {
    pushStyle();

    stroke(fg);
    
    print(p[x1] + "," + p[y1]);
    
    p[x2]=p[x1]; // copy old x
    p[y2]=p[y1]; // copy old y

    if (navi.atEnd()) navi.restart(); 
    float v[] = this.navi.next();
    
    p[x1]+=v[0];
    p[y1]+=v[1];
    
    p[x1]=Geom.wrap(p[x1],width);
    p[y1]=Geom.wrap(p[y1],height);
    
    line(p[x2],p[y2],p[x1],p[y1]);
    
    popStyle();
  }
}

