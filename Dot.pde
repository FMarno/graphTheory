int size = 50;
class Dot {
  PVector location;
  PVector velocity = new PVector(0, 0);
  int fill;
  boolean selected;
  ArrayList<Dot> connections = new ArrayList<Dot>();
  float invMass;
  private PVector forceAccumulator = new PVector(0, 0);

  public Dot(PVector location, int fill, float invMass) {
    this.location = location; 
    this.fill = fill;
    this.invMass = invMass;
  }

  void addForce(PVector force) {
    forceAccumulator.add(force);
  }

  void update() {
    if (invMass <= 0f) return;

    location.add(velocity);
    if (location.y < (size/2) + size || location.y > height- (size/2) - size) {
      location.y -= velocity.y;
    }
    if (location.x < (size/2) + size || location.x > width- (size/2) - size) {
      location.x -= velocity.x;
    }

    PVector resultantAcc = forceAccumulator.get();
    resultantAcc.mult(invMass);
    velocity.add(resultantAcc);
    velocity.mult(0.9);
    forceAccumulator.set(0, 0);
  }

  float getMass() {
    return 1/invMass;
  }

  void display() {
    if (selected) {
      fill(GOLD);
    } else {
      fill(fill);
    }
    strokeWeight(1);
    stroke(0);
    ellipse(location.x, location.y, size, size);
  }

  boolean contains(PVector l) {
    float dist = location.dist(l);
    return dist <= size/2;
  }
}