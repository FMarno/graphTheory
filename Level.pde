class Level {
  ArrayList<Dot> dots = new ArrayList<Dot>();
  ArrayList<Connection> connections = new ArrayList<Connection>();
  ArrayList<Dot> selected = new ArrayList<Dot>();
  ForceRegistry forceRegistry = new ForceRegistry();
  int updates = 0;
  int numOfDots;

  public Level(int numOfDots) {
    numOfDots = max(numOfDots, 4);
    this.numOfDots = numOfDots;
    addDots();

    addConnections();
  }

  void update() {
    if (updates > 300) return;
    forceRegistry.updateForces();

    for (Dot d : dots) {
      d.update();
    }

    updates++;
  }

  void display() {
    for (Connection c : connections) {
      c.display();
    }
    for (Dot d : dots) {
      d.display();
    }
  }

  void press(int x, int y) {
    PVector l = new PVector(x, y);
    for (Dot d : dots) {
      if (d.contains(l)) {
        d.selected = ! d.selected;
        if (d.selected) {
          selected.add(d);
          checkSelected();
        } else {
         selected.remove(d); 
        }
      }
    }
  }

  private void checkSelected() {
    if (selected.size() < 4) { //magic
      return;
    }
    boolean connected = true;
    for (int i = 0; i < selected.size(); i++) {
      Dot a = selected.get(i);
      for (int j = i+1; j < selected.size(); j++) {
        connected = connected && a.connections.contains(selected.get(j));
      }
    }

    if (connected) {
      SUCCESS = true;
    } else {
      for (Dot d : selected) {
        d.selected = false;
      }
      selected.clear();
    }
  }

  private void addDots() {
    int colour;
    int f;
    for (int i = 0; i < numOfDots; i++) {
      PVector l = new PVector(width/6, 0);
      l.rotate(TWO_PI*i/numOfDots);
      l.add(new PVector(width/2, height/2));
      colour = int(random(100));
      if (colour <= 33) {
        f = #ff0000;
      } else if (colour <= 66) {
        f = #00ff00;
      } else {
        f = #0000ff;
      }
      dots.add(new Dot(l, f, 0.01));
    }

    for (Dot d : dots) {
      Mag m = new Mag(d.location);
      for (Dot c : dots) {
        if (c == d) continue;
        forceRegistry.add(c, m);
      }
    }
  }

  private void addConnections() {
    for (int i = 0; i<4; i++) { //magic
      Dot a = dots.get(i);
      for (int j = i+1; j<4; j++) { //magic
        Dot b = dots.get(j);
        a.connections.add(b);
        b.connections.add(a);
        connections.add(new Connection(a, b));
      }
    }
    for (Dot d : dots) {
      int cons;
      if (numOfDots == 4){
        cons = int(random(1, 4));
      } else {
       cons = int(random(1,5));  
      }
      while (d.connections.size() < cons) {
        Dot neighbour = dots.get(int(random(dots.size())));
        if (neighbour != d && ! d.connections.contains(neighbour)) {
          neighbour.connections.add(d);
          d.connections.add(neighbour);
          connections.add(new Connection(d, neighbour));
        }
      }
    }

    for (Connection c : connections) {
      Spring s = new Spring(c.a.location, c.b.location, random((height)/8, (height)/6));
      forceRegistry.add(c.a, s);
      forceRegistry.add(c.b, s);
    }
  }
}