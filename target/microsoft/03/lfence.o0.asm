; Listing generated by Microsoft (R) Optimizing Compiler Version 19.15.26732.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	array1_size
PUBLIC	array1
PUBLIC	temp
_DATA	SEGMENT
COMM	array2:BYTE:020000H
_DATA	ENDS
_BSS	SEGMENT
temp	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
array1_size DD	010H
	ORG $+4
array1	DB	01H
	DB	02H
	DB	03H
	DB	04H
	DB	05H
	DB	06H
	DB	07H
	DB	08H
	DB	09H
	DB	0aH
	DB	0bH
	DB	0cH
	DB	0dH
	DB	0eH
	DB	0fH
	DB	010H
_DATA	ENDS
PUBLIC	leakByteNoinlineFunction
PUBLIC	victim_function_v03
pdata	SEGMENT
$pdata$victim_function_v03 DD imagerel $LN4
	DD	imagerel $LN4+51
	DD	imagerel $unwind$victim_function_v03
pdata	ENDS
xdata	SEGMENT
$unwind$victim_function_v03 DD 010901H
	DD	04209H
xdata	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
x$ = 48
victim_function_v03 PROC
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 11
$LN4:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H
; Line 12
	mov	eax, DWORD PTR array1_size
	cmp	QWORD PTR x$[rsp], rax
	jae	SHORT $LN2@victim_fun
; Line 13
	lfence
	lea	rax, OFFSET FLAT:array1
	mov	rcx, QWORD PTR x$[rsp]
	movzx	ecx, BYTE PTR [rax+rcx]
	call	leakByteNoinlineFunction
$LN2@victim_fun:
; Line 14
	add	rsp, 40					; 00000028H
	ret	0
victim_function_v03 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
k$ = 8
leakByteNoinlineFunction PROC
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 10
	mov	BYTE PTR [rsp+8], cl
	movzx	eax, BYTE PTR k$[rsp]
	imul	eax, eax, 512				; 00000200H
	cdqe
	lea	rcx, OFFSET FLAT:array2
	movzx	eax, BYTE PTR [rcx+rax]
	movzx	ecx, BYTE PTR temp
	and	ecx, eax
	mov	eax, ecx
	mov	BYTE PTR temp, al
	ret	0
leakByteNoinlineFunction ENDP
_TEXT	ENDS
END
