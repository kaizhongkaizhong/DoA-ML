function X = ULASig(doas,P ,K ,d , N , noise_var, isCorrelated  )

r = length(doas);

% Steering vector matrix. Columns will contain the steering vectors
% of the r signals
A = exp(-1j*2*pi*d*(0:N-1)'*sin([doas(:).']));
% Signal and noise generation
if isCorrelated
    % Generate random BPSK symbols for each of ther signals
    sig = round(rand(1,K))*2-1;
    sig = [sig;sig;sig];   
else
    sig = round(rand(r,K))*2-1;
end

noise = sqrt(noise_var/2) * (randn(N,K)+1j*randn(N,K)); %Uncorrelated noise
X = A * diag(sqrt(P)) * sig + noise; %Generate data matrix

end