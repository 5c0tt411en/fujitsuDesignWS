//pdfに書き出すための環境呼び出し
import processing.pdf.*;

//定数を設定
int   n      = 18,
      column  = 8,
      maxRow  = 7900;
//ファイル名の宣言
String      fileName;
//CSV配列の宣言，行数配列の宣言
Table[]     id      = new Table[n];
int[]       row     = new int[n];
//CSV，行，列で読めるデータ配列の宣言
String[][][] data   = new String[n][column][maxRow];

//画面サイズの設定
size(1024, 768);
//書き出すファイル名を「年月時間」に設定
fileName = str(year()) + str(month()) + str(day()) + str(hour()) + str(minute()) + str(second());
//pdf書き出し用キャプチャを指定のファイル名で開始
beginRecord (PDF, fileName + ".pdf");
//カラーモードの設定（今回はHSB（色相，彩度，明度））
colorMode (HSB, 256);
//背景を白に塗りつぶし
background(0, 0, 255);
//csvを読み込む
for (int i = 0; i < n; i++) {
  String num;
  //9以上のときは1を足して10-，未満は01-09
  num = i >= 9 ? str(i + 1) : "0" + str(i + 1);
  //ファイル名で読み込む
  id[i] = loadTable("../../Data/02_second/tamabi" + num + ".csv");
}
//データを格納する
for (int i = 0; i < n; i++) row[i] = id[i].getRowCount();
for (int i = 0; i < n; i++) {
  for (int j = 0; j < column; j++) {
    for (int k = 0; k < row[i]; k++) {
      //すべてのセルの値を格納
      data[i][j][k] = id[i].getString(k, j);
    }
  }
}

for (int i = 0; i < 1; i++) {
  for (int j = 0; j < column; j++) {
    for (int k = 0; k < row[i]; k++) {
      /* ------------ここに処理を書く-------------- */
      //色彩を5列目の値に設定
      stroke(float(data[i][4][k]) * 1.5 + 50, 255, 255);
      //線の幅を1pixelに設定
      strokeWeight(1);
      //点と点の間を線でつなぐ
      if (k < row[i] - 1) line(width / 10 + k, height / 2, width / 10 + k, height / 2- float(data[i][4][k + 1]));
      //文字色を赤に設定
      fill(0, 255, 255);
      //100の倍数行目でテキストを打つ
      if (k % 100 == 0) text(data[i][1][k] + " value: " + data[i][4][k], width / 10 + k + 2, height / 2 - float(data[i][4][k]) - 2);
    }
  }
}
//pdf用キャプチャ終了
endRecord ();
