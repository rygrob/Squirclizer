PGraphics pg;
PImage icon;
color clear;

// 1. put the icon you want to squirclize the working directory

// 2. provide the name of the icon you want to squirclize
String inputFileName = "cool_icon.png";
String outputFileName = "squircle_icon.png";

void setup() {
  // 3. these numbers should match the width and height of your icon
  size(1024, 1024);
  pg = createGraphics(1024, 1024);
}

void draw() {
  pg.beginDraw();
  icon = loadImage(inputFileName);
  clear = color(0, 0, 0, 0);
  float a = width/2;
  float b = height/2;
  // 4. this sets the amount of squircle-ness
  float n = 5.2;
  pg.image(icon, 0, 0);
  pg.loadPixels();
  for (int i = 0; i < pg.pixels.length; i++) {
    // if pixel is not inside the squircle, set its alpha to 0
    int x = i % width - width / 2;
    int y = i / width - height / 2;
    float value = pow(abs((float)x/a), n) + pow(abs((float)y/b), n);
    if (value >= 1.0) {
      pg.pixels[i] = clear;
    }
  }
  pg.updatePixels();
  pg.endDraw();
  pg.save(outputFileName);
  // display results in window
  image(pg, 0, 0);
  noLoop();
}
