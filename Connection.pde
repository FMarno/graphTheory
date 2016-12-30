class Connection {
  Dot a, b;
  
  Connection(Dot a, Dot b) {
    this.a = a;
    this.b = b;
  }

  void display() {
    stroke(0);
    if (a.selected || b.selected) stroke(GOLD);
    strokeWeight(2);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}