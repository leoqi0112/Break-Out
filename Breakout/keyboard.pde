void keyPressed() {
  if (keyCode == RIGHT) {
  Rkey = true;
  }
  if (keyCode == LEFT) {
  Lkey = true;
  }
  if (key == 'p' || key == 'P') {
  PauseKey = true; 
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
  Rkey = false;
  }
  if (keyCode == LEFT) {
  Lkey = false;
  }
  if (key == 'p' || key == 'P') {
  PauseKey = false; 
  }
}
