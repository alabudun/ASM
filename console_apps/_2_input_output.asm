.386
.model flat, stdcall
option casemap:none

include c:\masm32\include\windows.inc
include c:\masm32\include\kernel32.inc
include c:\masm32\include\user32.inc
include c:\masm32\include\masm32.inc

includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\masm32.lib

.const
_mem_limit equ 256

.data
var__string db "Your input is: %d, endless cycle initiated...", 0
var__int dd 0

.data?
_mem_alloc db _mem_limit dup(?)
_ConInp dd ?
_CI_len dd ?
_ConOut dd ?
_CO_len dd ?

.code
void_main:
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	MOV _ConOut, EAX

	invoke GetStdHandle, STD_INPUT_HANDLE
	MOV _ConInp, EAX
	
	invoke ReadConsole, _ConInp, ADDR _mem_alloc, 
	\
	_mem_limit, ADDR _CI_len, NULL
	
	MOV EAX, offset _mem_alloc
	ADD EAX, _CI_len
	SUB EAX, 2
	MOV BYTE ptr [EAX], 0
	
	invoke atol, ADDR _mem_alloc
	MOV var__int, EAX
	
	invoke wsprintf, ADDR _mem_alloc, ADDR var__string, var__int
	invoke WriteConsole, _ConOut, ADDR _mem_alloc, 
	\
	sizeof _mem_alloc, ADDR _CI_len, NULL

	jmp $
;invoke Sleep, 10000
	invoke ExitProcess, 0 
	
end void_main