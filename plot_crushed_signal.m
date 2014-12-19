% This function plot time series of Crushed ASL Sequence over sampling time

function figure_handle = plot_crushed_signal(crushed_asl_signal, t)

	figure('visible','off');
	ts = timeseries(crushed_asl_signal, t);
	plot(ts, 'Color', 'r'); %plot the curve in red
	xlabel('Time(sec)');
	ylabel('Crushed ASL Signal');
	title('Crushed ASL');
	grid on;
	figure_handle = gcf;
end