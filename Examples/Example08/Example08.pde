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
size(1490, 1850);
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

for (int i = 1; i < 2; i++) {
  for (int j = 0; j < column; j++) {
    for (int k = 1; k < row[i]; k++) {
      /* ------------ここに処理を書く-------------- */
      // スペースで分割して配列に格納する
      // 5/17/2016  13:40:00　の場合date[0] = 5/17/2016, date[1] = 13:40:00
      String[] date = splitTokens(data[i][1][k]);
      // スラッシュで分割して配列に格納する
      // 5/17/2016　の場合day[0] = 5, day[1] = 17, day[2] = 2016
      String[] day  = split(date[0], "/");
      //コロンで分割して配列に格納する
      // 13:40:00　の場合time[0] = 13, time[1] = 40, time[2] = 00
      String[] time  = split(date[1], ":");
      if (int(day[1]) < 10) day[1] = str(int(day[1]) + 31);
      day[1] = str(int(day[1]) - 16);
      //線の幅を1pixelに設定
      strokeWeight(1);
      //アルファを4列目の値に設定
      stroke(150, 255, 255, float(data[i][3][k]));
      //点と点の間を線でつなぐ
      line(20 + float(time[0]) * 60 + float(time[1]), height - 20 - 100 * float(day[1]), 20 + float(time[0]) * 60 + float(time[1]), height - 20 - float(data[i][3][k]) - 100 * float(day[1]));
      //アルファを5列目の値に設定
      stroke(210, 255, 255, float(data[i][4][k]));
      //点と点の間を線でつなぐ
      line(20 + float(time[0]) * 60 + float(time[1]), height - 20 - 100 * float(day[1]), 20 + float(time[0]) * 60 + float(time[1]), height - 20 - float(data[i][4][k]) - 100 * float(day[1]));
      //アルファを6列目の値に設定
      stroke(130, 255, 255, float(data[i][5][k]));
      //点と点の間を線でつなぐ
      line(20 + float(time[0]) * 60 + float(time[1]), height - 20 - 100 * float(day[1]), 20 + float(time[0]) * 60 + float(time[1]), height - 20 - float(data[i][5][k]) - 100 * float(day[1]));
    }
  }
}
//pdf用キャプチャ終了
endRecord ();
