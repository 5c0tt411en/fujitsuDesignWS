import processing.pdf.*;

static int  n       = 18,
            column  = 8,
            maxRow  = 7900;
String      fileName;
float       alpha;

Table[]     id      = new Table[n];
int[]       row     = new int[n];

String[][][] data   = new String[n][column][maxRow];

void setup() {
  size(1500, 1500, P3D);
  hint(DISABLE_DEPTH_TEST);
  fileName = str(year()) + str(month()) + str(day()) + str(hour()) + str(minute()) + str(second());
  noLoop();
  smooth();
  /* beginRecord (PDF, fileName + ".pdf"); */
  /* colorMode (HSB, 256); */
  /* background(236, 227, 207); */
  background(240);
  /* noStroke(); */
  PFont myFont = createFont("Helvetica", 18);
	textFont(myFont);

  loadCSV();
  buffer();
}

void draw() {
  blendMode(ALPHA);
  alpha = 15;
  for (int i = 1; i < 2; i++) {
    for (int j = 0; j < column; j++) {
      for (int k = 1; k < row[i]; k++) {
        /* ------------ここに処理を書く-------------- */
        String[] date = splitTokens(data[i][1][k]);
        String[] day  = split(date[0], "/");
        if (int(day[1]) < 10) day[1] = str(int(day[1]) + 31);
        day[1] = str(int(day[1]) - 16);
        String[] time = split(date[1], ":");
        pushMatrix();
        translate(width / 2, height / 2 - 100);
        /* rotate(float(time[0]) * 15 + float(time[1]) * 0.25); */
        rotateX(0.3 * PI);
        rotateY(0.07 * PI);
        /* theta = float(k) * 360 / 4882; */
        float pm;
        if (int(time[0]) > 12) pm = 0.5;
        else pm = 0;
        if(float(data[i][3][k]) > 95) {
          strokeWeight(float(data[i][3][k]) );
          alpha = 0.5;
        }
        else {
          alpha = 15;
          strokeWeight(4);
        }
        stroke(216, 203, 220, alpha);
        point(
            sin(PI / 2 - float(k) * 2 * PI / 4882) * (90 + float(data[i][3][k])),
            cos(PI / 2 - float(k) * 2 * PI / 4882) * (90 + float(data[i][3][k])),
            0
        );
        strokeWeight(1);
        if (k < row[i] - 1)
          line(
              sin(PI / 2 - float(k) * 2 * PI / 4882) * (90 + float(data[i][3][k])),
              cos(PI / 2 - float(k) * 2 * PI / 4882) * (90 + float(data[i][3][k])),
              0,
              sin(PI / 2 - float(k + 1) * 2 * PI / 4882) * (90 + float(data[i][3][k + 1])),
              cos(PI / 2 - float(k + 1) * 2 * PI / 4882) * (90 + float(data[i][3][k + 1])),
              0
            );

        if(float(data[i][4][k]) > 95) {
          strokeWeight(float(data[i][4][k]) );
          alpha = 1;
        }
        else {
          alpha = 15;
          strokeWeight(4);
        }
        stroke(192, 211, 222, alpha);
        point(
            sin(PI / 2 - float(k) * 2 * PI / 4882) * (200 + float(data[i][4][k])),
            cos(PI / 2 - float(k) * 2 * PI / 4882) * (200 + float(data[i][4][k])),
            0
        );
        strokeWeight(1);
        if (k < row[i] - 1)
          line(
              sin(PI / 2 - float(k) * 2 * PI / 4882) * (200 + float(data[i][4][k])),
              cos(PI / 2 - float(k) * 2 * PI / 4882) * (200 + float(data[i][4][k])),
              0,
              sin(PI / 2 - float(k + 1) * 2 * PI / 4882) * (200 + float(data[i][4][k + 1])),
              cos(PI / 2 - float(k + 1) * 2 * PI / 4882) * (200 + float(data[i][4][k + 1])),
              0
            );

        if(float(data[i][5][k]) > 95) {
          strokeWeight(float(data[i][5][k]) );
          alpha = 1;
        }
        else {
          alpha = 15;
          strokeWeight(4);
        }
        stroke(130, 200, 190, alpha);
        point(
            sin(PI / 2 - float(k) * 2 * PI / 4882) * (310 + float(data[i][5][k])),
            cos(PI / 2 - float(k) * 2 * PI / 4882) * (310 + float(data[i][5][k])),
            0
        );
        strokeWeight(1);
        if (k < row[i] - 1)
          line(
              sin(PI / 2 - float(k) * 2 * PI / 4882) * (310 + float(data[i][5][k])),
              cos(PI / 2 - float(k) * 2 * PI / 4882) * (310 + float(data[i][5][k])),
              0,
              sin(PI / 2 - float(k + 1) * 2 * PI / 4882) * (310 + float(data[i][5][k + 1])),
              cos(PI / 2 - float(k + 1) * 2 * PI / 4882) * (310 + float(data[i][5][k + 1])),
              0
            );

        strokeWeight(4);
        stroke(200, 211, 230, alpha);
        point(
            sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
            cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
            (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
        );
        strokeWeight(1);
        if (k < row[i] - 1)
          line(
              sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
              cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
              float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150,
              sin(PI / 2 - float(k + 1) * 2 * PI / 4882) * 350,
              cos(PI / 2 - float(k + 1) * 2 * PI / 4882) * 350,
              (float(data[i][3][k + 1]) + float(data[i][4][k + 1]) + float(data[i][5][k + 1]) - 150) * 2
            );
        if (float(data[i][3][k]) > 80 && float(data[i][4][k]) > 80 && float(data[i][5][k]) > 80) {
          stroke(200, 211, 190, alpha);
          strokeWeight(1);
          line(
               0,0,600,
               sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
);
          strokeWeight((float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) / 2);
          stroke(200, 211, 190, alpha);
          point(
               sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
          );
          fill(0, 0, 0, 40);
          text(
              data[i][1][k] + " focus: " + data[i][3][k] + " calm: " + data[i][4][k] + " posture: " + data[i][5][k],
              sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
            cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
            (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
);
        }

        if (float(data[i][3][k]) < 20 && float(data[i][4][k]) < 20 && float(data[i][5][k]) < 20) {
        stroke(200, 211, 190, alpha);
          strokeWeight(1);
          line(
               0,0,-600,
               sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
);
          strokeWeight((float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) / 3);
          stroke(200, 211, 190, alpha);
          point(
               sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
               (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
          );
          fill(0, 0, 0, 40);
          text(
              data[i][1][k] + " focus: " + data[i][3][k] + " calm: " + data[i][4][k] + " posture: " + data[i][5][k],
              sin(PI / 2 - float(k) * 2 * PI / 4882) * 350,
            cos(PI / 2 - float(k) * 2 * PI / 4882) * 350,
            (float(data[i][3][k]) + float(data[i][4][k]) + float(data[i][5][k]) - 150) * 2
);
        }
        popMatrix();
      }
    }
  }
  save( fileName + ".png" );
  /* endRecord (); */
}

//----------------------------------------------------
void loadCSV() {
  for (int i = 0; i < n; i++) {
    String num;
    num = i >= 9 ? str(i + 1) : "0" + str(i + 1);
    id[i] = loadTable("../../Data/02_second/tamabi" + num + ".csv");
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
