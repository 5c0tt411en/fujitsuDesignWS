//pdfに書き出すための環境呼び出し
import processing.pdf.*;

//定数を設定
static int  n       = 18,
            column  = 8,
            maxRow  = 7900;
//ファイル名の宣言
String      fileName;
//CSV配列の宣言，行数配列の宣言
Table[]     id      = new Table[n];
int[]       row     = new int[n];
//CSV，行，列で読めるデータ配列の宣言
String[][][] data   = new String[n][column][maxRow];

//初期設定用のsetup関数
void setup() {
  //画面サイズの設定
  size(1024, 768);
  //書き出すファイル名を「年月時間」に設定
  fileName = str(year()) + str(month()) + str(day()) + str(hour()) + str(minute()) + str(second());
  //ループしない
  noLoop();
  //pdf書き出し用キャプチャを指定のファイル名で開始
  beginRecord (PDF, fileName + ".pdf");
  //カラーモードの設定（今回はHSB（色相，彩度，明度））
  colorMode (HSB, 256);
  //背景を白に塗りつぶし
  background(0, 0, 255);
  //csvを読み込む関数を実行
  loadCSV();
  //データを格納する関数を実行
  buffer();
}

//常に繰り返し実行するdraw関数
void draw() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < column; j++) {
      for (int k = 0; k < row[i]; k++) {
        /* ------------ここに処理を書く-------------- */
      }
    }
  }
  //pdf用キャプチャ終了
  endRecord ();
}

//----------------------------------------------------
//csvを読み込む関数
void loadCSV() {
  for (int i = 0; i < n; i++) {
    String num;
    //9以上のときは1を足して10-，未満は01-09
    num = i >= 9 ? str(i + 1) : "0" + str(i + 1);
    //ファイル名で読み込む
    id[i] = loadTable("../../../Data/02_second/tamabi" + num + ".csv");
  }
}

//データを格納する関数
void buffer() {
  //CSVごとの行の数を読み込む
  for (int i = 0; i < n; i++) row[i] = id[i].getRowCount();

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < column; j++) {
      for (int k = 0; k < row[i]; k++) {
        //すべてのセルの値を格納
        data[i][j][k] = id[i].getString(k, j);
      }
    }
  }
}

