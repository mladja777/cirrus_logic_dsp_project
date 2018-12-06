	.public _buffer_choice
	.public _gain2db_scaled
	.public _gain6db_scaled
	.public _output_channels
	.public _processing_audio_compressor
	.public _processing_compressor_ratio
	.public _processing_compressor_threshold
	.public _processing_headroom_gain
	.public _processing_input_gain
	.public _processing_output_mode
	.public _sampleBuffer
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.extern _gst_audio_dynamic_transform_compressor_double
	.public _main
	.extern _printf
	.public _processing
	.extern _strcpy
	.extern __div
	.xdata_ovly
__extractedConst_0_2
	.dw  (0x7fffffff)
	.xdata_ovly
_buffer_choice
	.dw  (0x0)
	.dw  (0x2)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x3)
	.dw  (0x4)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x1)
	.dw  (0x2)
	.dw  (0x3)
	.dw  (0x4)
	.xdata_ovly
_gain2db_scaled
	.dw  (0x65ac8a37)
	.xdata_ovly
_gain6db_scaled
	.dw  (0x4026e547)
	.xdata_ovly
_output_channels
	.dw  (0x2)
	.dw  (0x2)
	.dw  (0x5)
	.xdata_ovly
_processing_audio_compressor
	.bss (0x2)
	.xdata_ovly
_processing_compressor_ratio
	.dw  (0x40000000)
	.xdata_ovly
_processing_compressor_threshold
	.dw  (0xccccccd)
	.xdata_ovly
_processing_headroom_gain
	.dw  (0x5a9df97b)
	.xdata_ovly
_processing_input_gain
	.dw  (0x4026e547)
	.xdata_ovly
_processing_output_mode
	.dw  (0x2)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.code_ovly



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 165 | 
	i7 += 1			# LN: 165 | 
	i7 = i7 + (0x20d)			# LN: 165 | 
	i1 = i7 - (0x1)			# LN: 165 | 
	xmem[i1] = a0h			# LN: 165 | 
	i1 = i7 - (0x2)			# LN: 165 | 
	xmem[i1] = i0			# LN: 165 | 
cline_165_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processing_output_mode + 0]			# LN: 174 | 
	i0 = a0			# LN: 174 | 
	i1 = i7 - (0x3)			# LN: 174 | 
	i0 = i0 + (_output_channels + 0)			# LN: 174 | 
	a0 = xmem[i0]			# LN: 174 | 
	xmem[i1] = a0h			# LN: 174 | 
cline_174_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 183 | 
	a0 = 0			# LN: 183 | 
	xmem[i0] = a0h			# LN: 183 | 
for_8:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 183 | 
	a0 = xmem[i0]			# LN: 183 | 
	uhalfword(a1) = (0x8)			# LN: 183 | 
	a0 - a1			# LN: 183 | 
	if (a >= 0) jmp (for_end_8)			# LN: 183 | 
cline_183_0:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 185 | 
	a0 = 0			# LN: 185 | 
	xmem[i0] = a0h			# LN: 185 | 
for_9:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 185 | 
	a0 = xmem[i0]			# LN: 185 | 
	uhalfword(a1) = (0x8)			# LN: 185 | 
	a0 - a1			# LN: 185 | 
	if (a >= 0) jmp (for_end_9)			# LN: 185 | 
cline_185_0:			/* LN: 187 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 187 | 
	a0 = xmem[i0]; a1 = 0			# LN: 187, 187 | 
	a0 = a0 << 4			# LN: 187 | 
	i0 = a0			# LN: 187 | 
	i1 = i7 - (0x5)			# LN: 187 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 187 | 
	a0 = xmem[i1]			# LN: 187 | 
	b0 = i0			# LN: 187 | 
	a0 = a0 + b0			# LN: 187 | 
	AnyReg(i0, a0h)			# LN: 187 | 
	nop #empty cycle
	ymem[i0] = a1h			# LN: 187 | 
cline_187_0:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
init_latch_label_8:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 185 | 
	a0 = xmem[i0]			# LN: 185 | 
	uhalfword(a1) = (0x1)			# LN: 185 | 
	a0 = a0 + a1			# LN: 185 | 
	i0 = i7 - (0x4)			# LN: 185 | 
	xmem[i0] = a0h			# LN: 185 | 
	jmp (for_9)			# LN: 185 | 
cline_185_1:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
init_latch_label_9:			/* LN: 189 | CYCLE: 0 | RULES: () */ 
for_end_9:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 183 | 
	a0 = xmem[i0]			# LN: 183 | 
	uhalfword(a1) = (0x1)			# LN: 183 | 
	a0 = a0 + a1			# LN: 183 | 
	i0 = i7 - (0x4)			# LN: 183 | 
	xmem[i0] = a0h			# LN: 183 | 
	jmp (for_8)			# LN: 183 | 
cline_183_1:			/* LN: 193 | CYCLE: 0 | RULES: () */ 
for_end_8:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 193 | 
	i0 = xmem[i0]			# LN: 193 | 
	i1 = i7 - (261 - 0)			# LN: 193 | 
	i4 = xmem[i0]			# LN: 193 | 
	i0 = i1			# LN: 193 | 
	i1 = i4			# LN: 193 | 
	call (_strcpy)			# LN: 193 | 
cline_193_0:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (261 - 0)			# LN: 194 | 
	call (_cl_wavread_open)			# LN: 194 | 
	AnyReg(i0, a0h)			# LN: 194 | 
	i1 = i7 - (0x106)			# LN: 194 | 
	xmem[i1] = i0			# LN: 194 | 
cline_194_0:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 195 | 
	a0 = xmem[i0]			# LN: 195 | 
	a0 & a0			# LN: 195 | 
	if (a != 0) jmp (else_1)			# LN: 195 | 
cline_195_0:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 197 | 
	call (_printf)			# LN: 197 | 
cline_197_0:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 198 | 
	jmp (__epilogue_228)			# LN: 198 | 
cline_198_0:			/* LN: 204 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 204 | 
	i0 = xmem[i0]			# LN: 204 | 
	call (_cl_wavread_getnchannels)			# LN: 204 | 
	i0 = i7 - (0x107)			# LN: 204 | 
	xmem[i0] = a0h			# LN: 204 | 
cline_204_0:			/* LN: 205 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 205 | 
	i0 = xmem[i0]			# LN: 205 | 
	call (_cl_wavread_bits_per_sample)			# LN: 205 | 
	i0 = i7 - (0x108)			# LN: 205 | 
	xmem[i0] = a0h			# LN: 205 | 
cline_205_0:			/* LN: 206 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 206 | 
	i0 = xmem[i0]			# LN: 206 | 
	call (_cl_wavread_frame_rate)			# LN: 206 | 
	i0 = i7 - (0x109)			# LN: 206 | 
	xmem[i0] = a0h			# LN: 206 | 
cline_206_0:			/* LN: 207 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 207 | 
	i0 = xmem[i0]			# LN: 207 | 
	call (_cl_wavread_number_of_frames)			# LN: 207 | 
	i0 = i7 - (0x10a)			# LN: 207 | 
	xmem[i0] = a0h			# LN: 207 | 
cline_207_0:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 212 | 
	i0 = xmem[i0]			# LN: 212 | 
	i1 = i7 - (522 - 0)			# LN: 212 | 
	i0 += 1			# LN: 212 | 
	i4 = xmem[i0]			# LN: 212 | 
	i0 = i1			# LN: 212 | 
	i1 = i4			# LN: 212 | 
	call (_strcpy)			# LN: 212 | 
cline_212_0:			/* LN: 213 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (522 - 0)			# LN: 213 | 
	i1 = i7 - (0x108)			# LN: 213 | 
	a0 = xmem[i1]			# LN: 213 | 
	i1 = i7 - (0x3)			# LN: 213 | 
	a1 = xmem[i1]			# LN: 213 | 
	i1 = i7 - (0x109)			# LN: 213 | 
	b0 = xmem[i1]			# LN: 213 | 
	call (_cl_wavwrite_open)			# LN: 213 | 
	AnyReg(i0, a0h)			# LN: 213 | 
	i1 = i7 - (0x20b)			# LN: 213 | 
	xmem[i1] = i0			# LN: 213 | 
cline_213_0:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 214 | 
	a0 = xmem[i0]			# LN: 214 | 
	a0 & a0			# LN: 214 | 
	if (a != 0) jmp (else_2)			# LN: 214 | 
cline_214_0:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 216 | 
	call (_printf)			# LN: 216 | 
cline_216_0:			/* LN: 217 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 217 | 
	jmp (__epilogue_228)			# LN: 217 | 
cline_217_0:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 228 | 
	a0 = 0			# LN: 228 | 
	xmem[i0] = a0h			# LN: 228 | 
for_10:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x10a)			# LN: 228 | 
	a0 = xmem[i0]			# LN: 228 | 
	uhalfword(a1) = (0x10)			# LN: 228 | 
	call (__div)			# LN: 228 | 
	i0 = i7 - (0x4)			# LN: 228 | 
	a1 = xmem[i0]			# LN: 228 | 
	a1 - a0			# LN: 228 | 
	if (a >= 0) jmp (for_end_10)			# LN: 228 | 
cline_228_0:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 230 | 
	a0 = 0			# LN: 230 | 
	xmem[i0] = a0h			# LN: 230 | 
	do (0x10), label_end_100			# LN: 230 | 
cline_230_0:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
label_begin_100:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 232 | 
	a0 = 0			# LN: 232 | 
	xmem[i0] = a0h			# LN: 232 | 
for_12:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 232 | 
	a0 = xmem[i0]			# LN: 232 | 
	i0 = i7 - (0x107)			# LN: 232 | 
	a1 = xmem[i0]			# LN: 232 | 
	a0 - a1			# LN: 232 | 
	if (a >= 0) jmp (for_end_12)			# LN: 232 | 
cline_232_0:			/* LN: 234 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 234 | 
	i0 = xmem[i0]			# LN: 234 | 
	call (_cl_wavread_recvsample)			# LN: 234 | 
	i0 = i7 - (0x20d)			# LN: 234 | 
	xmem[i0] = a0h			# LN: 234 | 
cline_234_0:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 235 | 
	a0 = xmem[i0]			# LN: 235 | 
	a0 = a0 << 4			# LN: 235 | 
	i0 = a0			# LN: 235 | 
	i1 = i7 - (0x5)			# LN: 235 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 235 | 
	a0 = xmem[i1]			# LN: 235 | 
	a1 = i0			# LN: 235 | 
	a0 = a1 + a0			# LN: 235 | 
	AnyReg(i0, a0h)			# LN: 235 | 
	i1 = i7 - (0x20d)			# LN: 235 | 
	a0 = xmem[i1]			# LN: 235 | 
	ymem[i0] = a0h			# LN: 235 | 
cline_235_0:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
init_latch_label_10:			/* LN: 236 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 232 | 
	a0 = xmem[i0]			# LN: 232 | 
	uhalfword(a1) = (0x1)			# LN: 232 | 
	a0 = a0 + a1			# LN: 232 | 
	i0 = i7 - (0x20c)			# LN: 232 | 
	xmem[i0] = a0h			# LN: 232 | 
	jmp (for_12)			# LN: 232 | 
cline_232_1:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
init_latch_label_11:			/* LN: 237 | CYCLE: 0 | RULES: () */ 
for_end_12:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 230 | 
	a0 = xmem[i0]			# LN: 230 | 
	uhalfword(a1) = (0x1)			# LN: 230 | 
	a0 = a0 + a1			# LN: 230 | 
	i0 = i7 - (0x5)			# LN: 230 | 
label_end_100:			# LN: 230 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 230 | 
cline_230_1:			/* LN: 239 | CYCLE: 0 | RULES: () */ 
for_end_11:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	call (_processing)			# LN: 239 | 
cline_239_0:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 241 | 
	a0 = 0			# LN: 241 | 
	xmem[i0] = a0h			# LN: 241 | 
	do (0x10), label_end_101			# LN: 241 | 
cline_241_0:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
label_begin_101:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 243 | 
	a0 = 0			# LN: 243 | 
	xmem[i0] = a0h			# LN: 243 | 
for_14:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 243 | 
	a0 = xmem[i0]			# LN: 243 | 
	i0 = i7 - (0x3)			# LN: 243 | 
	a1 = xmem[i0]			# LN: 243 | 
	a0 - a1			# LN: 243 | 
	if (a >= 0) jmp (for_end_14)			# LN: 243 | 
cline_243_0:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 245 | 
	a0 = xmem[i0]			# LN: 245 | 
	a0 = a0 << 4			# LN: 245 | 
	i0 = a0			# LN: 245 | 
	i1 = i7 - (0x5)			# LN: 245 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 245 | 
	a0 = xmem[i1]			# LN: 245 | 
	a1 = i0			# LN: 245 | 
	a0 = a1 + a0			# LN: 245 | 
	AnyReg(i0, a0h)			# LN: 245 | 
	i1 = i7 - (0x20d)			# LN: 245 | 
	a0 = ymem[i0]			# LN: 245 | 
	xmem[i1] = a0h			# LN: 245 | 
cline_245_0:			/* LN: 246 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 246 | 
	i1 = i7 - (0x20d)			# LN: 246 | 
	a0 = xmem[i1]			# LN: 246 | 
	i0 = xmem[i0]			# LN: 246 | 
	call (_cl_wavwrite_sendsample)			# LN: 246 | 
cline_246_0:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
init_latch_label_12:			/* LN: 247 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 243 | 
	a0 = xmem[i0]			# LN: 243 | 
	uhalfword(a1) = (0x1)			# LN: 243 | 
	a0 = a0 + a1			# LN: 243 | 
	i0 = i7 - (0x20c)			# LN: 243 | 
	xmem[i0] = a0h			# LN: 243 | 
	jmp (for_14)			# LN: 243 | 
cline_243_1:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
init_latch_label_13:			/* LN: 248 | CYCLE: 0 | RULES: () */ 
for_end_14:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 241 | 
	a0 = xmem[i0]			# LN: 241 | 
	uhalfword(a1) = (0x1)			# LN: 241 | 
	a0 = a0 + a1			# LN: 241 | 
	i0 = i7 - (0x5)			# LN: 241 | 
label_end_101:			# LN: 241 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 241 | 
cline_241_1:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
init_latch_label_14:			/* LN: 249 | CYCLE: 0 | RULES: () */ 
for_end_13:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 228 | 
	a0 = xmem[i0]			# LN: 228 | 
	uhalfword(a1) = (0x1)			# LN: 228 | 
	a0 = a0 + a1			# LN: 228 | 
	i0 = i7 - (0x4)			# LN: 228 | 
	xmem[i0] = a0h			# LN: 228 | 
	jmp (for_10)			# LN: 228 | 
cline_228_1:			/* LN: 254 | CYCLE: 0 | RULES: () */ 
for_end_10:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 254 | 
	i0 = xmem[i0]			# LN: 254 | 
	call (_cl_wavread_close)			# LN: 254 | 
cline_254_0:			/* LN: 255 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 255 | 
	i0 = xmem[i0]			# LN: 255 | 
	call (_cl_wavwrite_close)			# LN: 255 | 
cline_255_0:			/* LN: 258 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 258 | 
	jmp (__epilogue_228)			# LN: 258 | 
cline_258_0:			/* LN: 259 | CYCLE: 0 | RULES: () */ 
__epilogue_228:			/* LN: 259 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20d)			# LN: 259 | 
	i7 -= 1			# LN: 259 | 
	ret			# LN: 259 | 



_processing:			/* LN: 33 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 33 | 
	i7 += 1			# LN: 33 | 
	i7 = i7 + (0xa)			# LN: 33 | 
cline_33_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processing_output_mode + 0]			# LN: 36 | 
	uhalfword(a1) = (0x1)			# LN: 36 | 
	a0 - a1			# LN: 36 | 
	if (a != 0) jmp (else_0)			# LN: 36 | 
cline_36_0:			/* LN: 38 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 38 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 38 | 
	xmem[i0] = a0			# LN: 38 | 
cline_38_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 39 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 39 | 
	xmem[i0] = a0			# LN: 39 | 
cline_39_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 40 | 
	uhalfword(a0) = (_sampleBuffer + 32)			# LN: 40 | 
	xmem[i0] = a0			# LN: 40 | 
cline_40_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 43 | 
	a0 = 0			# LN: 43 | 
	xmem[i0] = a0h			# LN: 43 | 
	do (0x10), label_end_92			# LN: 43 | 
cline_43_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 45 | 
	i0 = xmem[i0]			# LN: 45 | 
	i1 = i7 - (0x3)			# LN: 45 | 
	x0 = ymem[i0]			# LN: 45 | 
	i0 = xmem[i1]			# LN: 45 | 
	x1 = xmem[_processing_input_gain + 0]			# LN: 45 | 
	x0 = ymem[i0]; a0 = x0 * x1			# LN: 45, 45 | 
	x1 = xmem[_processing_input_gain + 0]			# LN: 45 | 
	i0 = i7 - (0x2)			# LN: 45 | 
	i0 = xmem[i0]			# LN: 45 | 
	a0 += x0 * x1			# LN: 45 | 
	ymem[i0] = a0			# LN: 45 | 
cline_45_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 46 | 
	i0 = xmem[i0]			# LN: 46 | 
	i1 = i7 - (0x3)			# LN: 46 | 
	i0 += 1			# LN: 46 | 
	xmem[i1] = i0			# LN: 46 | 
cline_46_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 47 | 
	i0 = xmem[i0]			# LN: 47 | 
	i1 = i7 - (0x1)			# LN: 47 | 
	i0 += 1			# LN: 47 | 
	xmem[i1] = i0			# LN: 47 | 
cline_47_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 48 | 
	i0 = xmem[i0]			# LN: 48 | 
	i1 = i7 - (0x2)			# LN: 48 | 
	i0 += 1			# LN: 48 | 
	xmem[i1] = i0			# LN: 48 | 
cline_48_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 43 | 
	a0 = xmem[i0]			# LN: 43 | 
	uhalfword(a1) = (0x1)			# LN: 43 | 
	a0 = a0 + a1			# LN: 43 | 
	i0 = i7 - (0x4)			# LN: 43 | 
label_end_92:			# LN: 43 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 43 | 
cline_43_1:			/* LN: 50 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 50 | 
	i0 = xmem[i0]			# LN: 50 | 
	i1 = i7 - (0x1)			# LN: 50 | 
	i0 = i0 - (0x10)			# LN: 50 | 
	xmem[i1] = i0			# LN: 50 | 
cline_50_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 51 | 
	i0 = xmem[i0]			# LN: 51 | 
	i1 = i7 - (0x2)			# LN: 51 | 
	i0 = i0 - (0x10)			# LN: 51 | 
	xmem[i1] = i0			# LN: 51 | 
cline_51_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 52 | 
	i0 = xmem[i0]			# LN: 52 | 
	i1 = i7 - (0x3)			# LN: 52 | 
	i0 = i0 - (0x10)			# LN: 52 | 
	xmem[i1] = i0			# LN: 52 | 
cline_52_0:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 54 | 
	a0 = 0			# LN: 54 | 
	xmem[i0] = a0h			# LN: 54 | 
	do (0x10), label_end_93			# LN: 54 | 
cline_54_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 56 | 
	i0 = xmem[i0]			# LN: 56 | 
	x0 = xmem[_processing_headroom_gain + 0]			# LN: 56 | 
	x1 = ymem[i0]			# LN: 56 | 
	i0 = i7 - (0x2)			# LN: 56 | 
	i0 = xmem[i0]			# LN: 56 | 
	a0 = x1 * x0			# LN: 56 | 
	ymem[i0] = a0			# LN: 56 | 
cline_56_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 57 | 
	i0 = xmem[i0]			# LN: 57 | 
	i1 = i7 - (0x2)			# LN: 57 | 
	i0 += 1			# LN: 57 | 
	xmem[i1] = i0			# LN: 57 | 
cline_57_0:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 54 | 
	a0 = xmem[i0]			# LN: 54 | 
	uhalfword(a1) = (0x1)			# LN: 54 | 
	a0 = a0 + a1			# LN: 54 | 
	i0 = i7 - (0x4)			# LN: 54 | 
label_end_93:			# LN: 54 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 54 | 
cline_54_1:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 59 | 
	i0 = xmem[i0]			# LN: 59 | 
	i1 = i7 - (0x2)			# LN: 59 | 
	i0 = i0 - (0x10)			# LN: 59 | 
	xmem[i1] = i0			# LN: 59 | 
cline_59_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 61 | 
	a0 = 0			# LN: 61 | 
	xmem[i0] = a0h			# LN: 61 | 
	do (0x10), label_end_94			# LN: 61 | 
cline_61_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 63 | 
	i0 = xmem[i0]			# LN: 63 | 
	x0 = xmem[_gain6db_scaled + 0]			# LN: 63 | 
	x1 = ymem[i0]			# LN: 63 | 
	i0 = i7 - (0x1)			# LN: 63 | 
	i0 = xmem[i0]			# LN: 63 | 
	a0 = x1 * x0			# LN: 63 | 
	ymem[i0] = a0			# LN: 63 | 
cline_63_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	x0 = xmem[_gain6db_scaled + 0]			# LN: 64 | 
	x1 = ymem[i0]			# LN: 64 | 
	i0 = i7 - (0x3)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	a0 = x1 * x0			# LN: 64 | 
	ymem[i0] = a0			# LN: 64 | 
cline_64_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 65 | 
	i0 = xmem[i0]			# LN: 65 | 
	i1 = i7 - (0x1)			# LN: 65 | 
	i0 += 1			# LN: 65 | 
	xmem[i1] = i0			# LN: 65 | 
cline_65_0:			/* LN: 66 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 66 | 
	i0 = xmem[i0]			# LN: 66 | 
	i1 = i7 - (0x3)			# LN: 66 | 
	i0 += 1			# LN: 66 | 
	xmem[i1] = i0			# LN: 66 | 
cline_66_0:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 67 | 
	i0 = xmem[i0]			# LN: 67 | 
	i1 = i7 - (0x2)			# LN: 67 | 
	i0 += 1			# LN: 67 | 
	xmem[i1] = i0			# LN: 67 | 
cline_67_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 61 | 
	a0 = xmem[i0]			# LN: 61 | 
	uhalfword(a1) = (0x1)			# LN: 61 | 
	a0 = a0 + a1			# LN: 61 | 
	i0 = i7 - (0x4)			# LN: 61 | 
label_end_94:			# LN: 61 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 61 | 
cline_61_1:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 69 | 
	i0 = xmem[i0]			# LN: 69 | 
	i1 = i7 - (0x1)			# LN: 69 | 
	i0 = i0 - (0x10)			# LN: 69 | 
	xmem[i1] = i0			# LN: 69 | 
cline_69_0:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 70 | 
	i0 = xmem[i0]			# LN: 70 | 
	i1 = i7 - (0x2)			# LN: 70 | 
	i0 = i0 - (0x10)			# LN: 70 | 
	xmem[i1] = i0			# LN: 70 | 
cline_70_0:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 71 | 
	i0 = xmem[i0]			# LN: 71 | 
	i1 = i7 - (0x3)			# LN: 71 | 
	i0 = i0 - (0x10)			# LN: 71 | 
	xmem[i1] = i0			# LN: 71 | 
	jmp (endif_0)			# LN: 71 | 
cline_71_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 76 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 76 | 
	xmem[i0] = a0			# LN: 76 | 
cline_76_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 77 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 77 | 
	xmem[i0] = a0			# LN: 77 | 
cline_77_0:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 78 | 
	uhalfword(a0) = (_sampleBuffer + 32)			# LN: 78 | 
	xmem[i0] = a0			# LN: 78 | 
cline_78_0:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 79 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 79 | 
	xmem[i0] = a0			# LN: 79 | 
cline_79_0:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 80 | 
	uhalfword(a0) = (_sampleBuffer + 64)			# LN: 80 | 
	xmem[i0] = a0			# LN: 80 | 
cline_80_0:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 83 | 
	a0 = 0			# LN: 83 | 
	xmem[i0] = a0h			# LN: 83 | 
	do (0x10), label_end_95			# LN: 83 | 
cline_83_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 86 | 
	i0 = xmem[i0]			# LN: 86 | 
	x0 = xmem[_processing_input_gain + 0]			# LN: 86 | 
	x1 = ymem[i0]			# LN: 86 | 
	i0 = i7 - (0x8)			# LN: 86 | 
	i0 = xmem[i0]			# LN: 86 | 
	a0 = x1 * x0			# LN: 86 | 
	ymem[i0] = a0			# LN: 86 | 
cline_86_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 88 | 
	i0 = xmem[i0]			# LN: 88 | 
	x0 = xmem[_processing_input_gain + 0]			# LN: 88 | 
	x1 = ymem[i0]			# LN: 88 | 
	i0 = i7 - (0x9)			# LN: 88 | 
	i0 = xmem[i0]			# LN: 88 | 
	a0 = x1 * x0			# LN: 88 | 
	ymem[i0] = a0			# LN: 88 | 
cline_88_0:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 90 | 
	i0 = xmem[i0]			# LN: 90 | 
	i1 = i7 - (0x9)			# LN: 90 | 
	i1 = xmem[i1]			# LN: 90 | 
	a0 = ymem[i0]			# LN: 90 | 
	a1 = ymem[i1]			# LN: 90 | 
	i0 = i7 - (0x6)			# LN: 90 | 
	i0 = xmem[i0]			# LN: 90 | 
	a0 = a0 + a1			# LN: 90 | 
	ymem[i0] = a0h			# LN: 90 | 
cline_90_0:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 92 | 
	i0 = xmem[i0]			# LN: 92 | 
	i1 = i7 - (0x8)			# LN: 92 | 
	i0 += 1			# LN: 92 | 
	xmem[i1] = i0			# LN: 92 | 
cline_92_0:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 93 | 
	i0 = xmem[i0]			# LN: 93 | 
	i1 = i7 - (0x5)			# LN: 93 | 
	i0 += 1			# LN: 93 | 
	xmem[i1] = i0			# LN: 93 | 
cline_93_0:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 94 | 
	i0 = xmem[i0]			# LN: 94 | 
	i1 = i7 - (0x9)			# LN: 94 | 
	i0 += 1			# LN: 94 | 
	xmem[i1] = i0			# LN: 94 | 
cline_94_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 95 | 
	i0 = xmem[i0]			# LN: 95 | 
	i1 = i7 - (0x7)			# LN: 95 | 
	i0 += 1			# LN: 95 | 
	xmem[i1] = i0			# LN: 95 | 
cline_95_0:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 96 | 
	i0 = xmem[i0]			# LN: 96 | 
	i1 = i7 - (0x6)			# LN: 96 | 
	i0 += 1			# LN: 96 | 
	xmem[i1] = i0			# LN: 96 | 
cline_96_0:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 83 | 
	a0 = xmem[i0]			# LN: 83 | 
	uhalfword(a1) = (0x1)			# LN: 83 | 
	a0 = a0 + a1			# LN: 83 | 
	i0 = i7 - (0xa)			# LN: 83 | 
label_end_95:			# LN: 83 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 83 | 
cline_83_1:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 99 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 99 | 
	xmem[i0] = a0			# LN: 99 | 
cline_99_0:			/* LN: 100 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 100 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 100 | 
	xmem[i0] = a0			# LN: 100 | 
cline_100_0:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 101 | 
	uhalfword(a0) = (_sampleBuffer + 32)			# LN: 101 | 
	xmem[i0] = a0			# LN: 101 | 
cline_101_0:			/* LN: 102 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 102 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 102 | 
	xmem[i0] = a0			# LN: 102 | 
cline_102_0:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 103 | 
	uhalfword(a0) = (_sampleBuffer + 64)			# LN: 103 | 
	xmem[i0] = a0			# LN: 103 | 
cline_103_0:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x8)			# LN: 106 | 
	i1 = xmem[i1]			# LN: 106 | 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 106 | 
	i0 = (0) + (_processing_audio_compressor)			# LN: 106 | 
	call (_gst_audio_dynamic_transform_compressor_double)			# LN: 106 | 
cline_106_0:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x9)			# LN: 108 | 
	i1 = xmem[i1]			# LN: 108 | 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 108 | 
	i0 = (0) + (_processing_audio_compressor)			# LN: 108 | 
	call (_gst_audio_dynamic_transform_compressor_double)			# LN: 108 | 
cline_108_0:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 110 | 
	a0 = 0			# LN: 110 | 
	xmem[i0] = a0h			# LN: 110 | 
	do (0x10), label_end_96			# LN: 110 | 
cline_110_0:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 113 | 
	i0 = xmem[i0]			# LN: 113 | 
	x0 = xmem[_processing_headroom_gain + 0]			# LN: 113 | 
	x1 = ymem[i0]			# LN: 113 | 
	i0 = i7 - (0x6)			# LN: 113 | 
	i0 = xmem[i0]			# LN: 113 | 
	a0 = x1 * x0			# LN: 113 | 
	ymem[i0] = a0			# LN: 113 | 
cline_113_0:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 114 | 
	i0 = xmem[i0]			# LN: 114 | 
	i1 = i7 - (0x6)			# LN: 114 | 
	i0 += 1			# LN: 114 | 
	xmem[i1] = i0			# LN: 114 | 
cline_114_0:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 115 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 110 | 
	a0 = xmem[i0]			# LN: 110 | 
	uhalfword(a1) = (0x1)			# LN: 110 | 
	a0 = a0 + a1			# LN: 110 | 
	i0 = i7 - (0xa)			# LN: 110 | 
label_end_96:			# LN: 110 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 110 | 
cline_110_1:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 117 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 117 | 
	xmem[i0] = a0			# LN: 117 | 
cline_117_0:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 119 | 
	a0 = 0			# LN: 119 | 
	xmem[i0] = a0h			# LN: 119 | 
	do (0x10), label_end_97			# LN: 119 | 
cline_119_0:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
label_begin_97:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 122 | 
	i0 = xmem[i0]			# LN: 122 | 
	x0 = xmem[_gain6db_scaled + 0]			# LN: 122 | 
	x1 = ymem[i0]			# LN: 122 | 
	i0 = i7 - (0x5)			# LN: 122 | 
	i0 = xmem[i0]			# LN: 122 | 
	a0 = x1 * x0			# LN: 122 | 
	ymem[i0] = a0			# LN: 122 | 
cline_122_0:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 124 | 
	i0 = xmem[i0]			# LN: 124 | 
	x0 = xmem[_gain6db_scaled + 0]			# LN: 124 | 
	x1 = ymem[i0]			# LN: 124 | 
	i0 = i7 - (0x7)			# LN: 124 | 
	i0 = xmem[i0]			# LN: 124 | 
	a0 = x1 * x0			# LN: 124 | 
	ymem[i0] = a0			# LN: 124 | 
cline_124_0:			/* LN: 126 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 126 | 
	i0 = xmem[i0]			# LN: 126 | 
	i1 = i7 - (0x5)			# LN: 126 | 
	i0 += 1			# LN: 126 | 
	xmem[i1] = i0			# LN: 126 | 
cline_126_0:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 127 | 
	i0 = xmem[i0]			# LN: 127 | 
	i1 = i7 - (0x7)			# LN: 127 | 
	i0 += 1			# LN: 127 | 
	xmem[i1] = i0			# LN: 127 | 
cline_127_0:			/* LN: 128 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 128 | 
	i0 = xmem[i0]			# LN: 128 | 
	i1 = i7 - (0x6)			# LN: 128 | 
	i0 += 1			# LN: 128 | 
	xmem[i1] = i0			# LN: 128 | 
cline_128_0:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 119 | 
	a0 = xmem[i0]			# LN: 119 | 
	uhalfword(a1) = (0x1)			# LN: 119 | 
	a0 = a0 + a1			# LN: 119 | 
	i0 = i7 - (0xa)			# LN: 119 | 
label_end_97:			# LN: 119 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 119 | 
cline_119_1:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 131 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 131 | 
	xmem[i0] = a0			# LN: 131 | 
cline_131_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 132 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 132 | 
	xmem[i0] = a0			# LN: 132 | 
cline_132_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 133 | 
	uhalfword(a0) = (_sampleBuffer + 32)			# LN: 133 | 
	xmem[i0] = a0			# LN: 133 | 
cline_133_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 135 | 
	a0 = 0			# LN: 135 | 
	xmem[i0] = a0h			# LN: 135 | 
	do (0x10), label_end_98			# LN: 135 | 
cline_135_0:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
label_begin_98:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 138 | 
	i0 = xmem[i0]			# LN: 138 | 
	x0 = xmem[_gain2db_scaled + 0]			# LN: 138 | 
	x1 = ymem[i0]			# LN: 138 | 
	i0 = i7 - (0x8)			# LN: 138 | 
	i0 = xmem[i0]			# LN: 138 | 
	a0 = x1 * x0			# LN: 138 | 
	ymem[i0] = a0			# LN: 138 | 
cline_138_0:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 140 | 
	i0 = xmem[i0]			# LN: 140 | 
	x0 = xmem[_gain2db_scaled + 0]			# LN: 140 | 
	x1 = ymem[i0]			# LN: 140 | 
	i0 = i7 - (0x9)			# LN: 140 | 
	i0 = xmem[i0]			# LN: 140 | 
	a0 = x1 * x0			# LN: 140 | 
	ymem[i0] = a0			# LN: 140 | 
cline_140_0:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 142 | 
	i0 = xmem[i0]			# LN: 142 | 
	i1 = i7 - (0x8)			# LN: 142 | 
	i0 += 1			# LN: 142 | 
	xmem[i1] = i0			# LN: 142 | 
cline_142_0:			/* LN: 143 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 143 | 
	i0 = xmem[i0]			# LN: 143 | 
	i1 = i7 - (0x9)			# LN: 143 | 
	i0 += 1			# LN: 143 | 
	xmem[i1] = i0			# LN: 143 | 
cline_143_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 144 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 135 | 
	a0 = xmem[i0]			# LN: 135 | 
	uhalfword(a1) = (0x1)			# LN: 135 | 
	a0 = a0 + a1			# LN: 135 | 
	i0 = i7 - (0xa)			# LN: 135 | 
label_end_98:			# LN: 135 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 135 | 
cline_135_1:			/* LN: 146 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 146 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 146 | 
	xmem[i0] = a0			# LN: 146 | 
cline_146_0:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 147 | 
	uhalfword(a0) = (_sampleBuffer + 64)			# LN: 147 | 
	xmem[i0] = a0			# LN: 147 | 
cline_147_0:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 150 | 
	a0 = 0			# LN: 150 | 
	xmem[i0] = a0h			# LN: 150 | 
	do (0x10), label_end_99			# LN: 150 | 
cline_150_0:			/* LN: 153 | CYCLE: 0 | RULES: () */ 
label_begin_99:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 153 | 
	i0 = xmem[i0]			# LN: 153 | 
	i1 = i7 - (0x8)			# LN: 153 | 
	i1 = xmem[i1]			# LN: 153 | 
	a0 = ymem[i0]			# LN: 153 | 
	a1 = ymem[i1]			# LN: 153 | 
	i0 = i7 - (0x8)			# LN: 153 | 
	i0 = xmem[i0]			# LN: 153 | 
	a0 = a1 + a0			# LN: 153 | 
	ymem[i0] = a0h			# LN: 153 | 
cline_153_0:			/* LN: 155 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 155 | 
	i0 = xmem[i0]			# LN: 155 | 
	i1 = i7 - (0x9)			# LN: 155 | 
	i1 = xmem[i1]			# LN: 155 | 
	a0 = ymem[i0]			# LN: 155 | 
	a1 = ymem[i1]			# LN: 155 | 
	i0 = i7 - (0x9)			# LN: 155 | 
	i0 = xmem[i0]			# LN: 155 | 
	a0 = a0 + a1			# LN: 155 | 
	ymem[i0] = a0h			# LN: 155 | 
cline_155_0:			/* LN: 157 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 157 | 
	i0 = xmem[i0]			# LN: 157 | 
	i1 = i7 - (0x8)			# LN: 157 | 
	i0 += 1			# LN: 157 | 
	xmem[i1] = i0			# LN: 157 | 
cline_157_0:			/* LN: 158 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 158 | 
	i0 = xmem[i0]			# LN: 158 | 
	i1 = i7 - (0x9)			# LN: 158 | 
	i0 += 1			# LN: 158 | 
	xmem[i1] = i0			# LN: 158 | 
cline_158_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 159 | 
	i0 = xmem[i0]			# LN: 159 | 
	i1 = i7 - (0x5)			# LN: 159 | 
	i0 += 1			# LN: 159 | 
	xmem[i1] = i0			# LN: 159 | 
cline_159_0:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 160 | 
	i0 = xmem[i0]			# LN: 160 | 
	i1 = i7 - (0x7)			# LN: 160 | 
	i0 += 1			# LN: 160 | 
	xmem[i1] = i0			# LN: 160 | 
cline_160_0:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
init_latch_label_7:			/* LN: 161 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 150 | 
	a0 = xmem[i0]			# LN: 150 | 
	uhalfword(a1) = (0x1)			# LN: 150 | 
	a0 = a0 + a1			# LN: 150 | 
	i0 = i7 - (0xa)			# LN: 150 | 
label_end_99:			# LN: 150 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 150 | 
cline_150_1:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_226)			# LN: 163 | 
__epilogue_226:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0xa)			# LN: 163 | 
	i7 -= 1			# LN: 163 | 
	ret			# LN: 163 | 
