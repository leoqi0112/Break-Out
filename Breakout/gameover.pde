void gameover() {
  background(black);
  textFont(font);
  
  image(gif2[f], 0, 0, width, height);
  f = f+1;
  if (f ==numberOfFrames) f=0;
  
  //text
  textSize(80);
  fill(mango);
  if(score == 108) {
    text("YOU WIN", width/2, height/3);
    win.play();
  } else {
    text("YOU LOSE", width/2, height/3);
    failure.play();
  }
  text("YOUR SCORE:" + score, width/2, 2*height/3);
  
  //return button
  if (mouseX > 80 && mouseX < 320 && mouseY > 650 && mouseX < 730){
    fill(scarlet);
  } else{
    fill(red);
  }
  rect(80, 650, 240, 80);
  fill(0);
  textSize(60);
  text("Return", 200, 710);
}

void gameoverClicks() {
   if (mouseX > 80 && mouseX < 320 && mouseY > 650 && mouseX < 730){
     mode = INTRO;
     reset();
   }
}
