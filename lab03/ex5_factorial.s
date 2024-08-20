.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE

    mv t0 a0            # get the value of n
    addi t1 x0 1        # initialize the vaule of i; i = 1
    addi t4 x0 1        # initialize the vaule of return value, re = 1


outerloop:
    addi t2 x0 1        # initialize the value of j; j = 1
    add t3 x0 x0        # initialize the value of sum ; sum = 0


innerloop: 
    add t3 t3 t4        # sum += re
    addi t2 t2 1        # j += 1
    bge t1 t2 innerloop # branch if i >= j


    mv t4 t3            # re = sum
    addi t1 t1 1        # i += 1
    bge t0 t1 outerloop # branch if n >= i

    mv a0 t4            # put the result in a0


    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
