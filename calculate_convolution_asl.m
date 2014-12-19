% This function calculate the numerical convolution of two vectors
% The dimension (m) of the vectors must be the same
% The function returns the first m elements of the convolution (calculated by MATLAB library functionconv) result

function result_vector = calculate_convolution_asl(vector_1, vector_2)
	full_result = conv(vector_1, vector_2);

	result_vector = full_result(1 : length(vector_1));

end

