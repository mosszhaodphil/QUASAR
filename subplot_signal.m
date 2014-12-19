% This function plot a YY curve (two y axis) of QUASAR ASL Sequence over sampling time
% Input argument:
% signal_matrix: concatenated matrix of ASL signal vectors
% signal_matrix(1): first column is QUASAR ASL signal
% signal_matrix(2): second column is Crushed ASL signal
% signal_matrix(3): third column is Noncrushed ASL signal
% t: sampling time

function figure_handle = subplot_signal(signal_matrix, t)

	figure('visible','off'); % not display the figure during drawing
	y_axis_range = [0 0.01]; % Y axis range of plots

	subplot(2, 2, 1);
	quasar_curve = plot(t, signal_matrix(:, 1), 'Color', 'b');
	ylim(y_axis_range);
	grid on;
	title('QUASAR (Tissue) curve');
	hold on;

	subplot(2, 2, 2);
	noncrushed_curve = plot(t, signal_matrix(:, 2), 'Color', 'm');
	ylim(y_axis_range);
	grid on;
	title('Blood curve');
	hold on;

	subplot(2, 2, 3);
	crushed_curve = plot(t, signal_matrix(:, 3), 'Color', 'r');
	ylim(y_axis_range);
	grid on;
	title('Crushed curve');
	hold on;

	subplot(2, 2, 4);
	noncrushed_curve = plot(t, signal_matrix(:, 4), 'Color', 'g');
	ylim(y_axis_range);
	grid on;
	title('Noncrushed curve');
	hold on;

	figure_handle = gcf; % return the figure handle
	
end
