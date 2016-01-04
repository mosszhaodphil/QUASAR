% This function adds Gaussian blur to signal
% We assume motion in x-y plane
% Parameters:
% sigma: SD of the smoothing Gaussian kernel


function blurred_signal = add_gaussian_blur(input_signal, sigma)

	% Check dimension
	% Vector
	if(ndims(input_signal) == 1)

		blurred_signal = imgaussfilt(input_signal, sigma);
	end

	% 4D matrix
	if(ndims(input_signal) == 4)
		[x, y, z, t] = size(input_signal);

		blurred_signal = zeros(x, y, z, t);

		for i = 1 : t

			for j = 1 : z

				x_y_image = input_signal(: , : , j, i);

				x_y_blurred = imgaussfilt(x_y_image, sigma);

				blurred_signal(:, :, j, i) = x_y_blurred;
		

		end

	end

end

