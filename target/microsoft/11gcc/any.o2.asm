; Listing generated by Microsoft (R) Optimizing Compiler Version 19.15.26732.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	array1_size
PUBLIC	array1
PUBLIC	temp
_DATA	SEGMENT
COMM	array2:DWORD:020000H
_DATA	ENDS
_BSS	SEGMENT
temp	DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
array1_size DD	010H
	ORG $+12
array1	DD	01H
	DD	02H
	DD	03H
	DD	04H
	DD	05H
	DD	06H
	DD	07H
	DD	08H
	DD	09H
	DD	0aH
	DD	0bH
	DD	0cH
	DD	0dH
	DD	0eH
	DD	0fH
	DD	010H
_DATA	ENDS
PUBLIC	mymemcmp
PUBLIC	victim_function_v11
EXTRN	__ImageBase:BYTE
; Function compile flags: /Ogtpy
;	COMDAT victim_function_v11
_TEXT	SEGMENT
x$ = 8
victim_function_v11 PROC				; COMDAT
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 13
	mov	eax, DWORD PTR array1_size
	cmp	rcx, rax
	jae	SHORT $LN2@victim_fun
; Line 20
	lea	r10, OFFSET FLAT:__ImageBase
; Line 14
	mov	r9d, 1
; Line 20
	mov	ecx, DWORD PTR array1[r10+rcx*4]
	lea	rax, OFFSET FLAT:temp
	shl	ecx, 9
	lea	r10, QWORD PTR array2[r10]
	movsxd	rdx, ecx
; Line 14
	mov	r8d, r9d
; Line 20
	shl	rdx, 2
	sub	rdx, rax
	add	r10, rdx
$LL5@victim_fun:
; Line 24
	movzx	ecx, BYTE PTR [rax]
	dec	r8
	movzx	edx, BYTE PTR [r10+rax]
	lea	rax, QWORD PTR [rax+1]
	cmp	cl, dl
	jne	SHORT $LN10@victim_fun
; Line 22
	test	r8, r8
	jne	SHORT $LL5@victim_fun
; Line 27
	xor	r9d, r9d
; Line 14
	mov	DWORD PTR temp, r9d
; Line 15
	ret	0
$LN10@victim_fun:
; Line 25
	cmp	cl, dl
	mov	eax, -1
	cmovb	r9d, eax
; Line 14
	mov	DWORD PTR temp, r9d
$LN2@victim_fun:
; Line 15
	ret	0
victim_function_v11 ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
;	COMDAT mymemcmp
_TEXT	SEGMENT
str1$ = 8
str2$ = 16
count$ = 24
mymemcmp PROC						; COMDAT
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 18
	mov	rax, rdx
; Line 22
	test	r8, r8
	je	SHORT $LN8@mymemcmp
; Line 20
	sub	rax, rcx
	npad	5
$LL2@mymemcmp:
; Line 24
	movzx	r9d, BYTE PTR [rcx]
	dec	r8
	movzx	edx, BYTE PTR [rax+rcx]
	lea	rcx, QWORD PTR [rcx+1]
	cmp	r9b, dl
	jne	SHORT $LN7@mymemcmp
; Line 22
	test	r8, r8
	jne	SHORT $LL2@mymemcmp
$LN8@mymemcmp:
; Line 27
	xor	eax, eax
; Line 28
	ret	0
$LN7@mymemcmp:
; Line 25
	cmp	r9b, dl
	mov	eax, 1
	mov	ecx, -1
	cmovb	eax, ecx
; Line 28
	ret	0
mymemcmp ENDP
_TEXT	ENDS
END
