import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Breakout
//Leo Qi
//1-2 A
//Nov 3, 2020

//sound variables
Minim minim;
AudioPlayer beep, boop, smash, failure, win, intro;
//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
//ball
float ballx, bally, balld;
//ball velocity
float vx, vy;
//paddle
float paddlex, paddley, paddled;

//keyboard variables
boolean Rkey, Lkey, PauseKey;

//timer
int timer;

//palette
color black = #2A2829;
color teal = #668284;
color blue = #B9D7D9;
color red = #7B3B3B;
color scarlet = #F40034;
color mango = #FF4E50;
color orange = #FFA20D;
color yellow = #F1C54E;
color lightGreen = #D6FF9F;
color green = #489C79;
color pink = #FE6196;
color cyan = #73C8A9;
color brightBlue = #4DBCE9;


//lives variable
int lives;

//Arays
int[] x;
int[] y;
boolean[] alive;
int brickd;

//# of bricks 
int n;

int tempx;
int tempy;

//score
int score;

//gif
PImage[] gif;
int frame;
PImage[] gif2;
int numberOfFrames;
int f;

//text
float textS;
int Ttimer;
//font


PFont font;
void setup() {
  
  //load animated gif
  gif = new PImage [30];
  int g = 0;
  while (g < 30) {
    gif [g] = loadImage("frame_"+g+"_delay-0.04s.gif"); 
    g = g+1;
  }
   
  numberOfFrames = 30;
  gif2 = new PImage[numberOfFrames];
  
  int j = 0;
  while (j < numberOfFrames) {
    gif2[j] = loadImage("frame_"+j+"_delay-0.07s.gif");
    j = j+1;
  }
  
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
  
  //textMode(CENTER);
  size (800, 800, FX2D);
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
  Rkey = Lkey = PauseKey = false;
  
  //initialize timer
  timer = 100;
  
  //initialize score+lives
  lives = 3;
  score = 0;
  
  //Intro text
  textS = 80;
  Ttimer = 50;
  
  //font
  font = createFont("Lequire.otf", 100);
  
  //minim 
  minim = new Minim(this);
  boop = minim.loadFile("boop.wav");
  beep = minim.loadFile("beep.wav");
  smash = minim.loadFile("break.wav");
  failure = minim.loadFile("failure.wav");
  intro = minim.loadFile("intro.wav");
  win = minim.loadFile("win.wav");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
