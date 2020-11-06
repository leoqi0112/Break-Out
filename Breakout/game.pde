void game() {
  background(black);
  stroke(0);
  strokeWeight(4);
  textFont(font);
  intro.pause();
  
  //Pause
  noStroke();
  fill(black);
  
  if (dist(mouseX, mouseY, width/8, 40) < 40) {
  circle(width/8, 40, 80);
  stroke(cyan);
  strokeWeight(8);
  fill(black);
  triangle(width/8-15, 25, width/8+12, 40, width/8-15, 55);
  } else {
  circle(width/8, 40, 80);
  stroke(cyan);
  strokeWeight(8);
  line(width/8-13, 20, width/8-13, 60);
  line(width/8+12, 20, width/8+12, 60);
  }
  
  stroke(0);
  strokeWeight(4);
  //ball
  fill(blue);
  circle(ballx, bally, balld);
  
  //move ball
  if (timer < 0) {
  ballx = ballx + vx;
  bally = bally + vy;
  }
  timer = timer - 1;
  
  //R && L wall collision
  if (ballx < balld/2 || ballx > width-balld/2) {
    vx = vx*-1;
    boop.rewind();
    boop.play();
  }
  
  //uper wall collision
  if (bally < balld/2) {
    vy = vy*-1;
    boop.rewind();
    boop.play();
  }
  
  //reset ball position
  if (bally < balld/2) {
    bally = balld/2;
  }
  
  if (ballx < balld/2){
    ballx = balld/2;
  }
  
  if (ballx > width-balld/2) {
    ballx = width-balld/2;
  }
  //paddle
  fill(teal);
  circle(paddlex, paddley, paddled);
  
  //move paddles
  if (Lkey == true && paddlex > 100) {
    paddlex = paddlex - 5;
  }
  if (Rkey == true && paddlex < width-100) {
    paddlex = paddlex + 5;
  }
  
  //ball paddle collision
  if (dist(paddlex, paddley, ballx, bally) <= paddled/2 + balld/2) {
    vx = (ballx - paddlex)/15;
    vy = (bally - paddley)/15;
    beep.rewind();
    beep.play();
  }
  
  //lives 
  fill(red);
  textSize(50);
  text("LIVES:"+lives, width-200, 50);
  text("SCORE:"+score, width-500, 50);
  
  if (bally > height+balld/2) {
    ballx = width/2;
    bally = 5*height/6;
    lives = lives -1;
    timer = 100;
    vx = 0;
    vy = 5;
  }
  
  if (lives == 0) {
    mode = GAMEOVER; 
    failure.rewind();
  } else if (score == 108) {
    mode = GAMEOVER; 
    win.rewind();
  }
  
  //brick
  fill(scarlet);
  //circle (x[0], y[0], brickd);
  //circle (x[1], y[1], brickd);
  //circle (x[2], y[2], brickd);
  
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
    manageBrick(i);
    }
    i++;
  }   
}

//bricks
void manageBrick (int i) {
  //brick colors
    if (y[i] == 125) {
      fill(scarlet);
    } else if (y[i] == 175) {
      fill(pink);
    } else if (y[i] == 225) {
      fill(mango);
    } else if (y[i] == 275) {
      fill(orange);
    } else if (y[i] == 325) {
      fill(yellow);
    } else if (y[i] == 375) {
      fill(lightGreen);
    } else if (y[i] == 425) {
      fill(cyan);
    } else if (y[i] == 475) {
      fill(green);
    } else if (y[i] == 525) {
      fill(brightBlue);
    }
    
    
    circle (x[i], y[i], brickd);
  
  //brick bouncing
   
  if (dist(ballx, bally, x[i], y[i]) <= brickd/2 + balld/2) {
    vx = (ballx - x[i])/3;
    vy = (bally - y[i])/3;
    alive[i] = false;
    score = score +1;
    smash.rewind();
    smash.play();
     
}

}
void gameClicks() {
   if (dist(mouseX, mouseY, width/8, 40) < 40) {
  mode = PAUSE;
   }
}
