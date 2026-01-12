% Load the audio
[noisy_audio, fs] = audioread('voice_noisy.wav.m4a');
t = (0:length(noisy_audio)-1)/fs;

% Plot Time-Domain Signal
figure;
plot(t, noisy_audio);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Plot of Noisy Audio');

% Frequency Analysis
N = length(noisy_audio);
Y = fft(noisy_audio);
f = linspace(0, fs, N);

% Plot Frequency Spectrum
figure;
plot(f(1:N/2), abs(Y(1:N/2))); % Single-sided spectrum
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Noisy Audio');

% Design Band stop filter
bp = designfilt('bandstopfir', ...
                'FilterOrder', 30, ...
                'CutoffFrequency1', 150, ...
                'CutoffFrequency2', 200, ...
                'SampleRate', fs);

% Apply the filter correctly
filtered_audio = filtfilt(bp, noisy_audio);

% Normalize the filtered audio to prevent clipping
filtered_audio = filtered_audio / max(abs(filtered_audio));

% Save the filtered audio
audiowrite('voice_filtered.wav', filtered_audio, fs);

% Plot filtered time-domain waveform
t = (0:length(noisy_audio)-1)/fs;
figure;
subplot(2,1,1);
plot(t, noisy_audio);
title('Original Noisy Audio');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filtered_audio);
title('Filtered Audio');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot frequency spectrum
N = length(noisy_audio);
f = linspace(0, fs, N);
Y_before = abs(fft(noisy_audio));
Y_after = abs(fft(filtered_audio));

figure;
plot(f(1:N/2), Y_before(1:N/2), 'r');
hold on;
plot(f(1:N/2), Y_after(1:N/2), 'b');
legend('Before Filtering', 'After Filtering');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum Comparison');

%Calculating the SNR value of this signal
signal_power = rms(noisy_audio).^2;
clean_estimate = medfilt1(noisy_audio, 101);   % 101-point median filter
noise_estimate = noisy_audio - clean_estimate;
noise_power = var(noise_estimate);
snr_value = 10 * log10(signal_power / noise_power);
fprintf('The SNR before filtering is %.4f\n', snr_value);

%Calculating SNR after filtering
signal_power1 = rms(filtered_audio).^2;
clean_estimate1 = medfilt1(filtered_audio, 101);   % 101-point median filter
noise_estimate1 = filtered_audio - clean_estimate1;
noise_power1 = var(noise_estimate1);
snr_value1 = 10 * log10(signal_power1 / noise_power1);
fprintf('The SNR after filtering is %.4f\n', snr_value1);
