@echo off

SET CONFIGURATION=Debug
SET PROJECT_NAME=WavTemplate
SET PROJECT_ULD="models/%PROJECT_NAME%/output/standalone/%PROJECT_NAME%_model3.uld"

: TO DO: Add additional command line args for your program
SET ADDITIONAL_ARGS_2_0_0=" 1 -4 -4 0 "
SET ADDITIONAL_ARGS_0_2_0=" 1 -4 -4 1 "
SET ADDITIONAL_ARGS_3_2_0=" 1 -4 -4 2 "

SET SIMULATOR=C:\CirrusDSP\bin\cmdline_simulator.exe -silent
SET COMPARE="PCMCompare.exe"


: Delete log files first.
del /Q OutCmp\*
del /Q OutStreams\*
: For each Test stream
cd TestStreams
for %%g in ("*.*") do ( echo Running tests for stream: %%~ng%%~xg
	echo     model 0 mode 2_0_0
    "..\%CONFIGURATION%\model0.exe" "%%g" "..\OutStreams//%%~ng_model0_2_0_0.wav %ADDITIONAL_ARGS_2_0_0%"
	echo     model 1 mode 2_0_0
	"..\%CONFIGURATION%\model1.exe" "%%g" "..\OutStreams//%%~ng_model1_2_0_0.wav %ADDITIONAL_ARGS_2_0_0%"
	echo     model 2 mode 2_0_0
	"..\%CONFIGURATION%\model2.exe" "%%g" "..\OutStreams//%%~ng_model2_2_0_0.wav %ADDITIONAL_ARGS_2_0_0%"

	cd ..\

	%COMPARE% OutStreams//%%~ng_model0_2_0_0.wav OutStreams//%%~ng_model1_2_0_0.wav 2> OutCmp//%%~ng_Model0_vs_Model1_2_0_0.txt
	%COMPARE% OutStreams//%%~ng_model1_2_0_0.wav OutStreams//%%~ng_model2_2_0_0.wav 2> OutCmp//%%~ng_Model1_vs_Model2_2_0_0.txt
	cd TestStreams

	echo     model 0 mode 0_2_0
    "..\%CONFIGURATION%\model0.exe" "%%g" "..\OutStreams//%%~ng_model0_0_2_0.wav %ADDITIONAL_ARGS_0_2_0%"
	echo     model 1 mode 0_2_0
	"..\%CONFIGURATION%\model1.exe" "%%g" "..\OutStreams//%%~ng_model1_0_2_0.wav %ADDITIONAL_ARGS_0_2_0%"
	echo     model 2 mode 0_2_0
	"..\%CONFIGURATION%\model2.exe" "%%g" "..\OutStreams//%%~ng_model2_0_2_0.wav %ADDITIONAL_ARGS_0_2_0%"

	cd ..\

	%COMPARE% OutStreams//%%~ng_model0_0_2_0.wav OutStreams//%%~ng_model1_0_2_0.wav 2> OutCmp//%%~ng_Model0_vs_Model1_0_2_0.txt
	%COMPARE% OutStreams//%%~ng_model1_0_2_0.wav OutStreams//%%~ng_model2_0_2_0.wav 2> OutCmp//%%~ng_Model1_vs_Model2_0_2_0.txt
	cd TestStreams
	
	echo     model 0 mode 3_2_0
    "..\%CONFIGURATION%\model0.exe" "%%g" "..\OutStreams//%%~ng_model0_3_2_0.wav %ADDITIONAL_ARGS_3_2_0%"
	echo     model 1 mode 3_2_0
	"..\%CONFIGURATION%\model1.exe" "%%g" "..\OutStreams//%%~ng_model1_3_2_0.wav %ADDITIONAL_ARGS_3_2_0%"
	echo     model 2 mode 3_2_0
	"..\%CONFIGURATION%\model2.exe" "%%g" "..\OutStreams//%%~ng_model2_3_2_0.wav %ADDITIONAL_ARGS_3_2_0%"

	cd ..\

	%COMPARE% OutStreams//%%~ng_model0_3_2_0.wav OutStreams//%%~ng_model1_3_2_0.wav 2> OutCmp//%%~ng_Model0_vs_Model1_3_2_0.txt
	%COMPARE% OutStreams//%%~ng_model1_3_2_0.wav OutStreams//%%~ng_model2_3_2_0.wav 2> OutCmp//%%~ng_Model1_vs_Model2_3_2_0.txt
	cd TestStreams
	)
