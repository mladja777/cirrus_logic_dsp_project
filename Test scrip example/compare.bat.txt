:cd model0\Debug

:"model_0.exe" "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_0\model_0\Amp_Sweep.wav" "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_0\model_0\output_model_0.wav"

:cd ..\..

:cd model1\Debug

:"model_1.exe" "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_0\model_0\Amp_Sweep.wav" "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_1\model_1\output_model_1.wav"
:cd ..\..\..

PCMCompare "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_0\model_0\output_model_0.wav" "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_1\model_1\output_model_1.wav" > C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\logs\log0vs1.txt
PCMCompare "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_1\model_1\output_model_1.wav" "C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\model_2\model_2\output_model_2.wav" > C:\Users\Uros\Desktop\AADSP2-projekat\cirrus_logic_dsp_tremolo\logs\log1vs2.txt