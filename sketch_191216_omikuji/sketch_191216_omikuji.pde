import processing.opengl.*;

color[] pallete = {#f64231,#f64231, #a8c8b9,#f64231, #a8c8b9};
int sw = 8;
int snow_num = 30;

float[] snowX = new float[snow_num];
float[] snowY = new float[snow_num];
float[] snowXS = new float[snow_num];
float[] snowYS = new float[snow_num];
float[] snowS = new float[snow_num];

// card[] cards = new card[10];

int imgNum = 7;
PImage[] imgs = new PImage[imgNum];
PImage[] kumoImgs = new PImage[1];

PGraphics kumoCanvas;
PGraphics kujiCanvas;

void setup() {
  // size(1280, 720, OPENGL);
  fullScreen(OPENGL);
  background(255);
  strokeCap(ROUND);
  // colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);

  kumoCanvas = createGraphics(800, 185);
  kujiCanvas = createGraphics(width, height);
  kujiCanvas.beginDraw();
    kujiCanvas.background(247,242,231);
  kujiCanvas.endDraw();
  kumoCanvas.beginDraw();
    kumoCanvas.clear();
  kumoCanvas.endDraw();

  for (int i = 0; i < imgNum; i++) {
    imgs[i] = loadImage("data/img" + i+".png");
  }
  for (int i = 0; i < 1; i++) {
    kumoImgs[i] = loadImage("data/kumo" + i+".png");
  }

  for(int i = 0; i < 300; i++){
    preDrawKuji();
    // drawKuji();
  }
}

void draw() {
  kumoCanvas.beginDraw();
    kumoCanvas.clear();
    kumoCanvas.image(kumoImgs[0], 0,0);
  kumoCanvas.endDraw();
  clear();
  pushMatrix();
    // zoomLife -= 0.2;
    zoomLife = zoomLife/2;
    zoomLife = max(zoomLife,0);
    translate(width/2, height/2);
    scale(1 + zoomLife/5);
    translate(-width/2, -height/2);
    image(kujiCanvas, 0, 0);
  popMatrix();
  image(kumoCanvas, frameCount/2 % (width+kumoCanvas.width)-kumoCanvas.width, -20);
  image(kumoCanvas, width-frameCount/3.45 % (width+kumoCanvas.width)-kumoCanvas.width, height - 160);
}

void mouseClicked(){
  drawKuji();
  zoomLife = 1;
}

float zoomLife = 0;

void drawKuji(){
  kujiCanvas.beginDraw();
    kujiCanvas.pushMatrix();
    kujiCanvas.translate(random(width-800)+400, random(height-800)+400);
    kujiCanvas.rotate(radians(random(40)-20));
    kujiCanvas.translate(-200, -400);
    kujiCanvas.image(imgs[int(random(imgNum))], 0,0);
    kujiCanvas.popMatrix();
  kujiCanvas.endDraw();

  image(kujiCanvas, 0, 0);
  image(kumoCanvas, frameCount/2 % (width+kumoCanvas.width)-kumoCanvas.width, -20);
  image(kumoCanvas, width-frameCount/3.45 % (width+kumoCanvas.width)-kumoCanvas.width, height - 160);


}


void preDrawKuji(){
  kujiCanvas.beginDraw();
    kujiCanvas.pushMatrix();
    kujiCanvas.translate(random(width), random(height));
    kujiCanvas.rotate(radians(random(40)-20));
    kujiCanvas.translate(-200, -400);
    kujiCanvas.image(imgs[int(random(imgNum))], 0,0);
    kujiCanvas.popMatrix();
  kujiCanvas.endDraw();

  image(kujiCanvas, 0, 0);
  image(kumoCanvas, frameCount/2 % (width+kumoCanvas.width)-kumoCanvas.width, -20);
  image(kumoCanvas, width-frameCount/3.45 % (width+kumoCanvas.width)-kumoCanvas.width, height - 160);
}
