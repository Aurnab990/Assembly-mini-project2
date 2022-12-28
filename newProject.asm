include 'emu8086.inc'

org 100h
num1 db 0
num2 db 0
a db 1h
b db 1h
finum dw 0
choice db 0
rem db ?
s db ?
ans db ?
d db 10 dup(?)
time dw 0
sum db 0

.code
main proc  
    
    printn                             "Microprocessor, Microcontrollers and Assembly Language Programming Lab Project"
    printn                                   "Course code: CSE-314  Project Name: Multi Task Generator"
    printn                                               "Course Admin: Mr. Amrita Biswas"                               
    print " "
    printn 
    printn "-----------------------------"
   
    
    printn "1.Calculator"
    printn "2.Reverse Array"
    printn "3.Fibonacci"
    printn "4.Factorial"
    
    printn "-----------------------------"
    
    printn "Choose an option: "
    
    
    mov ah,1
    int 21h
    sub al,48
    mov choice,al
    
    cmp choice,2
    jl Calcu
    jg Fibona
    
    
    
    ReArray:
    printn "----------------------------"
    printn "Enter size: "
    mov ah,1
    int 21h
    sub al,48
    mov ah,0
    mov time,ax
    
    printn "Enter number: "
    
    mov cx,time
    mov bx,0
    
    val_store:
    mov ah,1
    int 21h
    sub al,48
    mov d[bx],al
    push ax
    add sum,al
    inc bx
    print " "
    loop val_store
    
    
    printn "After Reverse: "
    mov cx,time
    
    rev:
    pop dx
    add dl,48
    mov ah,2
    int 21h
    print " "
    loop rev
    jmp exit
    
    
    
    Calcu:
    printn "Enter the fist number: "
    mov ah,1
    int 21h
    sub al,48
    mov num1,al
               
    printn "Enter the Second number: "
    mov ah,1
    int 21h
    sub al,48
    mov num2,al
      
    printn "1.Addition"
    printn "2.Subtraction"
    printn "3.Multipli"
    printn "4.Division"   
    
    mov ah,1
    int 21h
    sub al,48
    mov choice,al
    
    cmp choice,2
    jl addi
    jg multi
    
    subs:
    mov al,num1
    sub al,num2
    add al,48
    
    printn "Substraction result is: " 
   
    mov dl,al
    mov ah,2
    int 21h
    jmp exit 
    
    addi:
    mov al,num1
    add al,num2
    
    printn "Addition is: "
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h
    jmp exit
    
    multi:
    mov al,num1
    mul num2
    
    printn "Multiplication is: "
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h
    jmp exit
    
    
    divi:
    mov ah,0
    mov al,num1
    div num2
    add al,48
    
    printn "Division is: "
    
    mov dl,al
    mov ah,2
    int 21h
    jmp exit
    
     
    
    
    Fibona:
    cmp choice,4
    je Facto 
    
    printn "Enter the a number: "
    mov ah,1
    int 21h
    sub al,48
    mov num1,al
     
    mov al,a
    mov bl,b
    mov cl,num1
    label1:
    add al,bl
    mov s,al
    mov al,bl
    mov bl,s
    loop label1
    printn "The result is: "
    mov dl,s
    sub dl,48
    mov ah,2
    int 21h  
    
    jmp exit 
    
    
    
    Facto:
    printn "Enter the a number: "
    mov ah,1
    int 21h
    sub al,48
    mov num1,al
    
    mov al,num1
    mov cl,num1
    dec cl
    
    top:
    dec num1
    mul num1
    dec cl
    jne top
    
    mov ah,4ch
    int 21h
    
    
   
    
             
    

exit:
ret




