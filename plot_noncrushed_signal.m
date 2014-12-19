% This function plot time series of Noncrushed ASL Sequence over sampling time

function figure_handle = plot_noncrushed_signal(noncrushed_asl_signal, t)

	figure('visible','off');
	ts = timeseries(noncrushed_asl_signal, t);
	plot(ts, 'Color', 'g'); % plot the curve in green
	xlabel('Time(sec)');
	ylabel('Noncrushed ASL Signal');
	title('Noncrushed ASL');
	grid on;
	figure_handle = gcf;
end