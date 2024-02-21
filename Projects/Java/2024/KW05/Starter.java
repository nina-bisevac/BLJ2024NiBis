package ch.noseryoung;

/**
 * The starter class. Clean, simple and short, as all starter classes should be.
 * 
 * @author surber
 *
 */
public class Starter {
  public static void main(String[] args) {
    Simulation sim = new Simulation(100, false, Preset.DEMO_10X10);
    SimulationPanel simPanel = new SimulationPanel(sim, 40, 0.9);
    simPanel.getSimulation().start();
  }
}
