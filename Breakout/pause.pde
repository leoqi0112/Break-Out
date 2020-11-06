void pause() {
  background(black);
  textFont(font);
  stroke(0);
  
  //Pause
  noStroke();
  fill(black);
  
  if (dist(mouseX, mouseY, width/8, 40) < 40) {
  circle(width/8, 40, 80);
  stroke(cyan);
  strokeWeight(8);
  line(width/8-13, 20, width/8-13, 60);
  line(width/8+12, 20, width/8+12, 60);
  } else {
  circle(width/8, 40, 80);
  stroke(cyan);
  strokeWeight(8);
  fill(black);
  triangle(width/8-15, 25, width/8+12, 40, width/8-15, 55);
  }
  
  
  stroke(0);
  strokeWeight(4);
  //ball
  fill(blue);
  circle(ballx, bally, balld);
  
  //paddle
  fill(teal);
  circle(paddlex, paddley, paddled);
  
  //score+lives
  fill(red);
  textSize(50);
  text("LIVES:"+lives, width-200, 50);
  text("SCORE:"+score, width-500, 50);
  
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
    manageBrick(i);
    }
    i++;
  }
}

void pauseClicks() {
   if (dist(mouseX, mouseY, width/8, 40) < 40) {
  mode = GAME;
  
   }
}
