% This function plot time series of QUASAR ASL Sequence over sampling time

function figure_handle = plot_quasar_signal(quasar_asl_signal, t)

	figure('visible','off');
	ts = timeseries(quasar_asl_signal, t);
	plot(ts, 'Color', 'b'); % plot the curve in blue
	xlabel('Time(sec)');
	ylabel('QUASAR ASL Signal');
	title('QUASAR ASL')
	grid on;
	figure_handle = gcf;
end