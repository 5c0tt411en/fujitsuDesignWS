size(256, 256);
colorMode(HSB);
noStroke();

for(int y=0; y<256; y+=5) {
  for(int x=0; x<256; x+=5) {
    fill(x, y, 255);
    rect(x, y, 5, 5);
  }
}
