include \masm32\include\masm32rt.inc

    .data?
value dd ?
    .data
item dd 0
    .code
	
start:
call main
	
    inkey
    exit

main proc

    cls
    print "Hello, L.L.L.!",13,10
ret
	
	main endp

end start
