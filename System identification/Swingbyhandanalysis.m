clear all
swingdata = load(fullfile('..','Simulation_results','Hand-swing_1m_8.mat'),'Simulation_results');
swingdata = swingdata.Simulation_results;  


plot_timeseries(swingdata);

%Read off peak times: First peak: 4.1 sec. Twelft Peak 28.23 sec
T = (28.2 - 4.1)/12;
f = 1/T;
g = 9.81;
L = g/f^2;


