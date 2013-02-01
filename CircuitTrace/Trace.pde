/**
 Draws a wandering line moving at a set rate with a set color
 at 90 angles (U/L/D/R).
 Wraps from the left to the right and top to bottom
 **/
class Trace {

  private float x, y, lx, ly, inc;
  private color shade;
  private int dir=-1, ldir=-1;
  public Trace(float startX, float startY, float speed, color shade) {
    this.shade=shade;
    this.x=this.ly=startX;
    this.y=this.ly=startY;
    this.inc=speed;
  }


  private void update() {
    lx=x;
    ly=y;
    ldir=dir;
    boolean cont=true;
    while (cont) {
      dir=(int)random(4);
      cont=backtracking();
    }
    switch(dir) {
    case 1:
      x+=inc;
      break;
    case 2:
      x-=inc;
      break;
    case 3:
      y+=inc;
      break;
    case -4:
      y-=inc;
      break;
    }
    wrap();
  }

  private void wrap() {
    float a, b;
    a=x;
    b=y;
    x=(x>width)?x-width:(x<0)?x+width:x;
    y=(y>height)?y-height:(y<0)?y+height:y;
    if (a!=x||b!=y) {
      lx=x;
      ly=y;
    }
  }

  public void render() {
    update();
    stroke(shade);
    line(lx, ly, x, y);
  }

  private boolean backtracking() {
    boolean back = true;
    back =!(dir==1 && ldir==2) &&
      !(dir==2 && ldir==1);
    return !back;
  }
}

