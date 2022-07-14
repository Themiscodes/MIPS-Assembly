.text
    .globl __start
__start:

main: 

        la $t2, lcm                             # index of the lcm array
        la $t4, lcm                             # pointer to the lcm array     
        la $t5, gcd                             # pointer to the gcd array
        la $t6, list                            # pointer to the array of integers
        addi $t3, $zero, 1                      # $t3 = 1 to use it for GCD

loop:

        beq $t6, $t2, end                       # if the loop is finished (first index of lcm)
        lw $s0, 0($t6)
        lw $s1, 4($t6)
        lw $s2, 8($t6)

        mult $s0, $s1                           # a * b
        mflo $t8

forloop:

        beq $s1, $t3, middle                    # if $s1 == 1 this is the GCD
        div $s0, $s1	                        # $s0 / $s1
        mfhi $s3			        # $s3 = $s0 mod $s1

        beq $s3, $zero, middle                  # if $s3 == 0, then GCD of the first two is in $s1
        add $s0, $zero, $s1
        add $s1, $zero, $s3                     # else swap
        
        j forloop                               # continue
        nop

middle: 

        div $t8, $s1			        # $t8 / $s1
        mflo $s4				# LCM(a,b) = a * b / GCD(a,b)

        add $s5, $zero, $s2 
        mult $s4, $s2
        mflo $t8                                # $t8 = LCM (a,b) * c
        

gcdcalc:

        beq $s1, $t3, lcmcalc                   # if $s1 == 1 this is the GCD
        div $s2, $s1                            # $s2 / $s1
        mfhi $s3                                # $s3 = $s2 mod $s1

        beq $s3, $zero, lcmcalc                 # if $s3 = 0, then GCD of the first two is in $s1
        add $s2, $zero, $s1
        add $s1, $zero, $s3                     # else swap

        j gcdcalc                               # continue
        nop


lcmcalc:

        beq $s5, $t3, finalequation             # if $s5 == 1 it's done
        div $s4, $s5                            # $s4 / $s5
        mfhi $s3

        beq $s3, $zero, finalequation           # if $s3 = 0, then GCD is in $s5
        add $s4, $zero, $s5
        add $s5, $zero, $s3 
        
        j lcmcalc                               # continue
        nop


finalequation:

        div $t8, $s5                            # $t8 / $s5
        mflo	$s2                             # LCM (a,b,c)= LCM (a,b) * c / GCD (LCM (a,b) , c)

        sw $s1, 0($t5)                          # $s1 store the GCD
        addi $t6, $t6, 12                       # go to the next three
        addi $t5, $t5, 4                        # go to the next word

        sw $s2, 0($t4)                          # $s2 store the GCD
        addi $t4, $t4, 4                        # go to the next word

        j loop                                  # start over
        nop     


end:

        break


.data

list: .word 27, 30, 77, 11, 57, 63, 46, 7, 90, 72, 20, 11, 57, 44, 17, 20, 78, 1, 4, 79, 22, 11, 17, 37, 23, 24, 79, 33, 66, 8, 69, 36, 59, 74, 40, 25, 36, 86, 4, 68, 56, 44, 35, 1, 57, 45, 12, 8, 26, 22, 74, 26, 92, 17, 46, 54, 93, 68, 68, 58, 48, 69, 82, 62, 28, 45, 76, 18, 34, 28, 82, 1, 75, 39, 61, 43, 42, 43, 14, 67, 5, 73, 80, 69, 64, 98, 1, 73, 85, 33, 34, 60, 88, 15, 75, 12, 74, 73, 72, 29, 64, 93, 16, 87, 46, 25, 39, 22, 51, 40, 31, 91, 94, 70, 84, 88, 37, 60, 8, 79, 78, 3, 66, 14, 65, 89, 26, 19, 78, 68, 70, 70, 33, 76, 79, 22, 90, 49, 64, 7, 49, 27, 27, 9, 31, 22, 87, 54, 71, 12, 50, 32, 89, 5, 99, 80, 1, 21, 49, 67, 31, 91, 14, 41, 53, 37, 11, 48, 45, 44, 46, 34, 19, 47, 83, 53, 95, 51, 59, 10, 14, 82, 5, 36, 15, 46, 96, 22, 60, 95, 20, 72, 46, 78, 54, 3, 67, 7

lcm: .space 264 # 66 integers. Least Common Multiples

gcd: .space 264 # 66 integers. Greatest Common Divisors