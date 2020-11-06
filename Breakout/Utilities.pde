//initialization
void reset() {
  //textMode(CENTER);
  size (800, 800);
  mode = INTRO;
  
  //initialize ball 
  ballx = width/2;
  bally = 5*height/6;
  balld = 10;
  
  //initialize ball speed
  vx = 0;
  vy = 5;
  
  //initialize paddles
  paddlex = width/2;
  paddley = height;
  paddled = 200;
  
  //initialize keyboard
  Rkey = Lkey = false;
  
  //initialize timer
  timer = 100;
  
  //initialize score+lives
  lives = 3;
  score = 0;
  
  //Intro text
  textS = 80;
  Ttimer = 50;
  
  win.rewind();
  failure.rewind();
  intro.rewind();
  
   //bricks 
  n = 108;
  
  x = new int[n];
  y = new int[n];
  alive = new boolean [n];
  brickd = 25;
  
  tempx = 125;
  tempy = 125;
 
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 50;
    if (tempx == 725) {
      tempy = tempy + 50;
      tempx = 125;
    }
    i++;
  }
}
