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
pdata	SEGMENT
$pdata$mymemcmp DD imagerel $LN7
	DD	imagerel $LN7+138
	DD	imagerel $unwind$mymemcmp
$pdata$victim_function_v11 DD imagerel $LN4
	DD	imagerel $LN4+89
	DD	imagerel $unwind$victim_function_v11
pdata	ENDS
xdata	SEGMENT
$unwind$mymemcmp DD 011301H
	DD	02213H
$unwind$victim_function_v11 DD 010901H
	DD	04209H
xdata	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
x$ = 48
victim_function_v11 PROC
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 12
$LN4:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H
; Line 13
	mov	eax, DWORD PTR array1_size
	cmp	QWORD PTR x$[rsp], rax
	jae	SHORT $LN2@victim_fun
; Line 14
	lfence
	lea	rax, OFFSET FLAT:array1
	mov	rcx, QWORD PTR x$[rsp]
	imul	eax, DWORD PTR [rax+rcx*4], 512		; 00000200H
	cdqe
	lea	rcx, OFFSET FLAT:array2
	lea	rax, QWORD PTR [rcx+rax*4]
	mov	r8d, 1
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:temp
	call	mymemcmp
	mov	DWORD PTR temp, eax
$LN2@victim_fun:
; Line 15
	add	rsp, 40					; 00000028H
	ret	0
victim_function_v11 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
s1$ = 0
s2$ = 8
str1$ = 32
str2$ = 40
count$ = 48
mymemcmp PROC
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 18
$LN7:
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24
; Line 19
	mov	rax, QWORD PTR str1$[rsp]
	mov	QWORD PTR s1$[rsp], rax
; Line 20
	mov	rax, QWORD PTR str2$[rsp]
	mov	QWORD PTR s2$[rsp], rax
; Line 21
	cmp	QWORD PTR count$[rsp], 0
	jne	SHORT $LN4@mymemcmp
	xor	eax, eax
	jmp	SHORT $LN1@mymemcmp
$LN4@mymemcmp:
$LN2@mymemcmp:
; Line 22
	mov	rax, QWORD PTR count$[rsp]
	dec	rax
	mov	QWORD PTR count$[rsp], rax
	cmp	QWORD PTR count$[rsp], 0
	je	SHORT $LN3@mymemcmp
	mov	rax, QWORD PTR s1$[rsp]
	movzx	eax, BYTE PTR [rax]
	mov	rcx, QWORD PTR s2$[rsp]
	movzx	ecx, BYTE PTR [rcx]
	cmp	eax, ecx
	jne	SHORT $LN3@mymemcmp
; Line 23
	mov	rax, QWORD PTR s1$[rsp]
	inc	rax
	mov	QWORD PTR s1$[rsp], rax
; Line 24
	mov	rax, QWORD PTR s2$[rsp]
	inc	rax
	mov	QWORD PTR s2$[rsp], rax
; Line 25
	jmp	SHORT $LN2@mymemcmp
$LN3@mymemcmp:
; Line 26
	mov	rax, QWORD PTR s1$[rsp]
	movzx	eax, BYTE PTR [rax]
	mov	rcx, QWORD PTR s2$[rsp]
	movzx	ecx, BYTE PTR [rcx]
	sub	eax, ecx
$LN1@mymemcmp:
; Line 27
	add	rsp, 24
	ret	0
mymemcmp ENDP
_TEXT	ENDS
END
