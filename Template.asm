TITLE Program Template     (template.asm)

; Author: Kavya Kolavasi


INCLUDE Irvine32.inc

; (insert macro definitions here)

; (insert constant definitions here)

.data

intro_1						BYTE "Welcome to Pharmacy Dosing Calculator! Here we will display the weight-based dosages of popular medications!",0
prompt_1					BYTE "Please enter the weight of the patient in kg! ",0
goodbye						BYTE "Thanks for using the program, goodbye!",0
end_user					BYTE "If you wish to continue please enter 1! Else choose 0 to quit!!! ",0
omnitrope_string			BYTE "The maximum weekly dosing for Omnitrope is: ",0
tylenol_string				BYTE "The dosing for tylenol 160mg/5ml solution is ",0
tylenol_string_2			BYTE " every 4-6 hours ",0
ibuprofen_string			BYTE "The dosing for ibuprofen 100mg/5ml solution is  ",0
ibuprofen_string_2			BYTE " every 6-8 hours",0
mg_string					BYTE " mg",0
norditropin_string			BYTE "The maximum daily dosing for Norditropin is: ",0
zomacton_string				BYTE "The maximum daily dosing for Zomacton is: ",0
weight_kg					Real4 ?
quit_result					DWORD ?
omnitrope_result			Real4 ?
norditropin_result			REAL4 ?
zomacton_result				REAL4 ?
tylenol_result				REAL4 ?
ibuprofen_result            REAL4 ?
OMNITROPE					REAL4 0.04
NORDITROPIN					REAL4 0.016
ZOMACTON					REAL4 0.0125
TYLENOL						REAL4 15.00
IBUPROFEN					REAL4 10.00



.code
main PROC

	; Introduce programmer
	mov		EDX, OFFSET intro_1
	call	WriteString
	call	CrLf
	call	CrLf

_continue_loop:

	; Prompt the user to enter the weight
	mov		EDX, OFFSET prompt_1
	call	WriteString
	call	ReadFloat
	fstp	weight_kg							; Store the weight in weight_kg
	call	CrLf


	; Calculate omnitrope dosing
	fld		weight_kg							; Load the weight into the FPU stack
	fld		OMNITROPE							; Load the OMNITROPE constant into the FPU stack
	fmul										; Multiply the weight by OMNITROPE
	fstp	omnitrope_result					; Store the result in omnitrope_result

	; Calculate Norditropin dosing
	fld		weight_kg							; Load the weight into the FPU stack
	fld		NORDITROPIN							; Load the NORDITROPIN constant into the FPU stack
	fmul										; Multiply the weight by NORDITROPIN
	fstp	norditropin_result					; Store the result in norditropin_result

	; Calculate Zomacton dosing
	fld		weight_kg							; Load the weight into the FPU stack
	fld		ZOMACTON							; Load the ZOMACTON constant into the FPU stack
	fmul										; Multiply the weight by ZOMACTON
	fstp	zomacton_result					    ; Store the result in zomacton_result	

	; Calculate Tylenol dosing
	fld		weight_kg							; Load the weight into the FPU stack
	fld		TYLENOL							    ; Load the TYLENOL constant into the FPU stack
	fmul										; Multiply the weight by TYLENOL
	fstp	tylenol_result					    ; Store the result in tylenol_result

	; Calculate Ibuprofen dosing
	fld		weight_kg							; Load the weight into the FPU stack
	fld		IBUPROFEN							; Load the IBUPROFEN constant into the FPU stack
	fmul										; Multiply the weight by IBUPROFEN	
	fstp	ibuprofen_result					; Store the result in ibuprofen_result

	; Display Omnitrope dosing
	mov		EDX, OFFSET omnitrope_string
	call	WriteString
	fld		omnitrope_result
	call	WriteFloat
	mov		EDX, OFFSET	mg_string
	call	WriteString
	call	CrLf
	call	CrLf

	; Display Norditropin dosing
	mov		EDX, OFFSET norditropin_string
	call	WriteString
	fld		norditropin_result
	call	WriteFloat
	mov		EDX, OFFSET	mg_string
	call	WriteString
	call	CrLf
	call	CrLf

	; Display Zomacton dosing
	mov		EDX, OFFSET zomacton_string
	call	WriteString
	fld		zomacton_result
	call	WriteFloat
	mov		EDX, OFFSET	mg_string
	call	WriteString
	call	CrLf
	call	CrLf

	; Display Tylenol dosing
	mov		EDX, OFFSET tylenol_string
	call	WriteString
	fld		tylenol_result
	call	WriteFloat
	mov		EDX, OFFSET	mg_string
	call	WriteString
	mov		EDX, OFFSET tylenol_string_2
	call	WriteString
	call	CrLf
	call	CrLf

	; Display Ibuprofen dosing
	mov		EDX, OFFSET ibuprofen_string
	call	WriteString
	fld		ibuprofen_result
	call	WriteFloat
	mov		EDX, OFFSET	mg_string
	call	WriteString
	mov		EDX, OFFSET ibuprofen_string_2
	call	WriteString
	call	CrLf
	call	CrLf

	; continue loop or not
	mov		EDX, OFFSET end_user
	call	WriteString
	call	CrLf
	call	ReadDec
	mov		quit_result, EAX															
	cmp		EAX, 1																		
	je		_continue_loop																
	jmp		_end_Program

_end_Program:

	; Display a closing message
	mov		EDX,OFFSET goodbye
	call	WriteString
	call	CrLf	

	Invoke ExitProcess,0					; exit to operating system
main ENDP

; (insert additional procedures here)

END main
