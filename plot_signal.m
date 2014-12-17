% This function plot a YY curve (two y axis) of QUASAR ASL Sequence over sampling time
% Input argument:
% signal_matrix: concatenated matrix of ASL signal vectors
% signal_matrix(1): first column is QUASAR ASL signal
% signal_matrix(2): second column is Crushed ASL signal
% signal_matrix(3): third column is Noncrushed ASL signal
% t: sampling time

function figure_handle = plot_signal(signal_matrix, t)

	figure('visible','off'); % not display the figure during drawing

	% Plot QUASAR ASL signal (first column) in blue
	quasar_curve = plot(t, signal_matrix(:, 1), 'Color', 'b');
	hold on;

	% Plot Crushed ASL signal (second column) in red
	crushed_curve = plot(t, signal_matrix(:, 2), 'Color', 'r');
	hold on;

	% Plot Noncrushed ASL signal (third column) in green
	noncrushed_curve = plot(t, signal_matrix(:, 3), 'Color', 'g');

	xlabel('time(sec)'); % add x axis label
	ylabel('Signal'); % add y axis label

	legend('QUASAR ASL Curve', 'Crushed ASL Curve', 'Noncrushed ASL Curve'); % add legend
	title('QUASAR ASL Sequence'); % add title
	figure_handle = gcf; % return the figure handle
	
end
