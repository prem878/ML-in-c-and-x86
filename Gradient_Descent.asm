in:
        .long   0
        .long   0
        .long   0
        .long   1073741824
        .long   0
        .long   1074790400
        .long   0
        .long   1075314688
        .long   0
        .long   1075838976
        .long   0
        .long   1076101120
        .long   0
        .long   1076363264
        .long   0
        .long   1076625408
        .long   0
        .long   1076887552
out:
        .long   0
        .long   0
        .long   0
        .long   1075314688
        .long   0
        .long   1076101120
        .long   0
        .long   1076625408
        .long   0
        .long   1077018624
        .long   0
        .long   1077280768
        .long   0
        .long   1077542912
        .long   0
        .long   1077805056
        .long   0
        .long   1078001664
y:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
        movsd   QWORD PTR [rbp-16], xmm0
        movsd   QWORD PTR [rbp-24], xmm1
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, DWORD PTR [rbp-4]
        mulsd   xmm0, QWORD PTR [rbp-16]
        addsd   xmm0, QWORD PTR [rbp-24]
        pop     rbp
        ret
cost_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR [rbp-36], edi
        movsd   QWORD PTR [rbp-48], xmm0
        movsd   QWORD PTR [rbp-56], xmm1
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-8], xmm0
        mov     DWORD PTR [rbp-12], 0
        jmp     .L4
.L5:
        mov     eax, DWORD PTR [rbp-12]
        cdqe
        movsd   xmm0, QWORD PTR in[0+rax*8]
        cvttsd2si       eax, xmm0
        movsd   xmm0, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rbp-48]
        movapd  xmm1, xmm0
        movq    xmm0, rdx
        mov     edi, eax
        call    y
        movq    rax, xmm0
        mov     edx, DWORD PTR [rbp-12]
        movsx   rdx, edx
        movsd   xmm1, QWORD PTR out[0+rdx*8]
        movq    xmm0, rax
        subsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-24], xmm0
        movsd   xmm0, QWORD PTR .LC1[rip]
        mov     rax, QWORD PTR [rbp-24]
        movapd  xmm1, xmm0
        movq    xmm0, rax
        call    pow
        movsd   xmm1, QWORD PTR [rbp-8]
        addsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-8], xmm0
        add     DWORD PTR [rbp-12], 1
.L4:
        mov     eax, DWORD PTR [rbp-12]
        cmp     eax, DWORD PTR [rbp-36]
        jl      .L5
        mov     eax, DWORD PTR [rbp-36]
        add     eax, eax
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, eax
        movsd   xmm0, QWORD PTR [rbp-8]
        divsd   xmm0, xmm1
        leave
        ret
.LC4:
        .string "Iteration %d: Cost = %f , w= %f, b = %f\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     DWORD PTR [rbp-84], edi
        mov     QWORD PTR [rbp-96], rsi
        mov     DWORD PTR [rbp-48], 9
        mov     QWORD PTR [rbp-56], 10000000
        mov     QWORD PTR [rbp-64], 1000000
        movsd   xmm0, QWORD PTR .LC2[rip]
        movsd   QWORD PTR [rbp-72], xmm0
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-8], xmm0
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-16], xmm0
        mov     DWORD PTR [rbp-20], 1
        jmp     .L8
.L12:
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-32], xmm0
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-40], xmm0
        mov     DWORD PTR [rbp-44], 0
        jmp     .L9
.L10:
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        movsd   xmm0, QWORD PTR in[0+rax*8]
        cvttsd2si       eax, xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-8]
        movapd  xmm1, xmm0
        movq    xmm0, rdx
        mov     edi, eax
        call    y
        movq    rax, xmm0
        mov     edx, DWORD PTR [rbp-44]
        movsx   rdx, edx
        movsd   xmm1, QWORD PTR out[0+rdx*8]
        movq    xmm0, rax
        subsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-80], xmm0
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        movsd   xmm0, QWORD PTR in[0+rax*8]
        mulsd   xmm0, QWORD PTR [rbp-80]
        movsd   xmm1, QWORD PTR [rbp-32]
        addsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-32], xmm0
        movsd   xmm0, QWORD PTR [rbp-40]
        addsd   xmm0, QWORD PTR [rbp-80]
        movsd   QWORD PTR [rbp-40], xmm0
        add     DWORD PTR [rbp-44], 1
.L9:
        mov     eax, DWORD PTR [rbp-44]
        cmp     eax, DWORD PTR [rbp-48]
        jl      .L10
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, DWORD PTR [rbp-48]
        movsd   xmm0, QWORD PTR .LC3[rip]
        divsd   xmm0, xmm1
        movsd   xmm1, QWORD PTR [rbp-40]
        mulsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-40], xmm0
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, DWORD PTR [rbp-48]
        movsd   xmm0, QWORD PTR .LC3[rip]
        divsd   xmm0, xmm1
        movsd   xmm1, QWORD PTR [rbp-32]
        mulsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-32], xmm0
        movsd   xmm0, QWORD PTR [rbp-72]
        movapd  xmm1, xmm0
        mulsd   xmm1, QWORD PTR [rbp-32]
        movsd   xmm0, QWORD PTR [rbp-8]
        subsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-8], xmm0
        movsd   xmm0, QWORD PTR [rbp-72]
        movapd  xmm1, xmm0
        mulsd   xmm1, QWORD PTR [rbp-40]
        movsd   xmm0, QWORD PTR [rbp-16]
        subsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-16], xmm0
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        cqo
        idiv    QWORD PTR [rbp-64]
        mov     rax, rdx
        test    rax, rax
        jne     .L11
        movsd   xmm0, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rbp-48]
        movapd  xmm1, xmm0
        movq    xmm0, rdx
        mov     edi, eax
        call    cost_function
        movq    rax, xmm0
        movsd   xmm1, QWORD PTR [rbp-16]
        movsd   xmm0, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-20]
        movapd  xmm2, xmm1
        movapd  xmm1, xmm0
        movq    xmm0, rax
        mov     esi, edx
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 3
        call    printf
.L11:
        add     DWORD PTR [rbp-20], 1
.L8:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        cmp     QWORD PTR [rbp-56], rax
        jge     .L12
        mov     eax, 0
        leave
        ret
.LC1:
        .long   0
        .long   1073741824
.LC2:
        .long   1202590843
        .long   1065646817
.LC3:
        .long   0
        .long   1072693248
