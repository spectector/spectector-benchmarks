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
PUBLIC	leakByteLocalFunction
PUBLIC	victim_function_v02
EXTRN	__ImageBase:BYTE
; Function compile flags: /Ogtpy
;	COMDAT victim_function_v02
_TEXT	SEGMENT
x$ = 8
victim_function_v02 PROC				; COMDAT
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 12
	mov	eax, DWORD PTR array1_size
	cmp	rcx, rax
	jae	SHORT $LN4@victim_fun
; Line 13
	lfence
	lea	rdx, OFFSET FLAT:__ImageBase
; Line 10
	movzx	eax, BYTE PTR array1[rdx+rcx]
	shl	rax, 9
	movzx	eax, BYTE PTR array2[rax+rdx]
	and	BYTE PTR temp, al
$LN4@victim_fun:
; Line 15
	ret	0
victim_function_v02 ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
;	COMDAT leakByteLocalFunction
_TEXT	SEGMENT
k$ = 8
leakByteLocalFunction PROC				; COMDAT
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 10
	movzx	ecx, cl
	lea	rax, OFFSET FLAT:array2
	shl	ecx, 9
	movzx	eax, BYTE PTR [rcx+rax]
	and	BYTE PTR temp, al
	ret	0
leakByteLocalFunction ENDP
_TEXT	ENDS
END
