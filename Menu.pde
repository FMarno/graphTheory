class Menu {
  ArrayList<Button> buttons = new ArrayList<Button>();

  void display() {
    for (Button b : buttons) {
      b.display();
    }
  }

  void press(float x, float y) {
    for (Button b : buttons) {
      if (b.contains(x, y)) {
        b.run();
      }
    }
  }
}