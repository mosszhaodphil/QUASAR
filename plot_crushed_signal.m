% This function plot time series of Crushed ASL Sequence over sampling time

function figure_handle = plot_crushed_signal(crushed_asl_signal, t)

	figure('visible','off');
	ts = timeseries(crushed_asl_signal, t);
	plot(ts);
	xlabel('t(s)');
	ylabel('Crushed ASL Signal');
	title('Crushed ASL')
	figure_handle = gcf;
end