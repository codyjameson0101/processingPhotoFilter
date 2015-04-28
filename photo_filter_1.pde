PImage photo;
int smallPoint, largePoint;
int w = 100; // Width of the input picture
int h = 100; // Height of the input picture
int pixelScale = 10; // How many times larger than the input picture you want the output picture be.
int border = pixelScale * 2; // Border around output picture
void setup() {
  size(500, 375 );
  photo = loadImage("ocean.jpg");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(255);
}
void draw() {
  float pixelsEverywhere = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(photo.width));
  int y = int(random(photo.height));
  color pix = photo.get(x, y);
  fill(pix, 100);
  rect(x, y, pixelsEverywhere, pixelsEverywhere);
  scanPicture();
}
void keyPressed() {
  if (key=='s') {
    saveImage();
  }
  if (key=='z') {
    background(255);
  }
  if (key=='b') {
    filter(BLUR);
  }
  if (key=='i') {
    filter(INVERT);
  }
}

void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0, 0, width, height);
  imageSave.save(fileName);
}
String timeStamp() {
  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
  return timestamp;
}
void scanPicture() {
  color c ; // Variable to hold the color of the picture

  // Scan from top to bottom
  for ( int y = 0; y < h; y++) {

    // Scan from left to right
    for ( int x = 0; x < w; x++) {

      // Get the rgb value of the pixel at x,y location and put it into a color variable
      c = get(x, y); 

      // get the red component of the color
      int r = int(red(c)); 

      // get the green component of the color
      int g = int(green(c));

      // get the blue component of the color
      int b = int(blue(c));

      //
      // Modify the color information here
      //

      r = r ;
      g = g -30;
      b = b -255;


      // Reassemble the color variable
      c = color(r, g, b); 

      int outputX = x*pixelScale;
      int outputY = y*pixelScale;

      // Modify the pixel location here
      outputX = outputX;
      outputY = outputY;

      //
      // Draw whatever you like to represent the pixel
      //
      noSmooth(); // Turn off antialiasing if you like
      //      noStroke(); // Remove the stroke line if you like
      fill(c); // Set the fill color of the shape
      stroke(c);
    }
  }
}

