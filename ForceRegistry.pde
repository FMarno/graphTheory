/**
 * Holds all the force generators and the particles they apply to
 */
class ForceRegistry {

  /**
   * Keeps track of one force generator and the particle
   *  it applies to.
   */
  class ForceRegistration {
    public final Dot particle ;
    public final ForceGenerator forceGenerator ;
    ForceRegistration(Dot p, ForceGenerator fg) {
      particle = p ;
      forceGenerator = fg ;
    }
  }

  // Holds the list of registrations
  ArrayList<ForceRegistration> registrations = new ArrayList<ForceRegistration>() ;

  /**
   * Register the given force to apply to the given particle
   */
  void add(Dot p, ForceGenerator fg) {
    registrations.add(new ForceRegistration(p, fg)) ;
  }

  /**
   * Remove the given registered pair from the registry. If the
   * pair is not registered, this method will have no effect.
   */
  // This is going to be very inefficient with an AL. Suspect a
  // Hashmap with generator as key and value as list of particles
  // would be better.

  /**
   * Clear all registrations from the registry
   */
  void clear() {
    registrations.clear() ;
  }

  /**
   * Calls all force generators to update the forces of their
   *  corresponding particles.
   */
  void updateForces() {
    for (ForceRegistration fr : registrations) {
      fr.forceGenerator.updateForce(fr.particle) ;
    }
  }
}