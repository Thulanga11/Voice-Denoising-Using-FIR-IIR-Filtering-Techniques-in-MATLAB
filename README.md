# Voice-Denoising-Using-FIR-IIR-Filtering-Techniques-in-MATLAB
Voice denoising in MATLAB using FIR/IIR digital filtering techniques with frequency analysis and SNR evaluation.

## Introduction
This project involved denoising a voice recording taken in a noisy environment. The aim was to analyze the signal characteristics and design a filter that reduces background noise while preserving the intelligibility of the voice. MATLAB was used for signal analysis, filter design, and evaluation.
Filters are essential tools in signal processing used to isolate, modify, or suppress specific frequency components in a signal. Some common types include:
• Low-Pass Filter (LPF): Allows only low-frequency components to pass.
• High-Pass Filter (HPF): Allows only high-frequency components to pass.
• Band-Pass Filter: Allows frequencies within a specific range.
• Band-Stop Filter (Notch): Attenuates a specific range of frequencies.
In this assignment we are highly focusing on FIR and IIR filters.
FIR (Finite Impulse Response) - Output depends only on current and past input values
IIR (Infinite Impulse Response) - Output depends on past input and output values

## Methodology
A 10–15 second voice sample was recorded in a moderately noisy environment (with background hum, a sound of a fan and ambient noise). The audio was saved in ‘.m4a’ format and read into MATLAB using ‘audioread()’.
Time-domain and frequency-domain plots revealed that significant noise energy was concentrated in the 150 to 200 Hz range, likely from environmental sources such as electrical hum or mechanical vibrations.
<img width="1639" height="677" alt="image" src="https://github.com/user-attachments/assets/e0de81f4-0914-487a-a7e6-53ac263b4eee" />

Filter Design
A band-stop FIR filter was chosen to attenuate the 150 to 200 Hz range. This narrow stopband was selected to minimize the loss of speech components while targeting the noise band effectively.
The filtered signal was normalized to a maximum amplitude before saving to avoid data clipping during output.
This filter and the filter parameters were chosen after going through many filter types and different values and taking an optimum value in a way that it filters the noise accurately while saving the voice clearly and also considering the output value of the SNR value as well.
After observing the above results I came into the decision of using the FIR filter as it gives the best outcome with the SNR value.

## Results
The filtered audio was subjectively clearer, with reduced low-frequency hum. The filtered spectrum showed effective attenuation between 150–200 Hz with minimal distortion elsewhere.
Comparison between the time domain plots of the audios:
<img width="764" height="602" alt="image" src="https://github.com/user-attachments/assets/d0040208-82c2-4a50-8c21-0a7555a65f01" />

<img width="674" height="534" alt="image" src="https://github.com/user-attachments/assets/3c827574-e30e-41a6-a1d7-6800b9895161" />

SNR evaluation:
<img width="520" height="99" alt="image" src="https://github.com/user-attachments/assets/b50d1b35-6f60-4a0e-963a-4373978fdd59" />

The improvement of the SNR – Sound to Noise Ratio confirms the success of the filtering process as the value increases passing the original SNR value.

## Conclusion 
The applied FIR band-stop filter significantly improved the quality of the audio by reducing noise in the 150–200 Hz band while maintaining the integrity of the speech. Further improvements could include adaptive filtering or spectral subtraction for broader noise types.

