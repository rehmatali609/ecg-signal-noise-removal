% ============================================================
% ECG SIGNAL NOISE REMOVAL AND HEARTBEAT FEATURE EXTRACTION
% Signal and Systems Project
% Rehmat Ali, Reg. No: 2023609 
% Sajjad Akbar Khan, Reg. No: 2023634
% M. Hamza Iftikhar, Reg. No: 2023424 
% ============================================================

clc;
clear;
close all;

%% 1. ECG SIGNAL GENERATION (Synthetic ECG)
% ------------------------------------------------------------
fs = 360;    % Sampling frequency (Hz)
t = 0:1/fs:10;    % 10 seconds duration

% Basic ECG waveform using sine components
ecg_clean_ref = ...
    1.2*sin(2*pi*1.2*t) + ...     % Heartbeat component
    0.25*sin(2*pi*2.4*t);     % Harmonics

% 2. ADD NOISE (Realistic ECG Noises)
% ------------------------------------------------------------
baseline_wander = 0.5*sin(2*pi*0.2*t);     % Baseline drift
powerline_noise = 0.3*sin(2*pi*50*t);    % 50 Hz interference
muscle_noise = 0.2*randn(size(t));    % EMG noise

ecg_raw = ecg_clean_ref + baseline_wander + ...
          powerline_noise + muscle_noise;

% 3. RAW ECG VISUALIZATION
% ------------------------------------------------------------
figure;
plot(t, ecg_raw);
title('Raw ECG Signal (With Noise)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 4. FREQUENCY DOMAIN ANALYSIS (FFT)
% ------------------------------------------------------------
N = length(ecg_raw);
ECG_FFT = abs(fft(ecg_raw));
f = (0:N-1)*(fs/N);

figure;
plot(f, ECG_FFT);
xlim([0 100]);
title('Frequency Spectrum of Raw ECG');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% 5. NOTCH FILTER (50 Hz POWERLINE REMOVAL)
% ------------------------------------------------------------
wo = 50/(fs/2);
bw = wo/35;
[b_notch, a_notch] = iirnotch(wo, bw);

% simple forward-backward zero-phase filtering
ecg_notch = fbfilter(b_notch, a_notch, ecg_raw);

% 6. HIGH-PASS FILTER (BASELINE WANDER REMOVAL)
% ------------------------------------------------------------
fc_hp = 0.5;
[b_hp, a_hp] = butter(2, fc_hp/(fs/2), 'high');

ecg_filtered = fbfilter(b_hp, a_hp, ecg_notch);

figure;
plot(t, ecg_filtered);
title('Filtered ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 7. BAND-PASS FILTER (QRS ENHANCEMENT)
% ------------------------------------------------------------
[b_bp, a_bp] = butter(3, [5 15]/(fs/2), 'bandpass');
ecg_qrs = fbfilter(b_bp, a_bp, ecg_filtered);

figure;
plot(t, ecg_qrs);
title('Band-Pass Filtered ECG (QRS Enhanced)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 8. QRS DETECTION (Peak Detection)
% ------------------------------------------------------------
[peaks, locs] = findpeaks(ecg_qrs, ...
    'MinPeakHeight', 0.5*max(ecg_qrs), ...
    'MinPeakDistance', round(0.6*fs));

figure;
plot(t, ecg_filtered);
hold on;
plot(t(locs), ecg_filtered(locs), 'ro');
title('QRS Complex Detection');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Filtered ECG', 'R-Peaks');
grid on;

% 9. HEART RATE & RR INTERVALS
% ------------------------------------------------------------
RR_intervals = diff(locs)/fs;     % seconds
heart_rate = 60 ./ RR_intervals;  % BPM

fprintf('Average Heart Rate: %.2f BPM\n', mean(heart_rate));

% 10. SNR EVALUATION
% ------------------------------------------------------------
snr_before = snr(ecg_raw);
snr_after = snr(ecg_filtered);

fprintf('SNR Before Filtering: %.2f dB\n', snr_before);
fprintf('SNR After Filtering: %.2f dB\n', snr_after);

% 11. RAW vs FILTERED COMPARISON
% ------------------------------------------------------------
figure;
subplot(2,1,1);
plot(t, ecg_raw);
title('Raw ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, ecg_filtered);
title('Filtered ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% ================= Helper function (local) ==================
function y = fbfilter(b, a, x)
% Simple forward-backward zero-phase filtering without filtfilt
% - Mirrors edges to reduce transients
% - Applies filter forward, then backward
% - Trims padding to original length

    x = x(:);                         % ensure column
    L = length(x);
    pad = min(3*max(length(a), length(b)), L-1);  % simple pad length
    % Mirror padding at both ends
    xpad = [2*x(1) - x( (pad+1):-1:2 ); x; 
        2*x(end) - x( (end-1):-1:(end-pad) )];

    % Forward filter
    ypad = filter(b, a, xpad);
    % Backward filter
    ypad = flipud(filter(b, a, flipud(ypad)));

    % Remove padding
    y = ypad(pad+1 : pad+L);

    y = y(:);                         % preserve shape
end

% ============================================================
% END OF PROGRAM
% ============================================================