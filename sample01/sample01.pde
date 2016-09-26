static int  n       = 18,
            column  = 8,
            maxRow  = 7900;

Table[] id = new Table[n];
int[] row = new int[n];

String[][][] data = new String[n][column][maxRow];

void setup() {
  noLoop();
  background(255);
  size(1920, 1080);

  loadCSV();
  buffer();
}

void draw() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < column; j++) {
      for (int k = 0; k < row[i]; k++) {
        ellipse(float(k/3), float(data[i][4][k]) / 3 + 100/3 * i, 1, 1);
      }
    }
  }
}

//----------------------------------------------------
void loadCSV() {
  for (int i = 0; i < n; i++) {
    String num;
    num = i >= 9 ? str(i + 1) : "0" + str(i + 1);
    id[i] = loadTable("../Data/02_second/tamabi" + num + ".csv");
  }
}

void buffer() {
  for (int i = 0; i < n; i++) row[i] = id[i].getRowCount();

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < column; j++) {
      for (int k = 0; k < row[i]; k++) {
        data[i][j][k] = id[i].getString(k, j);
      }
    }
  }
}
