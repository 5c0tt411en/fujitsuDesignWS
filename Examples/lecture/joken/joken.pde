int a = 5;
int b = 4;
int c = 3;

if (a > b) println("aはbより大きいです");
if (a > b && a > c) println("aはb，cよりも大きいです");
if (a == b) println("aとbは同じです");
if (b >= c) println("bはc以上です");
if (b >= c || a == c) println("bはc以上，またはaとcは同じです");
