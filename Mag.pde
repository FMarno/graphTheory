class Mag extends ForceGenerator {
  PVector location;
  float max = size*2;

  Mag(PVector location) {
    this.location = location;
  }

  void updateForce(Dot dot) {
    float distance = dot.location.dist(location);
    if (distance > max) return;

    PVector diff = PVector.sub(dot.location, location);

    diff.setMag(max - diff.mag());

    dot.addForce(diff);
  }
}