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
PUBLIC	victim_function_v10
; Function compile flags: /Odtp
_TEXT	SEGMENT
x$ = 8
k$ = 16
victim_function_v10 PROC
; File c:\users\ekans\appdata\local\temp\spect.c
; Line 10
	mov	BYTE PTR [rsp+16], dl
	mov	QWORD PTR [rsp+8], rcx
; Line 11
	mov	eax, DWORD PTR array1_size
	cmp	QWORD PTR x$[rsp], rax
	jae	SHORT $LN2@victim_fun
; Line 12
	lea	rax, OFFSET FLAT:array1
	mov	rcx, QWORD PTR x$[rsp]
	movzx	eax, BYTE PTR [rax+rcx]
	movzx	ecx, BYTE PTR k$[rsp]
	cmp	eax, ecx
	jne	SHORT $LN3@victim_fun
; Line 13
	mov	eax, 1
	imul	rax, rax, 0
	lea	rcx, OFFSET FLAT:array2
	movzx	eax, BYTE PTR [rcx+rax]
	movzx	ecx, BYTE PTR temp
	and	ecx, eax
	mov	eax, ecx
	mov	BYTE PTR temp, al
$LN3@victim_fun:
$LN2@victim_fun:
; Line 15
	ret	0
victim_function_v10 ENDP
_TEXT	ENDS
END
