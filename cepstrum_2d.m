function result = cepstrum_2d( img )
	% 	cepstrum_2d takes 2-D Cepstrum of a given signal.
	%   signal--->2D DTFT--->nonuniform grid and
	%   weighting--->abs()--->log()--->2D DTFT
	
	temp = fftshift(fft2(img, 255, 255)); % 2-D DTFT
	temp2 = non_uniform_grid(temp);  % Non-uniform grid and weigting
	temp3 = log(abs(temp2));
	result = fftshift(ifft2(ifftshift(temp3))); % Inverse DTFT
	[m,n] = size(result);
	result(ceil(m / 2),ceil(n / 2)) = 1; %eliminating DC term
end

