/*
 * This file is part of JGAP.
 *
 * JGAP offers a dual license model containing the LGPL as well as the MPL.
 *
 * For licensing information please see the file license.txt included with JGAP
 * or have a look at the top of class org.jgap.Chromosome which representatively
 * includes the JGAP license policy applicable for any file delivered with JGAP.
 */
package org.jgap.gp.function;

import org.jgap.*;
import org.jgap.gp.*;
import org.jgap.gp.impl.*;
import org.jgap.util.*;

/**
 * Returns the largest (closest to positive infinity) double/float value that
 * is not greater than the argument and is equal to a mathematical integer.
 *
 * @author Klaus Meffert
 * @since 3.3.4
 */
public class Floor
    extends MathCommand implements ICloneable {
  /** String containing the CVS revision. Read out via reflection!*/
  private final static String CVS_REVISION = "$Revision: 1.3 $";

  public Floor(final GPConfiguration a_conf, Class a_returnType)
      throws InvalidConfigurationException {
    super(a_conf, 1, a_returnType);
  }

  public String toString() {
    return "floor &1";
  }

  /**
   * @return textual name of this command
   *
   * @author Klaus Meffert
   * @since 3.3.4
   */
  public String getName() {
    return "Floor";
  }

  public float execute_float(ProgramChromosome c, int n, Object[] args) {
    float f = c.execute_float(n, 0, args);
    return (float) Math.floor(f);
  }

  public double execute_double(ProgramChromosome c, int n, Object[] args) {
    double d = c.execute_double(n, 0, args);
    return Math.floor(d);
  }

  public Object execute_object(ProgramChromosome c, int n, Object[] args) {
    return ( (Compatible) c.execute_object(n, 0, args)).execute_floor();
  }

  protected interface Compatible {
    public Object execute_floor();
  }
  /**
   * Clones the object. Simple and straight forward implementation here.
   *
   * @return cloned instance of this object
   *
   * @author Klaus Meffert
   * @since 3.4
   */
  public Object clone() {
    try {
      Floor result = new Floor(getGPConfiguration(), getReturnType());
      return result;
    } catch (Exception ex) {
      throw new CloneException(ex);
    }
  }
}
