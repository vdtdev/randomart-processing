
Trace[] l = new Trace[4];

void setup() {
  colorMode(RGB, 50);
  size(256, 256);
  smooth();
  l[0]=new Trace(width/2, 0, 7, color(30));
  l[1]=new Trace(width/4, 0, 5, color(15));
  l[2]=new Trace(width*(2/3), 0, 4, color(0));
  l[3]=new Trace(width, 0, 6, color(45));
}

void draw() {
  for (Trace t:l) {
    t.render();
  }
}

void keyPressed() {
  if (key=='c') {
    save("circuit.tiff");
  }
}

