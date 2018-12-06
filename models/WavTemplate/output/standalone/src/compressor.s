	.public _audio_compressor_init
	.public _gst_audio_dynamic_transform_compressor_double
	.public _gst_audio_dynamic_transform_compressor_float
	.extern __int_to_fract
	.extern __fract_to_ufract
	.xdata_ovly
__extractedConst_0_3
	.dw  (0x7fffffff)
	.code_ovly



_audio_compressor_init:			/* LN: 13 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 13 | 
	i7 += 1			# LN: 13 | 
	i7 = i7 + (0x1)			# LN: 13 | 
	i1 = i7 - (0x1)			# LN: 13 | 
	xmem[i1] = i0			# LN: 13 | 
cline_13_0:			/* LN: 14 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 14 | 
	i0 = xmem[i0]			# LN: 14 | 
	a0 = xmem[__extractedConst_0_3 + 0]			# LN: 14 | 
	i0 += 1			# LN: 14 | 
	xmem[i0] = a0h			# LN: 14 | 
cline_14_0:			/* LN: 15 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 15 | 
	a0 = xmem[i0]; a1 = 0			# LN: 15, 15 | 
	AnyReg(i0, a0h)			# LN: 15 | 
	nop #empty cycle
	xmem[i0] = a1h			# LN: 15 | 
cline_15_0:			/* LN: 16 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_104)			# LN: 16 | 
__epilogue_104:			/* LN: 16 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 16 | 
	i7 -= 1			# LN: 16 | 
	ret			# LN: 16 | 



_gst_audio_dynamic_transform_compressor_double:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 47 | 
	i7 += 1			# LN: 47 | 
	i7 = i7 + (0xc)			# LN: 47 | 
	i4 = i7 - (0x1)			# LN: 47 | 
	xmem[i4] = i0			# LN: 47 | 
	i0 = i7 - (0x2)			# LN: 47 | 
	xmem[i0] = i1			# LN: 47 | 
	i0 = i7 - (0x3)			# LN: 47 | 
	xmem[i0] = a0h			# LN: 47 | 
cline_47_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 49 | 
	a0 = xmem[i0]			# LN: 49 | 
	AnyReg(i0, a0h)			# LN: 49 | 
	i1 = i7 - (0x6)			# LN: 49 | 
	a0 = xmem[i0]			# LN: 49 | 
	xmem[i1] = a0g; i1 += 1			# LN: 49, 49 | 
	xmem[i1] = a0h; i1 += 1			# LN: 49, 49 | 
	xmem[i1] = a0l			# LN: 49 | 
cline_49_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 55 | 
	i0 = xmem[i0]			# LN: 55 | 
	a0 = xmem[__extractedConst_0_3 + 0]			# LN: 55 | 
	i0 += 1			# LN: 55 | 
	a1 = xmem[i0]			# LN: 55 | 
	a1 - a0			# LN: 55 | 
	if (a != 0) jmp (else_3)			# LN: 55 | 
cline_55_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_108)			# LN: 56 | 
cline_56_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 58 | 
	a0 = 0			# LN: 58 | 
	xmem[i0] = a0h			# LN: 58 | 
for_1:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 58 | 
	a0 = xmem[i0]			# LN: 58 | 
	i0 = i7 - (0x3)			# LN: 58 | 
	a1 = xmem[i0]			# LN: 58 | 
	call (__int_to_fract)			# LN: 58 | 
	b0 =+ a0			# LN: 58 | 
	a0 =+ a1			# LN: 58 | 
	call (__fract_to_ufract)			# LN: 58 | 
	b0 - a0			# LN: 58 | 
	if (b >= 0) jmp (for_end_1)			# LN: 58 | 
cline_58_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 59 | 
	a0 = xmem[i0]			# LN: 59 | 
	i0 = i7 - (0x2)			# LN: 59 | 
	a1 = xmem[i0]			# LN: 59 | 
	a0 = a1 + a0			# LN: 59 | 
	AnyReg(i0, a0h)			# LN: 59 | 
	i1 = i7 - (0xa)			# LN: 59 | 
	a0 = ymem[i0]			# LN: 59 | 
	xmem[i1] = a0g; i1 += 1			# LN: 59, 59 | 
	xmem[i1] = a0h; i1 += 1			# LN: 59, 59 | 
	xmem[i1] = a0l			# LN: 59 | 
cline_59_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 60 | 
	a0g = xmem[i0]; i0 += 1			# LN: 60, 60 | 
	a0h = xmem[i0]; i0 += 1			# LN: 60, 60 | 
	a0l = xmem[i0]			# LN: 60 | 
	i0 = i7 - (0x6)			# LN: 60 | 
	a1g = xmem[i0]; i0 += 1			# LN: 60, 60 | 
	a1h = xmem[i0]; i0 += 1			# LN: 60, 60 | 
	a1l = xmem[i0]			# LN: 60 | 
	a0 = a0 - a1			# LN: 60 | 
	i0 = i7 - (0xb)			# LN: 60 | 
	xmem[i0] = a0			# LN: 60 | 
cline_60_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 61 | 
	a0g = xmem[i0]; i0 += 1			# LN: 61, 61 | 
	a0h = xmem[i0]; i0 += 1			# LN: 61, 61 | 
	a0l = xmem[i0]			# LN: 61 | 
	i0 = i7 - (0x6)			# LN: 61 | 
	a1g = xmem[i0]; i0 += 1			# LN: 61, 61 | 
	a1h = xmem[i0]; i0 += 1			# LN: 61, 61 | 
	a1l = xmem[i0]			# LN: 61 | 
	a0 = a0 + a1			# LN: 61 | 
	i0 = i7 - (0xc)			# LN: 61 | 
	xmem[i0] = a0			# LN: 61 | 
cline_61_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 63 | 
	a0g = xmem[i0]; i0 += 1			# LN: 63, 63 | 
	a0h = xmem[i0]; i0 += 1			# LN: 63, 63 | 
	a0l = xmem[i0]			# LN: 63 | 
	i0 = i7 - (0x6)			# LN: 63 | 
	a1g = xmem[i0]; i0 += 1			# LN: 63, 63 | 
	a1h = xmem[i0]; i0 += 1			# LN: 63, 63 | 
	b0 =+ a0			# LN: 63 | 
	a1l = xmem[i0]			# LN: 63 | 
	a0 =+ a1			# LN: 63 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 63, 63 | 
	b0 - a0			# LN: 63 | 
	if (b <= 0) jmp (else_4)			# LN: 63 | 
cline_63_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	i1 = i7 - (0xb)			# LN: 64 | 
	i0 += 1			# LN: 64 | 
	x0 = xmem[i0]			# LN: 64 | 
	x1 = xmem[i1]			# LN: 64 | 
	a0 = x1 * x0			# LN: 64 | 
	i0 = i7 - (0xa)			# LN: 64 | 
	xmem[i0] = a0g; i0 += 1			# LN: 64, 64 | 
	xmem[i0] = a0h; i0 += 1			# LN: 64, 64 | 
	xmem[i0] = a0l			# LN: 64 | 
cline_64_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 65 | 
	a0g = xmem[i0]; i0 += 1			# LN: 65, 65 | 
	a0h = xmem[i0]; i0 += 1			# LN: 65, 65 | 
	a0l = xmem[i0]			# LN: 65 | 
	i0 = i7 - (0x6)			# LN: 65 | 
	a1g = xmem[i0]; i0 += 1			# LN: 65, 65 | 
	a1h = xmem[i0]; i0 += 1			# LN: 65, 65 | 
	a1l = xmem[i0]			# LN: 65 | 
	a0 = a0 + a1			# LN: 65 | 
	i0 = i7 - (0xa)			# LN: 65 | 
	xmem[i0] = a0g; i0 += 1			# LN: 65, 65 | 
	xmem[i0] = a0h; i0 += 1			# LN: 65, 65 | 
	xmem[i0] = a0l			# LN: 65 | 
	jmp (endif_4)			# LN: 65 | 
cline_65_0:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 67 | 
	a0g = xmem[i0]; i0 += 1			# LN: 67, 67 | 
	a0h = xmem[i0]; i0 += 1			# LN: 67, 67 | 
	a0l = xmem[i0]			# LN: 67 | 
	i0 = i7 - (0xa)			# LN: 67 | 
	a1g = xmem[i0]; i0 += 1			# LN: 67, 67 | 
	a1h = xmem[i0]; i0 += 1			# LN: 67, 67 | 
	a0 =- a0			# LN: 67 | 
	a1l = xmem[i0]			# LN: 67 | 
	b0 =+ a1			# LN: 67 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 67, 67 | 
	b0 - a0			# LN: 67 | 
	if (b >= 0) jmp (else_5)			# LN: 67 | 
cline_67_0:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 68 | 
	i0 = xmem[i0]			# LN: 68 | 
	i1 = i7 - (0xc)			# LN: 68 | 
	i0 += 1			# LN: 68 | 
	x0 = xmem[i0]			# LN: 68 | 
	x1 = xmem[i1]			# LN: 68 | 
	a0 = x1 * x0			# LN: 68 | 
	i0 = i7 - (0xa)			# LN: 68 | 
	xmem[i0] = a0g; i0 += 1			# LN: 68, 68 | 
	xmem[i0] = a0h; i0 += 1			# LN: 68, 68 | 
	xmem[i0] = a0l			# LN: 68 | 
cline_68_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 69 | 
	a0g = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a0h = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a0l = xmem[i0]			# LN: 69 | 
	i0 = i7 - (0x6)			# LN: 69 | 
	a1g = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a1h = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a1l = xmem[i0]			# LN: 69 | 
	a0 = a0 - a1			# LN: 69 | 
	i0 = i7 - (0xa)			# LN: 69 | 
	xmem[i0] = a0g; i0 += 1			# LN: 69, 69 | 
	xmem[i0] = a0h; i0 += 1			# LN: 69, 69 | 
	xmem[i0] = a0l			# LN: 69 | 
	jmp (endif_5)			# LN: 69 | 
cline_69_0:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 71 | 
	a0 = xmem[i0]			# LN: 71 | 
	i0 = i7 - (0x2)			# LN: 71 | 
	a1 = xmem[i0]			# LN: 71 | 
	a0 = a1 + a0			# LN: 71 | 
	AnyReg(i0, a0h)			# LN: 71 | 
	i1 = i7 - (0xa)			# LN: 71 | 
	a0g = xmem[i1]; i1 += 1			# LN: 71, 71 | 
	a0h = xmem[i1]; i1 += 1			# LN: 71, 71 | 
	a0l = xmem[i1]			# LN: 71 | 
	ymem[i0] = a0			# LN: 71 | 
cline_71_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 72 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 58 | 
	a0 = xmem[i0]			# LN: 58 | 
	uhalfword(a1) = (0x1)			# LN: 58 | 
	a0 = a0 + a1			# LN: 58 | 
	i0 = i7 - (0x7)			# LN: 58 | 
	xmem[i0] = a0h			# LN: 58 | 
	jmp (for_1)			# LN: 58 | 
cline_58_1:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_108)			# LN: 74 | 
__epilogue_108:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0xc)			# LN: 74 | 
	i7 -= 1			# LN: 74 | 
	ret			# LN: 74 | 



_gst_audio_dynamic_transform_compressor_float:			/* LN: 18 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 18 | 
	i7 += 1			# LN: 18 | 
	i7 = i7 + (0x8)			# LN: 18 | 
	i4 = i7 - (0x1)			# LN: 18 | 
	xmem[i4] = i0			# LN: 18 | 
	i0 = i7 - (0x2)			# LN: 18 | 
	xmem[i0] = i1			# LN: 18 | 
	i0 = i7 - (0x3)			# LN: 18 | 
	xmem[i0] = a0h			# LN: 18 | 
cline_18_0:			/* LN: 20 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 20 | 
	a0 = xmem[i0]			# LN: 20 | 
	AnyReg(i0, a0h)			# LN: 20 | 
	i1 = i7 - (0x4)			# LN: 20 | 
	a0 = xmem[i0]			# LN: 20 | 
	xmem[i1] = a0h			# LN: 20 | 
cline_20_0:			/* LN: 26 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 26 | 
	i0 = xmem[i0]			# LN: 26 | 
	a0 = xmem[__extractedConst_0_3 + 0]			# LN: 26 | 
	i0 += 1			# LN: 26 | 
	a1 = xmem[i0]			# LN: 26 | 
	a1 - a0			# LN: 26 | 
	if (a != 0) jmp (else_0)			# LN: 26 | 
cline_26_0:			/* LN: 27 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 27 | 
cline_27_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 26 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 26 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 29 | 
	a0 = 0			# LN: 29 | 
	xmem[i0] = a0h			# LN: 29 | 
for_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 29 | 
	a0 = xmem[i0]			# LN: 29 | 
	i0 = i7 - (0x3)			# LN: 29 | 
	a1 = xmem[i0]			# LN: 29 | 
	a0 - a1			# LN: 29 | 
	if (a >= 0) jmp (for_end_0)			# LN: 29 | 
cline_29_0:			/* LN: 30 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 30 | 
	a0 = xmem[i0]			# LN: 30 | 
	i0 = i7 - (0x2)			# LN: 30 | 
	a1 = xmem[i0]			# LN: 30 | 
	a0 = a1 + a0			# LN: 30 | 
	AnyReg(i0, a0h)			# LN: 30 | 
	i1 = i7 - (0x6)			# LN: 30 | 
	a0 = ymem[i0]			# LN: 30 | 
	xmem[i1] = a0h			# LN: 30 | 
cline_30_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 31 | 
	a0 = xmem[i0]			# LN: 31 | 
	i0 = i7 - (0x4)			# LN: 31 | 
	a1 = xmem[i0]			# LN: 31 | 
	a0 = a0 - a1			# LN: 31 | 
	i0 = i7 - (0x7)			# LN: 31 | 
	xmem[i0] = a0h			# LN: 31 | 
cline_31_0:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 32 | 
	a0 = xmem[i0]			# LN: 32 | 
	i0 = i7 - (0x4)			# LN: 32 | 
	a1 = xmem[i0]			# LN: 32 | 
	a0 = a0 + a1			# LN: 32 | 
	i0 = i7 - (0x8)			# LN: 32 | 
	xmem[i0] = a0h			# LN: 32 | 
cline_32_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 34 | 
	a0 = xmem[i0]			# LN: 34 | 
	i0 = i7 - (0x4)			# LN: 34 | 
	a1 = xmem[i0]			# LN: 34 | 
	a0 - a1			# LN: 34 | 
	if (a <= 0) jmp (else_1)			# LN: 34 | 
cline_34_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 35 | 
	i0 = xmem[i0]			# LN: 35 | 
	i1 = i7 - (0x7)			# LN: 35 | 
	i0 += 1			# LN: 35 | 
	x0 = xmem[i0]			# LN: 35 | 
	x1 = xmem[i1]			# LN: 35 | 
	a0 = x1 * x0			# LN: 35 | 
	i0 = i7 - (0x6)			# LN: 35 | 
	xmem[i0] = a0			# LN: 35 | 
cline_35_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 36 | 
	a0 = xmem[i0]			# LN: 36 | 
	i0 = i7 - (0x4)			# LN: 36 | 
	a1 = xmem[i0]			# LN: 36 | 
	a0 = a0 + a1			# LN: 36 | 
	i0 = i7 - (0x6)			# LN: 36 | 
	xmem[i0] = a0h			# LN: 36 | 
	jmp (endif_1)			# LN: 36 | 
cline_36_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 37 | 
	a0 = xmem[i0]			# LN: 37 | 
	a0 =- a0			# LN: 37 | 
	i0 = i7 - (0x6)			# LN: 37 | 
	a1 = xmem[i0]			# LN: 37 | 
	a1 - a0			# LN: 37 | 
	if (a >= 0) jmp (else_2)			# LN: 37 | 
cline_37_0:			/* LN: 38 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 38 | 
	i0 = xmem[i0]			# LN: 38 | 
	i1 = i7 - (0x8)			# LN: 38 | 
	i0 += 1			# LN: 38 | 
	x0 = xmem[i0]			# LN: 38 | 
	x1 = xmem[i1]			# LN: 38 | 
	a0 = x1 * x0			# LN: 38 | 
	i0 = i7 - (0x6)			# LN: 38 | 
	xmem[i0] = a0			# LN: 38 | 
cline_38_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 39 | 
	a0 = xmem[i0]			# LN: 39 | 
	i0 = i7 - (0x4)			# LN: 39 | 
	a1 = xmem[i0]			# LN: 39 | 
	a0 = a0 - a1			# LN: 39 | 
	i0 = i7 - (0x6)			# LN: 39 | 
	xmem[i0] = a0h			# LN: 39 | 
	jmp (endif_2)			# LN: 39 | 
cline_39_0:			/* LN: 41 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 41 | 
	a0 = xmem[i0]			# LN: 41 | 
	i0 = i7 - (0x2)			# LN: 41 | 
	a1 = xmem[i0]			# LN: 41 | 
	a0 = a1 + a0			# LN: 41 | 
	AnyReg(i0, a0h)			# LN: 41 | 
	i1 = i7 - (0x6)			# LN: 41 | 
	a0 = xmem[i1]			# LN: 41 | 
	ymem[i0] = a0h			# LN: 41 | 
cline_41_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 29 | 
	a0 = xmem[i0]			# LN: 29 | 
	uhalfword(a1) = (0x1)			# LN: 29 | 
	a0 = a0 + a1			# LN: 29 | 
	i0 = i7 - (0x5)			# LN: 29 | 
	xmem[i0] = a0h			# LN: 29 | 
	jmp (for_0)			# LN: 29 | 
cline_29_1:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 44 | 
__epilogue_106:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x8)			# LN: 44 | 
	i7 -= 1			# LN: 44 | 
	ret			# LN: 44 | 
