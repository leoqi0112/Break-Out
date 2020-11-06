void intro() {
  background(black);
  textFont(font);
  intro.play();
  
  image(gif[frame], 0, 0, width, height);
  frame = frame+1;
  if (frame == 30) frame = 0;
  
  //Into text
  fill(blue);
  textAlign(CENTER);
  textSize(textS);
  text("BREAK OUT", width/2, height/3);
  
  //Text Animation
  if (textS == 80) {
    Ttimer = 50;
  }
    if (textS > 80 && Ttimer < 0){
     textS = textS-1;
    } else {
       textS = textS+1;
    }
    Ttimer = Ttimer -1;
  
  if (mouseX > width/2-200 && mouseX < width/2+200 && mouseY > 4*height/5-30 && mouseY < 4*height/5+30) {
    fill(teal);
  } else {
    fill(brightBlue);
  }
  
  //start
  textSize(40);
  text("-CLICK TO START-", width/2, 4*height/5);
  
}

void introClicks() {
   if (mouseX > width/2-200 && mouseX < width/2+200 && mouseY > 4*height/5-30 && mouseY < 4*height/5+30) {
  mode = GAME;
}
}
