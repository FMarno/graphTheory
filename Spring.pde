public class Spring extends ForceGenerator {
  PVector start;
  PVector end;
  float len;

  Spring(PVector start, PVector end, float len) {
    this.start = start;
    this.end = end;
    this.len = len;
  }

  void updateForce(Dot dot) {
    PVector midPoint = PVector.sub(end, start);
    midPoint.div(2);
    midPoint.add(start);

    PVector resultingForce = PVector.sub(midPoint, dot.location);

    float difference = resultingForce.mag() - len;

    if (difference <2 && difference > -2) return; //magic

    resultingForce.div(100); //magic
    resultingForce.mult(difference);

    dot.addForce(resultingForce);
  }
}