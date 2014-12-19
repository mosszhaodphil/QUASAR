% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the delivery function c(t) of Buxton's model
% c(t) = exp(-t / t1_a)
function delivery_Buxton = calculate_delivery_Buxton(t)

	load('param_basis.mat');
	load('param_user.mat');

	delivery_Buxton = zeros(length(t), 1);

	% calculate deliver function c(t), eq [5] (MACQ)
	for j = 1 : length(t)
		delivery_Buxton(j) = exp((-t(j)) / t1_a);
	end

end

