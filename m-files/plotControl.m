function plotControl(timeseries,titleinput)
% the Void function Plot_timeseries plots the simulation results in 1 figure. 
% Inputs: Timeseries structure generated by simulink 'To Workspace' Block.
%clf
figure;
labels = {'Control input','Position [m]','Reference [m]','Angle filtered[rad]','Angle measured [rad]'};
count = 1;
% Results and comparison
% Output results in following order:
% 1.Control input
% 2. Position in meters
% 3. Reference in meters
% 4. Angle filtered[rad]
% 5. Angle measured [rad]

subplot(311)
plot(timeseries.Time,timeseries.Data(:,2)); hold on
plot(timeseries.Time,timeseries.Data(:,3))
title(titleinput);
ylabel(labels{2})
legend(labels{2},labels{3})

subplot(312)
plot(timeseries.Time,timeseries.Data(:,4))
ylabel(labels{4})
legend(labels{4})

subplot(313)
plot(timeseries.Time,timeseries.Data(:,1))
ylabel(labels{1})
legend(labels{1})
xlabel('Time[s]');
end 