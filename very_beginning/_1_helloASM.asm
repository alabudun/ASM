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
;This is some kind of spoiled assembly as it actually has print command O_o
;Anyway, it's not that important for me where to start, I'm just curious ape.
ret
	
	main endp

end start
