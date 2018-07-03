// Code based on Coding Challenge #11 3D Terrain Generation with Perlin Noise in Processing
// https://www.youtube.com/watch?v=IKB1hWWedMk

int cols, rows;
int scl = 20;
int w = 1200;
int h = 2000;
float offset = 0.4;
float range = 100;

float flying = 0;

float[][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
}

void draw() {
  
  flying -= 0.1;
  
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = offset;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -range, range);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  

  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
  
}
