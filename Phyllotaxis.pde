// Phyllotaxis Coding Challenge
// https://www.youtube.com/watch?v=KWoJgHFYWxY
// phyllon = leaf, taxis = arrangement

// gifAnimation init
import gifAnimation.*;
GifMaker gifExport;
int frames = 0;
int totalFrames = 200;
//

float n = 0;
float c = 5;
float phi = radians(137.5); // 137.5˚
float r; // c * sqrt(n)

void setup(){
  size(400,400);
  
  // gifAnimation Setup
  gifExport = new GifMaker(this,"phyllotaxis.gif",100);
  gifExport.setRepeat(0); // "endless" animation
  //
  
  //angleMode(DEGREES);
  colorMode(HSB);
  background(0);
  
  
}

void draw(){
  float a = n * phi;
  float r = c * sqrt(n);
  
  float x = r * cos(a) + width/2;
  float y = r * sin(a) + height/2;
  fill(n % 256, 255, 255);
  noStroke();
  ellipse(x,y,6,6);
  
  n++;
  export();

}

void export() {
   if(frames < totalFrames) {
    gifExport.setDelay(20);
    gifExport.addFrame();
    frames++;
  } else {
    gifExport.finish();
    frames++;
    println("gif saved");
    exit();
  }
}
