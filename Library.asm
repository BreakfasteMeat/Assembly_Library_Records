.model large
.stack 100h

.data
    buffer db 6 dup(0)         ; Buffer to store ASCII digits (max 5 digits + null terminator)
    buffer_end db '$'          ; String terminator for printing
    ten dw 10
    three_spaces db '   ',0,'$'
    
    MAX_USER_COUNT dw 3 
    main_menu       db 13,10,10,'                              LIBRARY MANAGEMENT SYSTEM',13,10
                    db '           a. Borrow Book',13,10
                    db '           b. Show Borrowed Books',13,10
                    db '           c. Update Borrowed Book',13,10
                    db '           d. Return Book',13,10
                    db '           e. Available Books',13,10
                    db 10,10,10
                    db '  Choose Option: '
                    db 0

    usercount dw 0

    username1 db 20 DUP (?)
    password1 dw 0

    username2 db 20 DUP (?)
    password2 dw 0

    username3 db 20 DUP (?)
    password3 dw 0

    username_check db 20 DUP (?)
    password_check dw 0
    password_toCheck dw 0

    user1_records dw 0,0,0,0,0,0,0,0,0,0
    user1_records_days dw 0,0,0,0,0,0,0,0,0,0
    
    user2_records dw 0,0,0,0,0,0,0,0,0,0
    user2_records_days dw 0,0,0,0,0,0,0,0,0,0
    
    user3_records dw 0,0,0,0,0,0,0,0,0,0
    user3_records_days dw 0,0,0,0,0,0,0,0,0,0

    user_num db 0

    library_records dw 1,1,1,1,1,1,1,1,1,1

    temp_manipulate_record_var_index dw 0
    temp_manipulate_record_var_days dw 0

    borrow_book_title       db 13,10,10,10,10,'                                   BORROW BOOK',13,10,0
    borrow_bookID_prompt    db 13,10,10,'   Enter Book ID:',0
    borrow_bookdays_prompt  db 13,10,'   Enter the number of days to borrow book:',0

    

    book_list_menu db 13,10,10,'                                    List of Books',13,10,0
    book_list_row_info db 13,10,10
                             db '          |=========================================|==============|',13,10
                             db '          |           Book Name           | Book Id | Availability |',13,10,0
    book_list_row_01         db '          | 01.) 48 Laws of Power         |   000   |',0
    book_list_row_02         db '          | 02.) The Art of War           |   001   |',0
    book_list_row_03         db '          | 03.) Crime and Punishment     |   002   |',0
    book_list_row_04         db '          | 04.) Tale of Two Cities       |   003   |',0
    book_list_row_05         db '          | 05.) 1984                     |   004   |',0
    book_list_row_06         db '          | 06.) To Kill A Mockingbird    |   005   |',0
    book_list_row_07         db '          | 07.) The Great Gatsby         |   006   |',0
    book_list_row_08         db '          | 08.) Moby-Dick                |   007   |',0
    book_list_row_09         db '          | 09.) The Catcher in the Rye   |   008   |',0
    book_list_row_10         db '          | 10.) The Alchemist            |   009   |',0
    book_list_row_end        db '          |=========================================|==============|',13,10,0
    available db '   Available  |','$'
    borrowed db  '   Borrowed   |','$'

    book_list_borrowed_menu db 13,10,10,'                                Your Borrowed Books',13,10,0
    
    book_name_01 db '        48 Laws of Power           ',0,'$'
    book_name_02 db '        The Art of War             ',0,'$'
    book_name_03 db '        Crime and Punishment       ',0,'$'
    book_name_04 db '        Tale of Two Cities         ',0,'$'
    book_name_05 db '        1984                       ',0,'$'
    book_name_06 db '        To Kill A Mockingbird      ',0,'$'
    book_name_07 db '        The Great Gatsby           ',0,'$'
    book_name_08 db '        Moby-Dick                  ',0,'$'
    book_name_09 db '        The Catcher in the Rye     ',0,'$'
    book_name_10 db '        The Alchemist              ',0,'$'

    dash db ' -         ',0,'$'
    days_left db ' days left to return',0,'$'

    book_num_index dw 0
    book_num_index_value dw 0
    book_num_index_days dw 0



    opening_menu    db 13,10,10
                    db '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219
                    db 13,10
                    db '                    ',219,219,'                                 ',219,219,13,10
                    db '                    ',219,219,'      CIT-U LIBRARY SYSTEM       ',219,219,13,10
                    db '                    ',219,219,'                                 ',219,219,13,10
                    db '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219
                    db 13,10,10
                    db '       By: Seth Nathaniel G. Emia           Programmed: December 00, 2024',13,10,10
                    db '                      __...--~~~~~-._   _.-~~~~~--...__',13,10
                    db '                    //               `V"               \\',13,10
                    db '                   //                 |                 \\',13,10
                    db '                  //__...--~~~~~~-._  |  _.-~~~~~~--...__\\ ',13,10
                    db '                 //__.....----~~~~._\ | /_.~~~~----.....__\\',13,10
                    db '                ====================\\|//====================',13,10
                    db '                                    `---`',13,10,10,10
                    db '  1. REGISTER',13,10
                    db '  2. LOG-IN',13,10
                    db '  Choose Number: ',0

    register_screen db 13,10,10
                    db '                           LIBRARY REGISTER USER',13,10,0
    
    register_username db 13,10,'   Enter username: ',0
    register_password db 13,10,'   Enter password: ',0
    register_full_msg db 13,10,'   THE SYSTEM HAS REACHED ITS MAX AMOUNT OF USERS',0
    register_succ     db 13,10,'   SUCCESSFULLY REGISTERED USER',0
    register_username_used db 13,10,'   USERNAME IS ALREADY USED, TRY A DIFFERENT ONE',0

    login_screen    db 13,10,10
                    db '                               LIBRARY LOGIN',13,10,0

    login_username    db 13,10,'   Enter username: ',0
    login_password    db 13,10,'   Enter password: ',0
    press_enter db '   Press Enter to continue!',0,'$'
    wrong_password  db '   Incorrect Password!',13,10
                    db '   Press Enter to try again!',0
    user_not_found_msg db '   User Not Found!',0

    book_not_available db '   Book not available!',0,'$'

.code
INCLUDE IO.mac
PRINT_STRING proc
    mov ah, 09h
    int 21h
    ret
PRINT_STRING endp

PRINT_CHARACTER proc
    mov ah, 02h
    int 21h
    ret
PRINT_CHARACTER endp

PRINT_INTEGER proc
    ; Converts AX to a string and stores it in the buffer pointed by SI
    mov cx, 0          ; initialize digit count
    mov bx, 10         ; divisor

convert_loop:
    xor dx, dx         ; clear DX
    div bx             ; AX / 10, remainder in DX, quotient in AX
    add dl, '0'        ; convert digit to ASCII
    push dx            ; store digit on stack
    inc cx             ; increment digit count
    test ax, ax        ; check if quotient is 0
    jnz convert_loop   ; repeat if quotient is not 0

print_loop:
    pop dx             ; get digit from stack
    mov ah, 02h        ; DOS function to print character
    int 21h            ; print character
    loop print_loop    ; repeat for all digits

    ret
PRINT_INTEGER endp

;COMPARES 2 STRINGS MOVED INTO THE SI AND DI REGISTERS
;MOVES 0 TO AL IF NOT EQUAL
;MOVES 1 TO AL IF EQUAL

STRING_COMPARE proc    

compare_loop:

    mov al, [di]     
    mov bl, [si]     ; Load byte from string2   
    cmp al, bl       ; Compare the two bytes
    jne not_equal    ; If they are not equal, jump to not_equal
    
    cmp al, 0        ; Check if end of string1 (null terminator)
    je equal         ; If yes, strings are equal
    
    inc si           ; Move to the next byte in string1
    inc di           ; Move to the next byte in string2
    jmp compare_loop ; Repeat the loop
    
not_equal:
    mov AL, 0
    ret
equal:
    mov AL, 1
    ret
STRING_COMPARE endp


;USED IN PRINTING THE TABLE
;IF 0, BORROWED, ELSE AVAILABLE
;USE AX REGISTER AS PASSED VALUE
IF_AVAIALBLE proc
    mov bx, 1
    cmp AX, BX
    je IF_AVAIALBLE_YES

    lea dx, borrowed  
    mov ah, 09h      
    int 21h          
    ret
IF_AVAIALBLE_YES:
    lea dx, available  
    mov ah, 09h      
    int 21h
    ret
IF_AVAIALBLE endp

;
;
;
MANIPULATE_CORRESPONDING_USER_RECORD proc
    mov si, temp_manipulate_record_var_index
    shl si, 1
    cmp user_num,1
    je manipulate_user1_record
    cmp user_num,2
    je manipulate_user2_record
    jmp manipulate_user3_record
    ret
manipulate_user1_record:

    cmp library_records[si],0
    je manipulate_book_not_avaialable
    
    mov library_records[si],0
    mov user1_records[si],1
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user1_records_days[si],cx
    ret
manipulate_user2_record:
    cmp library_records[si],0
    je manipulate_book_not_avaialable
    
    mov library_records[si],0
    mov user2_records[si],1
    xor cx, cx
    mov cx, temp_manipulate_record_var_days
    mov user2_records_days[si],cx
    ret
manipulate_user3_record:
manipulate_book_not_avaialable:
    mov dl, 10
    call PRINT_CHARACTER
    lea dx, book_not_available
    call PRINT_STRING
    ret


MANIPULATE_CORRESPONDING_USER_RECORD endp




; PRINTS THE BOOK NAME
; BASED ON VALUE PASSED ON
; BOOK_NUM_INDEX
return_checking_book:
    ret
PRINT_BORROWED_BOOK_INFO_index proc
    xor dx,dx
    cmp book_num_index_value,0
    je return_checking_book


    cmp book_num_index,0
    jne check_index_1_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_01
    call PRINT_STRING
    

    jmp end_checking_book_index

check_index_1_print_book:
    cmp book_num_index,1
    jne check_index_2_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_02
    call PRINT_STRING
    jmp end_checking_book_index

check_index_2_print_book:
    cmp book_num_index,2
    jne check_index_3_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_03
    call PRINT_STRING
    jmp end_checking_book_index
check_index_3_print_book:
    cmp book_num_index,3
    jne check_index_4_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_04
    call PRINT_STRING
    jmp end_checking_book_index
check_index_4_print_book:
    cmp book_num_index,4
    jne check_index_5_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_05
    call PRINT_STRING
    jmp end_checking_book_index
check_index_5_print_book:
    cmp book_num_index,5
    jne check_index_6_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_06
    call PRINT_STRING
    jmp end_checking_book_index
check_index_6_print_book:
    cmp book_num_index,6
    jne check_index_7_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_07
    call PRINT_STRING
    jmp end_checking_book_index
check_index_7_print_book:
    cmp book_num_index,7
    jne check_index_8_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_08
    call PRINT_STRING
    jmp end_checking_book_index
check_index_8_print_book:
    cmp book_num_index,8
    jne check_index_9_print_book

    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_09
    call PRINT_STRING
    jmp end_checking_book_index
check_index_9_print_book:
    mov dl, 10
    call PRINT_CHARACTER

    lea dx, book_name_10
    call PRINT_STRING
    jmp end_checking_book_index

end_checking_book_index:
    lea dx, dash
    call PRINT_STRING
    
    mov ax,book_num_index_days
    call print_integer
    
    lea dx, days_left
    call PRINT_STRING
    ret

PRINT_BORROWED_BOOK_INFO_index endp


main proc
    mov ax, 3              
    int 10h

    mov ax, @data
    mov ds, ax            





    ;Call Function to print opening screen
    call OpScreen
    ;to return from OpScreen Section
retOpScreen:

    GetCh AL
    cmp AL,'1'
    je REGISTER_JUMP
    cmp AL, '2'
    je LOGIN_JUMP


REGISTER_JUMP:
    call REGISTER
LOGIN_JUMP:
    call LOGIN
retREGISTER:
    jmp done


;---------------------------------------------REGISTER SCREEN-----------------------------------------------------;
REGISTER:
    mov ax, 03
    int 10h
    mov ax, MAX_USER_COUNT
    cmp ax,usercount
    je REGISTER_FULL_JUMP
    putStr register_screen
    putStr register_username
    
    cmp usercount,0
    jne register_user2
    GetStr username1
    putStr register_password

    getint password1
    jmp REGISTER_FINAL
REGISTER_FULL_JUMP:
    call REGISTER_FULL

register_user2:
    cmp usercount,1
    jne register_user3
    GetStr username2
    lea si, username2
    putStr register_password
    getint password2
    jmp REGISTER_FINAL

register_user3:
    GetStr username3
    lea si, username3
    putStr register_password
    getint password3
    jmp REGISTER_FINAL

REGISTER_FINAL:
    
    CALL CHECK_USER_ALREADY_EXISTS
    
USER_IS_UNIQUE:
    inc usercount
    nwln
    putstr register_succ
    nwln
    PutStr press_enter
    GetCH AL
    xor al, al
    jmp main

REGISTER_FULL:
    PutStr register_full_msg
    PutStr press_enter
    GetCH AL
    xor al, al

    jmp main



;---------------------------------------------LOGIN SCREEN-----------------------------------------------------;
LOGIN:
    mov ax, 03
    int 10h
    putStr login_screen
    putStr login_username
    GetStr username_check
    putStr login_password
    getint password_check

;---------------CHECK FIRST USERNAME-------------------;
    lea si, username_check
    lea di, username1
    CALL STRING_COMPARE
    cmp AL,0
    je check_username_2
    mov user_num,1
    mov CX, password1
    jmp end_username_compare
check_username_2:
    lea si, username_check
    lea di, username2
    CALL STRING_COMPARE
    cmp AL,0
    je check_username_3
    mov user_num,2
    mov CX, password2
    jmp end_username_compare
check_username_3:
    lea si, username_check
    lea di, username3
    CALL STRING_COMPARE
    cmp AL,0
    je USER_NOT_FOUND
    mov user_num,1
    mov CX, password3
    jmp end_username_compare

    

end_username_compare:
    cmp password_check, CX
    je MAIN_APP_LOOP_JUMP
    call wrong_password_section
MAIN_APP_LOOP_JUMP:
    call MAIN_APP_LOOP


wrong_password_section:
    nwln
    PutStr wrong_password
    GetCh al
    call LOGIN
USER_NOT_FOUND:
    nwln
    PutStr user_not_found_msg
    nwln
    PutStr press_enter
    GetCH AL
    call main

LOGIN_MAIN_HUB:
    jmp main


OpScreen:
    PutStr opening_menu
    call retOpScreen

CHECK_USER_ALREADY_EXISTS:
    cmp usercount,0
    je FINISH_USER_ALREADY_EXISTS
    lea di, username1
    call STRING_COMPARE
    cmp AL,1
    je USER_ALREADY_EXISTS
    cmp usercount,1
    je FINISH_USER_ALREADY_EXISTS
    lea di, username2
    call STRING_COMPARE
    cmp AL,1
    je USER_ALREADY_EXISTS
    cmp usercount,2
    je FINISH_USER_ALREADY_EXISTS

USER_ALREADY_EXISTS:
    PutStr register_username_used
    nwln
    PutStr press_enter
    GetCH AL
    CALL main


FINISH_USER_ALREADY_EXISTS:
    call USER_IS_UNIQUE
;------------MAIN APP STARTS HERE----------------;
MAIN_APP_LOOP:
    mov ax, 3              
    int 10h

    PutStr main_menu
    
    GetCh AL
    cmp al, 'a'
    je BORROW_BOOK_JUMP
    cmp al, 'b'
    je SHOW_BORROWED_BOOKS_JUMP
    cmp al,'e'
    je SHOW_BOOKS_JUMP

call MAIN_APP_LOOP

BORROW_BOOK_JUMP:
    call BORROW_BOOK
SHOW_BORROWED_BOOKS_JUMP:
    call SHOW_BORROWED_BOOKS
SHOW_BOOKS_JUMP:
    call SHOW_BOOKS

BORROW_BOOK:
    mov ax, 3              
    int 10h
    putstr borrow_book_title
    putstr borrow_bookID_prompt
    getint temp_manipulate_record_var_index
    putstr borrow_bookdays_prompt
    getint temp_manipulate_record_var_days
    call MANIPULATE_CORRESPONDING_USER_RECORD
    nwln
    putstr press_enter
    getch al

    call MAIN_APP_LOOP

;-----------------------BORROW_BOOK_JUMPS-----------------------
load_2nd_user_borrowed_books_jump:
    call load_2nd_user_borrowed_books
SHOW_BORROWED_BOOKS:
    mov ax, 3              
    int 10h
    xor ax,ax
    xor bx,bx

    putstr book_list_borrowed_menu

    cmp user_num,1
    jne load_2nd_user_borrowed_books_jump
    
    mov bx,0
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
    
    
    mov bx, 1
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 2
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
    
    mov bx, 3
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 4
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
        
    mov bx, 5
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 6
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
        
    mov bx, 7
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 8
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

    
    mov bx, 9
    mov si,bx
    shl si,1
    mov ax, user1_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user1_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

    jmp END_SHOW_BORROWED_BOOKS
load_3rd_user_borrowed_books_jump:
    jmp load_3rd_user_borrowed_books

load_2nd_user_borrowed_books:
    cmp user_num,2
    jne load_3rd_user_borrowed_books_jump

    mov bx,0
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
    
    
    mov bx, 1
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 2
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
    
    mov bx, 3
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 4
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
        
    mov bx, 5
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 6
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index
        
    mov bx, 7
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

        
    mov bx, 8
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

    
    mov bx, 9
    mov si,bx
    shl si,1
    mov ax, user2_records[si]
    mov book_num_index_value,ax
    mov book_num_index,bx
    mov ax, user2_records_days[si]
    mov book_num_index_days,ax
    call PRINT_BORROWED_BOOK_INFO_index

    jmp END_SHOW_BORROWED_BOOKS

load_3rd_user_borrowed_books:

END_SHOW_BORROWED_BOOKS:
    nwln
    putstr press_enter
    getch al
    call MAIN_APP_LOOP
SHOW_BOOKS:
    mov ax, 3              
    int 10h
    xor cx,cx
    
    xor AL,AL

    putstr book_list_menu
    putstr book_list_row_info
    
    putstr book_list_row_01
    mov si, 0
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_02
    mov si, 1
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_03
    mov si, 2
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_04
    mov si, 3
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_05
    mov si, 4
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_06
    mov si, 5
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_07
    mov si, 6
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_08
    mov si, 7
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_09
    mov si, 8
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln

    putstr book_list_row_10
    mov si, 9
    shl si, 1
    mov ax, library_records[si]
    call IF_AVAIALBLE
    nwln
    PutStr book_list_row_end
    PutStr press_enter
    Getch AL
    call MAIN_APP_LOOP




;-----USABLE FUNCTIONS---;

done:
    mov ah, 4ch            
    int 21h



main endp

end main
