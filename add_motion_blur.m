% This function adds motion blur to signal
% We assume motion in x-y plane
% Parameters:
% displacement (in pixels), number of pixels that the subject is moved
% rotation: counter-clock wise rotation in degrees


function blurred_signal = add_motion_blur(input_signal, displacement, rotation)
	
	% Construct a point spread function
	psf = fspecial('motion', displacement, rotation);

	% Check dimension
	% Vector
	if(ndims(input_signal) == 1)

		blurred_signal = imfilter(input_signal, psf, 'conv', 'circular');
	end

	% 4D matrix
	if(ndims(input_signal) == 4)
		[x, y, z, t] = size(input_signal);

		blurred_signal = zeros(x, y, z, t);

		for i = 1 : t

			for j = 1 : z

				x_y_image = input_signal(: , : , j, i);

				x_y_blurred = imfilter(x_y_image, psf, 'conv', 'circular');

				blurred_signal(:, :, j, i) = x_y_blurred;
		

		end

	end

end

