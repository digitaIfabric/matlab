% to demonstrate the relationship between DTFT, DFS and DFT

% first, consider a length-4 signal x(n)=[0, 1, 2, 3] for 0<=n<=3

x = [0:3];

% its DTFT
w = [0:0.01*pi:2*pi];
% find its DTFT
Xw = exp(-j*w) + 2*exp(-j*2*w) + 3* exp(-j*3*w);

% DFS
% sample Xw 4 points per 2pi
N = 4;
w1 = [0:N-1]/N * 2 *pi;
Xw1 = exp(-j*w1) + 2*exp(-j*2*w1) + 3* exp(-j*3*w1);
% IDFS
x1 = ifft(Xw1);
% periodic extension of x1 in the time domain
n = 12;
x1 = repmat(x1, [1, n/N]);

% sample Xw 8 points per 2pi
N = 8;
w2 = [0:N-1]/N * 2 *pi;
Xw2 = exp(-j*w2) + 2*exp(-j*2*w2) + 3* exp(-j*3*w2);
% IDFS
x2 = ifft(Xw2);
% periodic extension of x1 in the time domain
x2 = repmat(x2, [1, ceil(n/N)]);
x2 = x2(1:n);

% sample Xw 2 points per 2pi
N = 2;
w3 = [0:N-1]/N * 2 *pi;
Xw3 = exp(-j*w3) + 2*exp(-j*2*w3) + 3* exp(-j*3*w3);
% IDFS
x3 = ifft(Xw3);
% periodic extension of x1 in the time domain
x3 = repmat(x3, [1, n/N]);

% plot the frequency spectrum
figure(1);
plot(w/pi, abs(Xw), 'b-', w1/pi, abs(Xw1), 'ro', w2/pi, abs(Xw2), 'b+', w3/pi, abs(Xw3), 'ms', ...
    'LineWidth',2, 'MarkerSize', 10);
xlabel('Frequency \omega (x \pi)'); ylabel('|X(\omega)|');
legend('DTFT', 'sampled DTFT, N=4', 'sampled DTFT, N=2', 'sampled DTFT, N=8',0);

% plot the corresponding time-domain signals
figure(2);
subplot(2,2,1);
stem([0:n-1], [x, zeros(1,n-4)]); xlabel('n'); ylabel('x(n)');
subplot(2,2,2);
stem([0:n-1], x1); xlabel('n'); ylabel('x_1(n), N=4');
subplot(2,2,3);
stem([0:n-1], x2); xlabel('n'); ylabel('x_2(n), N=8');
subplot(2,2,4);
stem([0:n-1], x3); xlabel('n'); ylabel('x_3(n), N=2');

clear all; 

%% Now, consider the 5-point moving average filter
x = ones(1,5);

% find its DTFT
w = 0:0.01*pi:2*pi;
Xw = 1 + exp(-j*w) + exp(-j*2*w) + exp(-j*3*w) + exp(-j*4*w);

% its 5-point DFT
N = 5;
XFFT1 = fft(x,N);
w1 = [ 0 : N-1 ]/N * 2 * pi;

% its 10-point DFT
N = 10;
XFFT2 = fft(x,N);
w2 = [ 0 : N-1 ]/N * 2 * pi;

% plot DTFT and DFT
figure(3)
plot(w/pi, abs(Xw), 'b-', w1/pi, abs(XFFT1), 'ro', w2/pi, abs(XFFT2), ...
    'm+', 'LineWidth', 2, 'MarkerSize', 10);
legend('DTFT', '5-point DFT', '10-point DFT',0);
xlabel('Frequency \omega (x \pi)'); ylabel('|X(\omega)|');
