	.public _characteristics
	.public _inputGain
	.public _mode
	.public _modeGain
	.public _output_mode
	.public _ratio
	.public _sampleBuffer
	.public _threshold
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
	.public _main
	.extern _memset
	.extern _printf
	.public _processing
	.extern _strcpy
	.extern __div
	.extern __mul_sat_laccum
	.xdata_ovly
__extractedConst_0_1
	.dw  (0x7fffffff)
	.xdata_ovly
_characteristics
	.dw  (0x0)
	.xdata_ovly
_inputGain
	.dw  (0x40000000)
	.xdata_ovly
_mode
	.dw  (0x0)
	.xdata_ovly
_modeGain
	.dw  (0x0)
	.dw  (0x147ae147)
	.dw  (0xae147ae1)
	.dw  (0x0)
	.dw  (0x40000000)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0xe3d70a3d)
	.dw  (0x70a3d70a)
	.dw  (0x0)
	.dw  (0xb47ae147)
	.dw  (0xae147ae1)
	.xdata_ovly
_output_mode
	.dw  (0x2)
	.dw  (0x0)
	.dw  (0x1)
	.xdata_ovly
_ratio
	.dw  (0x6666666)
	.xdata_ovly
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
	.xdata_ovly
_threshold
	.dw  (0x26666666)
	.code_ovly



_gst_audio_dynamic_transform_compressor_float:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 34 | 
	i7 += 1			# LN: 34 | 
	i7 = i7 + (0x3)			# LN: 34 | 
cline_34_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 40 | 
	uhalfword(a0) = (_sampleBuffer + 80)			# LN: 40 | 
	xmem[i0] = a0			# LN: 40 | 
cline_40_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_ratio + 0]			# LN: 43 | 
	a1 = xmem[__extractedConst_0_1 + 0]			# LN: 43 | 
	a0 - a1			# LN: 43 | 
	if (a != 0) jmp (else_0)			# LN: 43 | 
cline_43_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_220)			# LN: 44 | 
cline_44_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_characteristics + 0]			# LN: 46 | 
	a0 & a0			# LN: 46 | 
	if (a != 0) jmp (else_1)			# LN: 46 | 
cline_46_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 48 | 
	a0 = 0			# LN: 48 | 
	xmem[i0] = a0h			# LN: 48 | 
	do (0x10), label_end_92			# LN: 48 | 
cline_48_0:			/* LN: 50 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 50 | 
	i0 = xmem[i0]			# LN: 50 | 
	i1 = i7 - (0x3)			# LN: 50 | 
	a0 = xmem[i0]			# LN: 50 | 
	xmem[i1] = a0h			# LN: 50 | 
cline_50_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 52 | 
	a0 = xmem[i0]			# LN: 52 | 
	a1 = xmem[_threshold + 0]			# LN: 52 | 
	a0 - a1			# LN: 52 | 
	if (a <= 0) jmp (else_2)			# LN: 52 | 
cline_52_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 53 | 
	a0 = xmem[i0]			# LN: 53 | 
	a1 = xmem[_threshold + 0]			# LN: 53 | 
	a0 = a0 - a1			# LN: 53 | 
	x0 = xmem[_ratio + 0]			# LN: 53 | 
	a1 = xmem[_threshold + 0]			# LN: 53 | 
	x1 = a0h; a0 =+ a1			# LN: 53, 53 | 
	a0 += x1 * x0			# LN: 53 | 
	i0 = i7 - (0x3)			# LN: 53 | 
	xmem[i0] = a0			# LN: 53 | 
	jmp (endif_2)			# LN: 53 | 
cline_53_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_threshold + 0]			# LN: 55 | 
	a0 =- a0			# LN: 55 | 
	i0 = i7 - (0x3)			# LN: 55 | 
	a1 = xmem[i0]			# LN: 55 | 
	a1 - a0			# LN: 55 | 
	if (a >= 0) jmp (else_3)			# LN: 55 | 
cline_55_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 56 | 
	a0 = xmem[i0]			# LN: 56 | 
	a1 = xmem[_threshold + 0]			# LN: 56 | 
	a0 = a0 + a1			# LN: 56 | 
	x0 = a0h			# LN: 56 | 
	x1 = xmem[_ratio + 0]			# LN: 56 | 
	a0 = x0 * x1			# LN: 56 | 
	a1 = xmem[_threshold + 0]			# LN: 56 | 
	a0 = a0 - a1			# LN: 56 | 
	i0 = i7 - (0x3)			# LN: 56 | 
	xmem[i0] = a0			# LN: 56 | 
	jmp (endif_3)			# LN: 56 | 
cline_56_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 58 | 
	i1 = i7 - (0x1)			# LN: 58 | 
	i1 = xmem[i1]			# LN: 58 | 
	a0 = xmem[i0]			# LN: 58 | 
	xmem[i1] = a0h			# LN: 58 | 
cline_58_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 59 | 
	i0 = xmem[i0]			# LN: 59 | 
	i1 = i7 - (0x1)			# LN: 59 | 
	i0 += 1			# LN: 59 | 
	xmem[i1] = i0			# LN: 59 | 
cline_59_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 48 | 
	a0 = xmem[i0]			# LN: 48 | 
	uhalfword(a1) = (0x1)			# LN: 48 | 
	a0 = a0 + a1			# LN: 48 | 
	i0 = i7 - (0x2)			# LN: 48 | 
label_end_92:			# LN: 48 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 48 | 
for_end_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	jmp (endif_1)			# LN: 48 | 
cline_48_1:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_220)			# LN: 62 | 
__epilogue_220:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x3)			# LN: 62 | 
	i7 -= 1			# LN: 62 | 
	ret			# LN: 62 | 



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

_main:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 152 | 
	i7 += 1			# LN: 152 | 
	i7 = i7 + (0x20e)			# LN: 152 | 
	i1 = i7 - (0x1)			# LN: 152 | 
	xmem[i1] = a0h			# LN: 152 | 
	i1 = i7 - (0x2)			# LN: 152 | 
	xmem[i1] = i0			# LN: 152 | 
cline_152_0:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 165 | 
	uhalfword(a0) = (0x8)			# LN: 165 | 
	xmem[i0] = a0h			# LN: 165 | 
cline_165_0:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 168 | 
	a0 = 0			# LN: 168 | 
	xmem[i0] = a0h			# LN: 168 | 
	do (0x8), label_end_97			# LN: 168 | 
cline_168_0:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
label_begin_97:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 169 | 
	a1 = xmem[i0]; a0 = 0			# LN: 169, 169 | 
	a1 = a1 << 4			# LN: 169 | 
	i0 = a1			# LN: 169 | 
	uhalfword(a1) = (0x10)			# LN: 169 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 169 | 
	call (_memset)			# LN: 169 | 
cline_169_0:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 168 | 
	a0 = xmem[i0]			# LN: 168 | 
	uhalfword(a1) = (0x1)			# LN: 168 | 
	a0 = a0 + a1			# LN: 168 | 
	i0 = i7 - (0x4)			# LN: 168 | 
label_end_97:			# LN: 168 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 168 | 
cline_168_1:			/* LN: 173 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 173 | 
	i0 = xmem[i0]			# LN: 173 | 
	i1 = i7 - (260 - 0)			# LN: 173 | 
	i4 = xmem[i0]			# LN: 173 | 
	i0 = i1			# LN: 173 | 
	i1 = i4			# LN: 173 | 
	call (_strcpy)			# LN: 173 | 
cline_173_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (260 - 0)			# LN: 174 | 
	call (_cl_wavread_open)			# LN: 174 | 
	AnyReg(i0, a0h)			# LN: 174 | 
	i1 = i7 - (0x105)			# LN: 174 | 
	xmem[i1] = i0			# LN: 174 | 
cline_174_0:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 175 | 
	a0 = xmem[i0]			# LN: 175 | 
	a0 & a0			# LN: 175 | 
	if (a != 0) jmp (else_5)			# LN: 175 | 
cline_175_0:			/* LN: 177 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 177 | 
	call (_printf)			# LN: 177 | 
cline_177_0:			/* LN: 178 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 178 | 
	jmp (__epilogue_224)			# LN: 178 | 
cline_178_0:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 184 | 
	i0 = xmem[i0]			# LN: 184 | 
	call (_cl_wavread_getnchannels)			# LN: 184 | 
	i0 = i7 - (0x106)			# LN: 184 | 
	xmem[i0] = a0h			# LN: 184 | 
cline_184_0:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 185 | 
	i0 = xmem[i0]			# LN: 185 | 
	call (_cl_wavread_bits_per_sample)			# LN: 185 | 
	i0 = i7 - (0x107)			# LN: 185 | 
	xmem[i0] = a0h			# LN: 185 | 
cline_185_0:			/* LN: 186 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 186 | 
	i0 = xmem[i0]			# LN: 186 | 
	call (_cl_wavread_frame_rate)			# LN: 186 | 
	i0 = i7 - (0x108)			# LN: 186 | 
	xmem[i0] = a0h			# LN: 186 | 
cline_186_0:			/* LN: 187 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 187 | 
	i0 = xmem[i0]			# LN: 187 | 
	call (_cl_wavread_number_of_frames)			# LN: 187 | 
	i0 = i7 - (0x109)			# LN: 187 | 
	xmem[i0] = a0h			# LN: 187 | 
cline_187_0:			/* LN: 192 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 192 | 
	i0 = xmem[i0]			# LN: 192 | 
	i1 = i7 - (521 - 0)			# LN: 192 | 
	i0 += 1			# LN: 192 | 
	i4 = xmem[i0]			# LN: 192 | 
	i0 = i1			# LN: 192 | 
	i1 = i4			# LN: 192 | 
	call (_strcpy)			# LN: 192 | 
cline_192_0:			/* LN: 193 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (521 - 0)			# LN: 193 | 
	i1 = i7 - (0x107)			# LN: 193 | 
	a0 = xmem[i1]			# LN: 193 | 
	i1 = i7 - (0x3)			# LN: 193 | 
	a1 = xmem[i1]			# LN: 193 | 
	i1 = i7 - (0x108)			# LN: 193 | 
	b0 = xmem[i1]			# LN: 193 | 
	call (_cl_wavwrite_open)			# LN: 193 | 
	AnyReg(i0, a0h)			# LN: 193 | 
	i1 = i7 - (0x20a)			# LN: 193 | 
	xmem[i1] = i0			# LN: 193 | 
cline_193_0:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 194 | 
	a0 = xmem[i0]			# LN: 194 | 
	a0 & a0			# LN: 194 | 
	if (a != 0) jmp (else_6)			# LN: 194 | 
cline_194_0:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 196 | 
	call (_printf)			# LN: 196 | 
cline_196_0:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 197 | 
	jmp (__epilogue_224)			# LN: 197 | 
cline_197_0:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
endif_6:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
else_6:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 210 | 
	a0 = 0			# LN: 210 | 
	xmem[i0] = a0h			# LN: 210 | 
for_6:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 210 | 
	a0 = xmem[i0]			# LN: 210 | 
	uhalfword(a1) = (0x10)			# LN: 210 | 
	call (__div)			# LN: 210 | 
	i0 = i7 - (0x20b)			# LN: 210 | 
	a1 = xmem[i0]			# LN: 210 | 
	a1 - a0			# LN: 210 | 
	if (a >= 0) jmp (for_end_6)			# LN: 210 | 
cline_210_0:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 212 | 
	a0 = 0			# LN: 212 | 
	xmem[i0] = a0h			# LN: 212 | 
	do (0x10), label_end_98			# LN: 212 | 
cline_212_0:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
label_begin_98:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 214 | 
	a0 = 0			# LN: 214 | 
	xmem[i0] = a0h			# LN: 214 | 
for_8:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 214 | 
	a0 = xmem[i0]			# LN: 214 | 
	i0 = i7 - (0x106)			# LN: 214 | 
	a1 = xmem[i0]			# LN: 214 | 
	a0 - a1			# LN: 214 | 
	if (a >= 0) jmp (for_end_8)			# LN: 214 | 
cline_214_0:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 216 | 
	i0 = xmem[i0]			# LN: 216 | 
	call (_cl_wavread_recvsample)			# LN: 216 | 
	i0 = i7 - (0x20e)			# LN: 216 | 
	xmem[i0] = a0h			# LN: 216 | 
cline_216_0:			/* LN: 217 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 217 | 
	a0 = xmem[i0]			# LN: 217 | 
	a0 = a0 << 4			# LN: 217 | 
	i0 = a0			# LN: 217 | 
	i1 = i7 - (0x20c)			# LN: 217 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 217 | 
	a0 = xmem[i1]			# LN: 217 | 
	a1 = i0			# LN: 217 | 
	a0 = a1 + a0			# LN: 217 | 
	AnyReg(i0, a0h)			# LN: 217 | 
	i1 = i7 - (0x20e)			# LN: 217 | 
	a0 = xmem[i1]			# LN: 217 | 
	xmem[i0] = a0h			# LN: 217 | 
cline_217_0:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 214 | 
	a0 = xmem[i0]			# LN: 214 | 
	uhalfword(a1) = (0x1)			# LN: 214 | 
	a0 = a0 + a1			# LN: 214 | 
	i0 = i7 - (0x20d)			# LN: 214 | 
	xmem[i0] = a0h			# LN: 214 | 
	jmp (for_8)			# LN: 214 | 
cline_214_1:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
init_latch_label_7:			/* LN: 219 | CYCLE: 0 | RULES: () */ 
for_end_8:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 212 | 
	a0 = xmem[i0]			# LN: 212 | 
	uhalfword(a1) = (0x1)			# LN: 212 | 
	a0 = a0 + a1			# LN: 212 | 
	i0 = i7 - (0x20c)			# LN: 212 | 
label_end_98:			# LN: 212 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 212 | 
cline_212_1:			/* LN: 221 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	call (_processing)			# LN: 221 | 
cline_221_0:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 223 | 
	a0 = 0			# LN: 223 | 
	xmem[i0] = a0h			# LN: 223 | 
	do (0x10), label_end_99			# LN: 223 | 
cline_223_0:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
label_begin_99:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 225 | 
	a0 = 0			# LN: 225 | 
	xmem[i0] = a0h			# LN: 225 | 
for_10:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 225 | 
	a0 = xmem[i0]			# LN: 225 | 
	i0 = i7 - (0x3)			# LN: 225 | 
	a1 = xmem[i0]			# LN: 225 | 
	a0 - a1			# LN: 225 | 
	if (a >= 0) jmp (for_end_10)			# LN: 225 | 
cline_225_0:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 227 | 
	a0 = xmem[i0]			# LN: 227 | 
	a0 = a0 << 4			# LN: 227 | 
	i0 = a0			# LN: 227 | 
	i1 = i7 - (0x20c)			# LN: 227 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 227 | 
	a0 = xmem[i1]			# LN: 227 | 
	a1 = i0			# LN: 227 | 
	a0 = a1 + a0			# LN: 227 | 
	AnyReg(i0, a0h)			# LN: 227 | 
	i1 = i7 - (0x20e)			# LN: 227 | 
	a0 = xmem[i0]			# LN: 227 | 
	xmem[i1] = a0h			# LN: 227 | 
cline_227_0:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 228 | 
	i1 = i7 - (0x20e)			# LN: 228 | 
	a0 = xmem[i1]			# LN: 228 | 
	i0 = xmem[i0]			# LN: 228 | 
	call (_cl_wavwrite_sendsample)			# LN: 228 | 
cline_228_0:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
init_latch_label_8:			/* LN: 229 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 225 | 
	a0 = xmem[i0]			# LN: 225 | 
	uhalfword(a1) = (0x1)			# LN: 225 | 
	a0 = a0 + a1			# LN: 225 | 
	i0 = i7 - (0x20d)			# LN: 225 | 
	xmem[i0] = a0h			# LN: 225 | 
	jmp (for_10)			# LN: 225 | 
cline_225_1:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
init_latch_label_9:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
for_end_10:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 223 | 
	a0 = xmem[i0]			# LN: 223 | 
	uhalfword(a1) = (0x1)			# LN: 223 | 
	a0 = a0 + a1			# LN: 223 | 
	i0 = i7 - (0x20c)			# LN: 223 | 
label_end_99:			# LN: 223 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 223 | 
cline_223_1:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
init_latch_label_10:			/* LN: 231 | CYCLE: 0 | RULES: () */ 
for_end_9:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 210 | 
	a0 = xmem[i0]			# LN: 210 | 
	uhalfword(a1) = (0x1)			# LN: 210 | 
	a0 = a0 + a1			# LN: 210 | 
	i0 = i7 - (0x20b)			# LN: 210 | 
	xmem[i0] = a0h			# LN: 210 | 
	jmp (for_6)			# LN: 210 | 
cline_210_1:			/* LN: 236 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 236 | 
	i0 = xmem[i0]			# LN: 236 | 
	call (_cl_wavread_close)			# LN: 236 | 
cline_236_0:			/* LN: 237 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 237 | 
	i0 = xmem[i0]			# LN: 237 | 
	call (_cl_wavwrite_close)			# LN: 237 | 
cline_237_0:			/* LN: 240 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 240 | 
	jmp (__epilogue_224)			# LN: 240 | 
cline_240_0:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
__epilogue_224:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20e)			# LN: 241 | 
	i7 -= 1			# LN: 241 | 
	ret			# LN: 241 | 



_processing:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 65 | 
	i7 += 1			# LN: 65 | 
	i7 = i7 + (0xc)			# LN: 65 | 
cline_65_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 76 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 76 | 
	xmem[i0] = a0			# LN: 76 | 
cline_76_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 77 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 77 | 
	xmem[i0] = a0			# LN: 77 | 
cline_77_0:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 78 | 
	uhalfword(a0) = (_sampleBuffer + 80)			# LN: 78 | 
	xmem[i0] = a0			# LN: 78 | 
cline_78_0:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 80 | 
	a0 = 0			# LN: 80 | 
	xmem[i0] = a0h			# LN: 80 | 
	do (0x10), label_end_93			# LN: 80 | 
cline_80_0:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 82 | 
	i0 = xmem[i0]			# LN: 82 | 
	x0 = xmem[_inputGain + 0]			# LN: 82 | 
	x1 = xmem[i0]			# LN: 82 | 
	i0 = i7 - (0x1)			# LN: 82 | 
	i0 = xmem[i0]			# LN: 82 | 
	a0 = x1 * x0			# LN: 82 | 
	xmem[i0] = a0			# LN: 82 | 
cline_82_0:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 83 | 
	i0 = xmem[i0]			# LN: 83 | 
	x0 = xmem[_inputGain + 0]			# LN: 83 | 
	x1 = xmem[i0]			# LN: 83 | 
	i0 = i7 - (0x2)			# LN: 83 | 
	i0 = xmem[i0]			# LN: 83 | 
	a0 = x1 * x0			# LN: 83 | 
	xmem[i0] = a0			# LN: 83 | 
cline_83_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 84 | 
	i0 = xmem[i0]			# LN: 84 | 
	i1 = i7 - (0x3)			# LN: 84 | 
	i1 = xmem[i1]			# LN: 84 | 
	a0 = xmem[i0]			# LN: 84 | 
	xmem[i1] = a0h			# LN: 84 | 
cline_84_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 86 | 
	i0 = xmem[i0]			# LN: 86 | 
	i1 = i7 - (0x1)			# LN: 86 | 
	i0 += 1			# LN: 86 | 
	xmem[i1] = i0			# LN: 86 | 
cline_86_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 87 | 
	i0 = xmem[i0]			# LN: 87 | 
	i1 = i7 - (0x2)			# LN: 87 | 
	i0 += 1			# LN: 87 | 
	xmem[i1] = i0			# LN: 87 | 
cline_87_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 88 | 
	i0 = xmem[i0]			# LN: 88 | 
	i1 = i7 - (0x3)			# LN: 88 | 
	i0 += 1			# LN: 88 | 
	xmem[i1] = i0			# LN: 88 | 
cline_88_0:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 80 | 
	a0 = xmem[i0]			# LN: 80 | 
	uhalfword(a1) = (0x1)			# LN: 80 | 
	a0 = a0 + a1			# LN: 80 | 
	i0 = i7 - (0x4)			# LN: 80 | 
label_end_93:			# LN: 80 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 80 | 
cline_80_1:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
	call (_gst_audio_dynamic_transform_compressor_float)			# LN: 91 | 
cline_91_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 95 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 95 | 
	xmem[i0] = a0			# LN: 95 | 
cline_95_0:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 96 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 96 | 
	xmem[i0] = a0			# LN: 96 | 
cline_96_0:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 97 | 
	uhalfword(a0) = (_sampleBuffer + 80)			# LN: 97 | 
	xmem[i0] = a0			# LN: 97 | 
cline_97_0:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mode + 0]			# LN: 99 | 
	a0 & a0			# LN: 99 | 
	if (a != 0) jmp (else_4)			# LN: 99 | 
cline_99_0:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 101 | 
	a0 = 0			# LN: 101 | 
	xmem[i0] = a0h			# LN: 101 | 
	do (0x10), label_end_94			# LN: 101 | 
cline_101_0:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 103 | 
	i0 = xmem[i0]			# LN: 103 | 
	a1g = xmem[_modeGain + 0]			# LN: 103 | 
	a0 = xmem[i0]			# LN: 103 | 
	a1h = xmem[_modeGain + 1]			# LN: 103 | 
	a1l = xmem[_modeGain + 2]			# LN: 103 | 
	call (__mul_sat_laccum)			# LN: 103 | 
	i0 = i7 - (0x8)			# LN: 103 | 
	xmem[i0] = a0g; i0 += 1			# LN: 103, 103 | 
	xmem[i0] = a0h; i0 += 1			# LN: 103, 103 | 
	xmem[i0] = a0l			# LN: 103 | 
cline_103_0:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 104 | 
	i0 = xmem[i0]			# LN: 104 | 
	a1g = xmem[_modeGain + 6]			# LN: 104 | 
	a0 = xmem[i0]			# LN: 104 | 
	a1h = xmem[_modeGain + 7]			# LN: 104 | 
	a1l = xmem[_modeGain + 8]			# LN: 104 | 
	call (__mul_sat_laccum)			# LN: 104 | 
	i0 = i7 - (0xb)			# LN: 104 | 
	xmem[i0] = a0g; i0 += 1			# LN: 104, 104 | 
	xmem[i0] = a0h; i0 += 1			# LN: 104, 104 | 
	xmem[i0] = a0l			# LN: 104 | 
cline_104_0:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 106 | 
	a0g = xmem[i0]; i0 += 1			# LN: 106, 106 | 
	a0h = xmem[i0]; i0 += 1			# LN: 106, 106 | 
	i1 = i7 - (0x5)			# LN: 106 | 
	i1 = xmem[i1]			# LN: 106 | 
	a0l = xmem[i0]			# LN: 106 | 
	xmem[i1] = a0			# LN: 106 | 
cline_106_0:			/* LN: 107 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xb)			# LN: 107 | 
	a0g = xmem[i0]; i0 += 1			# LN: 107, 107 | 
	a0h = xmem[i0]; i0 += 1			# LN: 107, 107 | 
	i1 = i7 - (0x3)			# LN: 107 | 
	i1 = xmem[i1]			# LN: 107 | 
	a0l = xmem[i0]			# LN: 107 | 
	xmem[i1] = a0			# LN: 107 | 
cline_107_0:			/* LN: 109 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 109 | 
	i0 = xmem[i0]			# LN: 109 | 
	i1 = i7 - (0x1)			# LN: 109 | 
	i0 += 1			# LN: 109 | 
	xmem[i1] = i0			# LN: 109 | 
cline_109_0:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 110 | 
	i0 = xmem[i0]			# LN: 110 | 
	i1 = i7 - (0x5)			# LN: 110 | 
	i0 += 1			# LN: 110 | 
	xmem[i1] = i0			# LN: 110 | 
cline_110_0:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 111 | 
	i0 = xmem[i0]			# LN: 111 | 
	i1 = i7 - (0x3)			# LN: 111 | 
	i0 += 1			# LN: 111 | 
	xmem[i1] = i0			# LN: 111 | 
cline_111_0:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 101 | 
	a0 = xmem[i0]			# LN: 101 | 
	uhalfword(a1) = (0x1)			# LN: 101 | 
	a0 = a0 + a1			# LN: 101 | 
	i0 = i7 - (0x4)			# LN: 101 | 
label_end_94:			# LN: 101 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 101 | 
for_end_2:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	jmp (endif_4)			# LN: 101 | 
cline_101_1:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 116 | 
	a0 = 0			# LN: 116 | 
	xmem[i0] = a0h			# LN: 116 | 
	do (0x10), label_end_95			# LN: 116 | 
cline_116_0:			/* LN: 118 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 118 | 
	i0 = xmem[i0]			# LN: 118 | 
	a1g = xmem[_modeGain + 3]			# LN: 118 | 
	a0 = xmem[i0]			# LN: 118 | 
	a1h = xmem[_modeGain + 4]			# LN: 118 | 
	a1l = xmem[_modeGain + 5]			# LN: 118 | 
	call (__mul_sat_laccum)			# LN: 118 | 
	i0 = i7 - (0x8)			# LN: 118 | 
	xmem[i0] = a0g; i0 += 1			# LN: 118, 118 | 
	xmem[i0] = a0h; i0 += 1			# LN: 118, 118 | 
	xmem[i0] = a0l			# LN: 118 | 
cline_118_0:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 119 | 
	i0 = xmem[i0]			# LN: 119 | 
	a1g = xmem[_modeGain + 9]			# LN: 119 | 
	a0 = xmem[i0]			# LN: 119 | 
	a1h = xmem[_modeGain + 10]			# LN: 119 | 
	a1l = xmem[_modeGain + 11]			# LN: 119 | 
	call (__mul_sat_laccum)			# LN: 119 | 
	i0 = i7 - (0xb)			# LN: 119 | 
	xmem[i0] = a0g; i0 += 1			# LN: 119, 119 | 
	xmem[i0] = a0h; i0 += 1			# LN: 119, 119 | 
	xmem[i0] = a0l			# LN: 119 | 
cline_119_0:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 121 | 
	a0g = xmem[i0]; i0 += 1			# LN: 121, 121 | 
	a0h = xmem[i0]; i0 += 1			# LN: 121, 121 | 
	i1 = i7 - (0x5)			# LN: 121 | 
	i1 = xmem[i1]			# LN: 121 | 
	a0l = xmem[i0]			# LN: 121 | 
	xmem[i1] = a0			# LN: 121 | 
cline_121_0:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xb)			# LN: 122 | 
	a0g = xmem[i0]; i0 += 1			# LN: 122, 122 | 
	a0h = xmem[i0]; i0 += 1			# LN: 122, 122 | 
	i1 = i7 - (0x3)			# LN: 122 | 
	i1 = xmem[i1]			# LN: 122 | 
	a0l = xmem[i0]			# LN: 122 | 
	xmem[i1] = a0			# LN: 122 | 
cline_122_0:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 124 | 
	i0 = xmem[i0]			# LN: 124 | 
	i1 = i7 - (0x1)			# LN: 124 | 
	i0 += 1			# LN: 124 | 
	xmem[i1] = i0			# LN: 124 | 
cline_124_0:			/* LN: 125 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 125 | 
	i0 = xmem[i0]			# LN: 125 | 
	i1 = i7 - (0x5)			# LN: 125 | 
	i0 += 1			# LN: 125 | 
	xmem[i1] = i0			# LN: 125 | 
cline_125_0:			/* LN: 126 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 126 | 
	i0 = xmem[i0]			# LN: 126 | 
	i1 = i7 - (0x3)			# LN: 126 | 
	i0 += 1			# LN: 126 | 
	xmem[i1] = i0			# LN: 126 | 
cline_126_0:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 116 | 
	a0 = xmem[i0]			# LN: 116 | 
	uhalfword(a1) = (0x1)			# LN: 116 | 
	a0 = a0 + a1			# LN: 116 | 
	i0 = i7 - (0x4)			# LN: 116 | 
label_end_95:			# LN: 116 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 116 | 
cline_116_1:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 132 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 132 | 
	xmem[i0] = a0			# LN: 132 | 
cline_132_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 133 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 133 | 
	xmem[i0] = a0			# LN: 133 | 
cline_133_0:			/* LN: 134 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 134 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 134 | 
	xmem[i0] = a0			# LN: 134 | 
cline_134_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xc)			# LN: 135 | 
	uhalfword(a0) = (_sampleBuffer + 64)			# LN: 135 | 
	xmem[i0] = a0			# LN: 135 | 
cline_135_0:			/* LN: 136 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 136 | 
	uhalfword(a0) = (_sampleBuffer + 80)			# LN: 136 | 
	xmem[i0] = a0			# LN: 136 | 
cline_136_0:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 138 | 
	a0 = 0			# LN: 138 | 
	xmem[i0] = a0h			# LN: 138 | 
	do (0x10), label_end_96			# LN: 138 | 
cline_138_0:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 140 | 
	i0 = xmem[i0]			# LN: 140 | 
	i1 = i7 - (0x1)			# LN: 140 | 
	a0 = xmem[i0]			# LN: 140 | 
	i0 = xmem[i1]			# LN: 140 | 
	i1 = i7 - (0x3)			# LN: 140 | 
	i1 = xmem[i1]			# LN: 140 | 
	a1 = xmem[i0]			# LN: 140 | 
	a1 = xmem[i1]; a0 = a0 + a1			# LN: 140, 140 | 
	i0 = i7 - (0x1)			# LN: 140 | 
	i0 = xmem[i0]			# LN: 140 | 
	a0 = a0 + a1			# LN: 140 | 
	xmem[i0] = a0h			# LN: 140 | 
cline_140_0:			/* LN: 141 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 141 | 
	i0 = xmem[i0]			# LN: 141 | 
	x0 = (0x8000)			# LN: 141 | 
	x1 = xmem[i0]			# LN: 141 | 
	i0 = i7 - (0xc)			# LN: 141 | 
	i0 = xmem[i0]			# LN: 141 | 
	a0 = x1 * x0			# LN: 141 | 
	xmem[i0] = a0			# LN: 141 | 
cline_141_0:			/* LN: 143 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 143 | 
	i0 = xmem[i0]			# LN: 143 | 
	i1 = i7 - (0x1)			# LN: 143 | 
	i0 += 1			# LN: 143 | 
	xmem[i1] = i0			# LN: 143 | 
cline_143_0:			/* LN: 144 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 144 | 
	i0 = xmem[i0]			# LN: 144 | 
	i1 = i7 - (0x2)			# LN: 144 | 
	i0 += 1			# LN: 144 | 
	xmem[i1] = i0			# LN: 144 | 
cline_144_0:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 145 | 
	i0 = xmem[i0]			# LN: 145 | 
	i1 = i7 - (0x5)			# LN: 145 | 
	i0 += 1			# LN: 145 | 
	xmem[i1] = i0			# LN: 145 | 
cline_145_0:			/* LN: 146 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xc)			# LN: 146 | 
	i0 = xmem[i0]			# LN: 146 | 
	i1 = i7 - (0xc)			# LN: 146 | 
	i0 += 1			# LN: 146 | 
	xmem[i1] = i0			# LN: 146 | 
cline_146_0:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 147 | 
	i0 = xmem[i0]			# LN: 147 | 
	i1 = i7 - (0x3)			# LN: 147 | 
	i0 += 1			# LN: 147 | 
	xmem[i1] = i0			# LN: 147 | 
cline_147_0:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 138 | 
	a0 = xmem[i0]			# LN: 138 | 
	uhalfword(a1) = (0x1)			# LN: 138 | 
	a0 = a0 + a1			# LN: 138 | 
	i0 = i7 - (0x4)			# LN: 138 | 
label_end_96:			# LN: 138 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 138 | 
cline_138_1:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_222)			# LN: 149 | 
__epilogue_222:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0xc)			# LN: 149 | 
	i7 -= 1			# LN: 149 | 
	ret			# LN: 149 | 
