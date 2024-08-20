.globl f # this allows other files to find the function f

# f takes in two arguments:
# a0 is the value we want to evaluate f at
# a1 is the address of the "output" array (read the lab spec for more information).
# The return value should be stored in a0
f:
    # Your code here
    # first argument in a0 is the input, second argument in a1 is the address of output array

    addi t0 a0 3    # get the index of input  
    mv t1 a1        # store the pointer of the array in t1

    slli t2 t0 2    # multiply the index by the size of int to get the offset
    add t2 t2 t1    # add this offset to the address of the array
    lw t3 0(t2)     # read the element

    mv a0 t3        # put the element in a0 for returned value


    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
