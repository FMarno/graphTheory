class NextButton extends Button {

  public NextButton(PVector l, float w, float h) {
    super(l, w, h);
  }
  void run() {
    level = new Level(++number);
    SUCCESS = false;
  }
  void display() {
    fill(#00ff00);
    stroke(0);
    strokeWeight(1);
    rect(l.x, l.y, w,h);
    fill(255);
    textSize(width/8);
    text("NEXT", l.x, l.y-8);
  }
}