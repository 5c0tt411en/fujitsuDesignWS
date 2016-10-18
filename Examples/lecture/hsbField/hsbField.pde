size(256, 256);
colorMode(HSB);    //カラーモードをHSB（色相、彩度、明度）に変換
noStroke();
 
for(int y=0; y<256; y+=5) {
  for(int x=0; x<256; x+=5) {
    fill(x, y, 255);    //x軸方向に黒色相が変化、y軸方向に彩度が変化
    rect(x, y, 5, 5);
  }
}
