class sketcher {
  int x=100; 
  int y=100;
  int lx=100; 
  int ly=100;
  int spd=1;
  int clr=0;
  int opac=60;
  public sketcher(int sx, int sy, int spd, int col, int op) {
    this.spd=spd;
    this.x=sx;
    this.y=sy;
    this.opac=op;
    this.clr=col;
  }
  void randomMove() {
    ly=y;
    lx=x;
    int xd = (int)random(10);
    int yd=(int)random(10);
    if (xd>5) {
      x=x+abs(xd-5)*spd;
    }
    if (xd<5) {
      x=x-abs(xd-5)*spd;
    }
    if (yd>5) {
      y=y+abs(yd-5)*spd;
    }
    if (yd<5) {
      y=y-abs(yd-5)*spd;
    }
    stroke(clr, opac);
    line(lx, ly, x, y);
  }
  void render() {
    randomMove() ;
    x=(x<0)?x+width:(x>width)?0:x;
    y=(y<0)?y+width:(y>width)?0:y;
  }
}

