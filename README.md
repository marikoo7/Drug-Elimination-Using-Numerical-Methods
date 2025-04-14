# Pharmacokinetic and Numerical Analysis

## Overview

This repository contains MATLAB implementations of various numerical methods for solving ordinary differential equations (ODEs), with a focus on pharmacokinetic (PK) modeling. Pharmacokinetics relates to predicting how drug concentrations change in the body over time following administration, focusing on absorption, distribution, metabolism, and elimination (ADME) processes.

## What is Pharmacokinetic (PK) Modeling?

Pharmacokinetic modeling predicts concentration-time profiles of drugs in the body after administration. It studies the ADME processes:

- **Absorption**: How the drug enters the bloodstream
- **Distribution**: How the drug moves throughout the body
- **Metabolism**: How the body transforms the drug
- **Elimination**: How the drug leaves the body

These models are essential for understanding drug behavior and determining appropriate dosing regimens to achieve required pharmacological responses.

## Numerical Methods Implemented

This repository includes several numerical methods for solving ODEs related to pharmacokinetic modeling:

1. **Euler Methods**:
   - Forward Euler (`EulerForward.m`) - First-order explicit method
   - Backward Euler (`Eulerbackward.m`) - First-order implicit method

2. **Higher-Order Methods**:
   - Heun's Method (`HeunsMethod.m`) - Second-order predictor-corrector method
   - Midpoint Method (`MidpointMethod.m`) - Second-order Runge-Kutta method
   - Classical Runge-Kutta Method (`rk4_classical.m`) - Fourth-order method

3. **Multi-Step Methods**:
   - Adams-Bashforth (`adams_bashforth.m`) - Two-step explicit method
   - Adams-Moulton (`lmm_adams_moulton.m`) - Two-step implicit method

## Example Application: Drug Elimination

The repository demonstrates these methods with a first-order drug elimination model, representing how a drug concentration decreases over time. For a drug following first-order kinetics:

```
dC/dt = -k * C
```

Where:
- C: Drug concentration
- k: Elimination rate constant
- t: Time

### Case Study: Ibuprofen

Ibuprofen demonstrates first-order elimination kinetics with the following characteristics:

- **Uses**: Pain relief, fever reduction, anti-inflammatory effects
- **Administration**: Oral or intravenous
- **Metabolism**: Rapid, with >90% eliminated via urine
- **Elimination**: Complete elimination within 24 hours
- **Elimination Rate Constant**: 0.564 hour⁻¹
- **Half-life in Effect Compartment**: 1.1 hours

## Project Structure

```
├── EulerForward.m          # Forward Euler method implementation
├── Eulerbackward.m         # Backward Euler method implementation
├── HeunsMethod.m           # Heun's method implementation
├── MidpointMethod.m        # Midpoint method implementation
├── adams_bashforth.m       # Adams-Bashforth two-step method
├── lmm_adams_moulton.m     # Adams-Moulton two-step method
├── rk4_classical.m         # Classical fourth-order Runge-Kutta method
├── main.m                  # Main script to run simulations
├── plot-connection.m       # Plotting utility for comparing methods
├── GUI.m                   # Graphical user interface for the project
└── README.md               # This file
```

## Getting Started

### Prerequisites

- MATLAB (developed and tested with version R2020b or later)
- No additional toolboxes required

### Installation

1. Clone this repository:
   ```
   git clone https://github.com/marikoo7/Drug-Elimination-Using-Numerical-Methods.git
   ```
2. Open MATLAB and navigate to the project directory

### Usage

#### Command Line Interface

1. Open and run `main.m` to execute the default simulation:
   ```matlab
   main
   ```

2. To use a specific numerical method for your own ODE:
   ```matlab
   % Define your ODE function
   f = @(t, y) -k * y;  % Example: first-order elimination with rate constant k
   
   % Set initial conditions and parameters
   t0 = 0;              % Initial time
   tfinal = 24;         % Final time
   y0 = 100;            % Initial concentration
   h = 0.1;             % Step size
   
   % Solve using your chosen method
   [t, y] = EulerForward(f, t0, tfinal, y0, h);
   
   % Plot results
   plot(t, y);
   ```

#### Graphical User Interface

The project includes a GUI for easy interaction with the drug elimination model. To use the GUI:

1. Open MATLAB and navigate to the project directory
2. Run the GUI script:
   ```matlab
   GUI
   ```

3. The GUI provides the following features:
   - Input fields for initial concentration (C0)
   - Input for elimination rate constant (k)
   - Input for step size (h)
   - Input for final time (t_final)
   - Method selection dropdown (Euler, Heun, RK4)
   - "Solve & Plot" button to run the simulation
   - Visual graph of the drug concentration over time

## References

- Pharmacokinetic modeling concepts are based on standard pharmaceutical science literature
- Numerical methods follow classical implementations from numerical analysis texts
