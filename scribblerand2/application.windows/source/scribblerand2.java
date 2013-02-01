import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class scribblerand2 extends PApplet {

int x=100; int y=100;
int lx=100; int ly=100;
int spd=1;

sketcher a,d;
sketcher b;
public void setup(){
  size(512,512);
  a=new sketcher(100,100,1,0,60);
  b=new sketcher(200,200,1,0,60);
  d=new sketcher(300,300,1,0,80);
  smooth();
}

public void draw(){
a.render();
b.render();
d.render();
}
class sketcher{
int x=100; int y=100;
int lx=100; int ly=100;
int spd=1;
int clr=0;
int opac=60;
public sketcher(int sx, int sy, int spd, int col, int op){
this.spd=spd;
this.x=sx;
this.y=sy;
this.opac=op;
this.clr=col;
}
public void randomMove(){
  ly=y;
  lx=x;
  int xd = (int)random(10);
  int yd=(int)random(10);
  if(xd>5){x=x+abs(xd-5)*spd;}
  if(xd<5){x=x-abs(xd-5)*spd;}
  if(yd>5){y=y+abs(yd-5)*spd;}
  if(yd<5){y=y-abs(yd-5)*spd;}
  stroke(clr,opac);
  line(lx,ly,x,y);
}
public void render(){
  randomMove() ;
x=(x<0)?x+width:(x>width)?0:x;
y=(y<0)?y+width:(y>width)?0:y;
}
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "scribblerand2" });
  }
}
