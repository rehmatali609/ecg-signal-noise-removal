# ECG Signal Noise Removal and Heartbeat Feature Extraction

![MATLAB](https://img.shields.io/badge/MATLAB-R2019b+-orange)
![Biomedical](https://img.shields.io/badge/Domain-Biomedical%20Signal%20Processing-blue)
![ECG](https://img.shields.io/badge/Application-ECG%20Analysis-green)
![License](https://img.shields.io/badge/License-Academic-lightgrey)

A MATLAB-based biomedical signal processing project focused on ECG denoising, heartbeat feature extraction, QRS complex detection, and heart rate estimation using digital signal processing techniques.

This project was developed as part of the **Signal and Systems Project** coursework.

---

# Overview

Electrocardiogram (ECG) signals are highly susceptible to various forms of noise including:

- Baseline wander
- Powerline interference
- Muscle (EMG) artifacts

This project demonstrates how digital signal processing techniques can be applied to:

- Remove unwanted noise
- Enhance ECG quality
- Detect QRS complexes
- Extract heartbeat-related features
- Estimate heart rate accurately

The framework includes both time-domain and frequency-domain analysis for comprehensive ECG signal evaluation.

---

# Team Members

| Name | Registration Number |
|---|---|
| Rehmat Ali | 2023609 |
| Sajjad Akbar Khan | 2023634 |
| M. Hamza Iftikhar | 2023424 |

---

# Features

- Synthetic ECG signal generation
- Baseline wander simulation
- Powerline interference modeling
- Muscle noise simulation
- FFT-based frequency spectrum analysis
- 50 Hz notch filtering
- High-pass filtering for drift removal
- Band-pass filtering for QRS enhancement
- QRS complex detection using peak analysis
- Heart rate estimation
- RR interval analysis
- SNR performance evaluation
- Raw vs filtered ECG comparison

---

# Project Structure

```text
ecg-signal-noise-removal/
│
├── README.md
├── LICENSE
├── images/
│   ├── raw_ecg.png
│   ├── frequency_spectrum.png
│   ├── filtered_ecg.png
│   ├── qrs_detection.png
│   └── comparison.png
│
├── src/
│   └── ecg_signal_processing.m
│
└── report/
    └── Signal_and_Systems_Report.pdf
```

---

# Signal Processing Workflow

The ECG processing pipeline consists of:

1. Synthetic ECG signal generation
2. Addition of realistic biomedical noise
3. Frequency-domain analysis using FFT
4. Notch filtering for powerline removal
5. High-pass filtering for baseline correction
6. Band-pass filtering for QRS enhancement
7. Peak detection for heartbeat extraction
8. Heart rate estimation
9. SNR evaluation

---

# MATLAB Techniques Used

| Technique | Purpose |
|---|---|
| FFT | Frequency spectrum analysis |
| IIR Notch Filter | Remove 50 Hz interference |
| Butterworth High-Pass Filter | Baseline drift removal |
| Butterworth Band-Pass Filter | QRS enhancement |
| Zero-Phase Filtering | Preserve ECG morphology |
| Peak Detection | QRS complex identification |
| SNR Analysis | Signal quality evaluation |

---

# Noise Sources Simulated

| Noise Type | Description |
|---|---|
| Baseline Wander | Low-frequency respiration/motion artifacts |
| Powerline Noise | 50 Hz electrical interference |
| Muscle Noise (EMG) | Random muscular activity |

---

# How to Run

## Requirements

- MATLAB R2019b or later recommended

## Steps

1. Clone the repository:

```bash
git clone https://github.com/your-username/ecg-signal-noise-removal.git
```

2. Open MATLAB

3. Set current directory to:

```text
ecg-signal-noise-removal/src/
```

4. Run:

```matlab
ecg_signal_processing
```

5. The program will automatically generate:
- ECG plots
- Frequency spectrum
- Filtered signals
- QRS detection visualization
- Heart rate results
- SNR measurements

---

# Generated Outputs

| Output Figure | Description |
|---|---|
| `raw_ecg.png` | Noisy ECG waveform |
| `frequency_spectrum.png` | FFT spectrum analysis |
| `filtered_ecg.png` | ECG after filtering |
| `qrs_detection.png` | Detected R-peaks |
| `comparison.png` | Raw vs filtered ECG |

---

# Sample Results

## Raw ECG Signal

![Raw ECG](images/raw_ecg.png)

## Frequency Spectrum

![Frequency Spectrum](images/frequency_spectrum.png)

## Filtered ECG Signal

![Filtered ECG](images/filtered_ecg.png)

## QRS Detection

![QRS Detection](images/qrs_detection.png)

---

# Heartbeat Feature Extraction

The project extracts:

- R-peak locations
- RR intervals
- Average heart rate
- Signal quality metrics

Example output:

```text
Average Heart Rate: 72.5 BPM
SNR Before Filtering: 4.32 dB
SNR After Filtering: 15.87 dB
```

---

# Key Learning Outcomes

This project demonstrates practical implementation of:

- Biomedical signal processing
- ECG denoising techniques
- Digital filter design
- FFT spectral analysis
- Peak detection algorithms
- Feature extraction methods
- Signal quality evaluation
- MATLAB-based DSP implementation

---

# Applications

This project has applications in:

- Wearable healthcare devices
- Remote patient monitoring
- ECG preprocessing systems
- Biomedical instrumentation
- Heartbeat monitoring systems
- Digital healthcare research

---

# Future Improvements

Potential future extensions include:

- Real ECG dataset integration
- Wavelet-based denoising
- Adaptive filtering techniques
- Arrhythmia classification
- Machine learning-based diagnosis
- Real-time ECG monitoring
- Mobile healthcare integration

---

# Author Information

## Developed By

**Rehmat Ali**  
Computer Engineering Student  
GIK Institute of Engineering Sciences and Technology

### Contributors

- Sajjad Akbar Khan
- M. Hamza Iftikhar

---

# License

This project is intended for academic and educational purposes only.
