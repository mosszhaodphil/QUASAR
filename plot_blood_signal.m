% This function plot time series of Blood ASL Sequence over sampling time

function figure_handle = plot_blood_signal(blood_asl_signal, t)

	figure('visible','off');
	ts = timeseries(blood_asl_signal, t);
	plot(ts, 'Color', 'm'); % plot the curve in magenta
	xlabel('Time(sec)');
	ylabel('Blood ASL Signal');
	title('Blood ASL');
	grid on;
	figure_handle = gcf;
end