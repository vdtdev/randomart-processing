int x=100; int y=100;
int lx=100; int ly=100;
int spd=1;

sketcher a,d;
sketcher b;
void setup(){
  size(512,512);
  a=new sketcher(100,100,1,0,60);
  b=new sketcher(200,200,1,0,60);
  d=new sketcher(300,300,1,0,80);
  smooth();
}

void draw(){
a.render();
b.render();
d.render();
}
