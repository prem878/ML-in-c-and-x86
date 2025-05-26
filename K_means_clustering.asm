x:
        .long   0
        .long   1072693248
        .long   0
        .long   1073741824
        .long   0
        .long   1077346304
        .long   0
        .long   1078362112
        .long   0
        .long   1079377920
        .long   0
        .long   1077936128
        .long   0
        .long   1078919168
        .long   0
        .long   1078099968
        .long   0
        .long   1078198272
        .long   0
        .long   1077346304
        .long   0
        .long   1076953088
        .long   0
        .long   1077346304
        .long   0
        .long   1078722560
        .long   0
        .long   1076101120
        .long   0
        .long   1079427072
        .long   0
        .long   1078165504
distance:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        mov     edx, 0
        movq    rax, xmm0
        movq    rdx, xmm1
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-8], rdx
        movapd  xmm1, xmm2
        movapd  xmm0, xmm3
        mov     eax, 0
        mov     edx, 0
        movq    rax, xmm1
        movq    rdx, xmm0
        mov     QWORD PTR [rbp-32], rax
        mov     QWORD PTR [rbp-24], rdx
        movsd   xmm0, QWORD PTR [rbp-16]
        movsd   xmm2, QWORD PTR [rbp-32]
        movapd  xmm1, xmm0
        subsd   xmm1, xmm2
        movsd   xmm0, QWORD PTR [rbp-16]
        movsd   xmm2, QWORD PTR [rbp-32]
        subsd   xmm0, xmm2
        mulsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-8]
        movsd   xmm3, QWORD PTR [rbp-24]
        movapd  xmm2, xmm0
        subsd   xmm2, xmm3
        movsd   xmm0, QWORD PTR [rbp-8]
        movsd   xmm3, QWORD PTR [rbp-24]
        subsd   xmm0, xmm3
        mulsd   xmm0, xmm2
        addsd   xmm0, xmm1
        pop     rbp
        ret
kmeans:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 216
        mov     QWORD PTR [rbp-216], rdi
        mov     DWORD PTR [rbp-220], esi
        mov     DWORD PTR [rbp-224], edx
        mov     rax, rsp
        mov     rbx, rax
        mov     eax, DWORD PTR [rbp-224]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR [rbp-112], rdx
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     esi, 16
        mov     edx, 0
        div     rsi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 7
        shr     rax, 3
        sal     rax, 3
        mov     QWORD PTR [rbp-120], rax
        mov     eax, DWORD PTR [rbp-220]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR [rbp-128], rdx
        cdqe
        lea     rdx, [0+rax*4]
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     esi, 16
        mov     edx, 0
        div     rsi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 3
        shr     rax, 2
        sal     rax, 2
        mov     QWORD PTR [rbp-136], rax
        mov     eax, DWORD PTR [rbp-224]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR [rbp-144], rdx
        cdqe
        lea     rdx, [0+rax*4]
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     edi, 16
        mov     edx, 0
        div     rdi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 3
        shr     rax, 2
        sal     rax, 2
        mov     QWORD PTR [rbp-152], rax
        mov     eax, DWORD PTR [rbp-224]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR [rbp-160], rdx
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     esi, 16
        mov     edx, 0
        div     rsi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 7
        shr     rax, 3
        sal     rax, 3
        mov     QWORD PTR [rbp-168], rax
        mov     edi, 0
        call    time
        mov     edi, eax
        call    srand
        call    rand
        cdq
        idiv    DWORD PTR [rbp-220]
        mov     eax, edx
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-216]
        add     rax, rdx
        mov     rcx, QWORD PTR [rbp-120]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rcx], rax
        mov     QWORD PTR [rcx+8], rdx
        mov     DWORD PTR [rbp-20], 1
        jmp     .L4
.L13:
        movsd   xmm0, QWORD PTR .LC0[rip]
        movsd   QWORD PTR [rbp-32], xmm0
        mov     DWORD PTR [rbp-36], 0
        jmp     .L5
.L12:
        movsd   xmm0, QWORD PTR .LC1[rip]
        movsd   QWORD PTR [rbp-48], xmm0
        mov     DWORD PTR [rbp-52], 0
        jmp     .L6
.L9:
        mov     eax, DWORD PTR [rbp-36]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-216]
        add     rax, rdx
        mov     rdx, QWORD PTR [rbp-120]
        mov     ecx, DWORD PTR [rbp-52]
        movsx   rcx, ecx
        sal     rcx, 4
        add     rdx, rcx
        movsd   xmm2, QWORD PTR [rdx]
        movsd   xmm0, QWORD PTR [rdx+8]
        mov     rdx, QWORD PTR [rax]
        movsd   xmm1, QWORD PTR [rax+8]
        movapd  xmm3, xmm0
        movq    xmm0, rdx
        call    distance
        movq    rax, xmm0
        mov     QWORD PTR [rbp-200], rax
        movsd   xmm0, QWORD PTR [rbp-48]
        comisd  xmm0, QWORD PTR [rbp-200]
        jbe     .L7
        movsd   xmm0, QWORD PTR [rbp-200]
        movsd   QWORD PTR [rbp-48], xmm0
.L7:
        add     DWORD PTR [rbp-52], 1
.L6:
        mov     eax, DWORD PTR [rbp-52]
        cmp     eax, DWORD PTR [rbp-20]
        jl      .L9
        movsd   xmm0, QWORD PTR [rbp-48]
        comisd  xmm0, QWORD PTR [rbp-32]
        jbe     .L10
        movsd   xmm0, QWORD PTR [rbp-48]
        movsd   QWORD PTR [rbp-32], xmm0
        mov     eax, DWORD PTR [rbp-36]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-216]
        add     rax, rdx
        mov     rdx, QWORD PTR [rbp-120]
        mov     ecx, DWORD PTR [rbp-20]
        movsx   rcx, ecx
        sal     rcx, 4
        add     rcx, rdx
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rcx], rax
        mov     QWORD PTR [rcx+8], rdx
.L10:
        add     DWORD PTR [rbp-36], 1
.L5:
        mov     eax, DWORD PTR [rbp-36]
        cmp     eax, DWORD PTR [rbp-220]
        jl      .L12
        add     DWORD PTR [rbp-20], 1
.L4:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-224]
        jl      .L13
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-64], xmm0
.L33:
        mov     DWORD PTR [rbp-56], 0
        mov     DWORD PTR [rbp-68], 0
        jmp     .L14
.L20:
        movsd   xmm0, QWORD PTR .LC1[rip]
        movsd   QWORD PTR [rbp-80], xmm0
        mov     DWORD PTR [rbp-84], -1
        mov     DWORD PTR [rbp-88], 0
        jmp     .L15
.L18:
        mov     eax, DWORD PTR [rbp-68]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-216]
        add     rax, rdx
        mov     rdx, QWORD PTR [rbp-120]
        mov     ecx, DWORD PTR [rbp-88]
        movsx   rcx, ecx
        sal     rcx, 4
        add     rdx, rcx
        movsd   xmm2, QWORD PTR [rdx]
        movsd   xmm0, QWORD PTR [rdx+8]
        mov     rdx, QWORD PTR [rax]
        movsd   xmm1, QWORD PTR [rax+8]
        movapd  xmm3, xmm0
        movq    xmm0, rdx
        call    distance
        movq    rax, xmm0
        mov     QWORD PTR [rbp-192], rax
        movsd   xmm0, QWORD PTR [rbp-80]
        comisd  xmm0, QWORD PTR [rbp-192]
        jbe     .L16
        movsd   xmm0, QWORD PTR [rbp-192]
        movsd   QWORD PTR [rbp-80], xmm0
        mov     eax, DWORD PTR [rbp-88]
        mov     DWORD PTR [rbp-84], eax
.L16:
        add     DWORD PTR [rbp-88], 1
.L15:
        mov     eax, DWORD PTR [rbp-88]
        cmp     eax, DWORD PTR [rbp-224]
        jl      .L18
        mov     rax, QWORD PTR [rbp-136]
        mov     edx, DWORD PTR [rbp-68]
        movsx   rdx, edx
        mov     eax, DWORD PTR [rax+rdx*4]
        cmp     DWORD PTR [rbp-84], eax
        je      .L19
        mov     rax, QWORD PTR [rbp-136]
        mov     edx, DWORD PTR [rbp-68]
        movsx   rdx, edx
        mov     ecx, DWORD PTR [rbp-84]
        mov     DWORD PTR [rax+rdx*4], ecx
        mov     DWORD PTR [rbp-56], 1
.L19:
        add     DWORD PTR [rbp-68], 1
.L14:
        mov     eax, DWORD PTR [rbp-68]
        cmp     eax, DWORD PTR [rbp-220]
        jl      .L20
        mov     DWORD PTR [rbp-92], 0
        jmp     .L21
.L22:
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-92]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-92]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        add     rax, 8
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR [rbp-152]
        mov     edx, DWORD PTR [rbp-92]
        movsx   rdx, edx
        mov     DWORD PTR [rax+rdx*4], 0
        add     DWORD PTR [rbp-92], 1
.L21:
        mov     eax, DWORD PTR [rbp-92]
        cmp     eax, DWORD PTR [rbp-224]
        jl      .L22
        mov     DWORD PTR [rbp-96], 0
        jmp     .L23
.L24:
        mov     rax, QWORD PTR [rbp-136]
        mov     edx, DWORD PTR [rbp-96]
        movsx   rdx, edx
        mov     eax, DWORD PTR [rax+rdx*4]
        mov     DWORD PTR [rbp-180], eax
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-180]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        movsd   xmm1, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-96]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-216]
        add     rax, rdx
        movsd   xmm0, QWORD PTR [rax]
        addsd   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-180]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-180]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        add     rax, 8
        movsd   xmm1, QWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-96]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-216]
        add     rax, rdx
        movsd   xmm0, QWORD PTR [rax+8]
        addsd   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-180]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        add     rax, 8
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR [rbp-152]
        mov     edx, DWORD PTR [rbp-180]
        movsx   rdx, edx
        mov     eax, DWORD PTR [rax+rdx*4]
        lea     ecx, [rax+1]
        mov     rax, QWORD PTR [rbp-152]
        mov     edx, DWORD PTR [rbp-180]
        movsx   rdx, edx
        mov     DWORD PTR [rax+rdx*4], ecx
        add     DWORD PTR [rbp-96], 1
.L23:
        mov     eax, DWORD PTR [rbp-96]
        cmp     eax, DWORD PTR [rbp-220]
        jl      .L24
        mov     DWORD PTR [rbp-100], 0
        jmp     .L25
.L27:
        mov     rax, QWORD PTR [rbp-152]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        mov     eax, DWORD PTR [rax+rdx*4]
        test    eax, eax
        jle     .L26
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        movsd   xmm0, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-152]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        mov     eax, DWORD PTR [rax+rdx*4]
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, eax
        divsd   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        add     rax, 8
        movsd   xmm0, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-152]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        mov     eax, DWORD PTR [rax+rdx*4]
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, eax
        divsd   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-100]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        add     rax, 8
        movsd   QWORD PTR [rax], xmm0
.L26:
        add     DWORD PTR [rbp-100], 1
.L25:
        mov     eax, DWORD PTR [rbp-100]
        cmp     eax, DWORD PTR [rbp-224]
        jl      .L27
        mov     DWORD PTR [rbp-104], 0
        jmp     .L28
.L31:
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-104]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        movsd   xmm2, QWORD PTR [rax]
        movsd   xmm0, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-120]
        mov     edx, DWORD PTR [rbp-104]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        movsd   xmm1, QWORD PTR [rax+8]
        movapd  xmm3, xmm0
        movq    xmm0, rdx
        call    distance
        movq    rax, xmm0
        mov     QWORD PTR [rbp-176], rax
        movsd   xmm0, QWORD PTR [rbp-176]
        comisd  xmm0, QWORD PTR [rbp-64]
        jbe     .L29
        movsd   xmm0, QWORD PTR [rbp-176]
        movsd   QWORD PTR [rbp-64], xmm0
.L29:
        mov     rax, QWORD PTR [rbp-120]
        mov     edx, DWORD PTR [rbp-104]
        movsx   rdx, edx
        sal     rdx, 4
        lea     rcx, [rax+rdx]
        mov     rax, QWORD PTR [rbp-168]
        mov     edx, DWORD PTR [rbp-104]
        movsx   rdx, edx
        sal     rdx, 4
        add     rax, rdx
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rcx], rax
        mov     QWORD PTR [rcx+8], rdx
        add     DWORD PTR [rbp-104], 1
.L28:
        mov     eax, DWORD PTR [rbp-104]
        cmp     eax, DWORD PTR [rbp-224]
        jl      .L31
        cmp     DWORD PTR [rbp-56], 0
        je      .L32
        movsd   xmm0, QWORD PTR [rbp-64]
        comisd  xmm0, QWORD PTR .LC3[rip]
        ja      .L33
.L32:
        mov     rsp, rbx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     DWORD PTR [rbp-4], 8
        mov     eax, DWORD PTR [rbp-4]
        sub     eax, 2
        mov     DWORD PTR [rbp-8], eax
        mov     edx, DWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rbp-4]
        mov     esi, eax
        mov     edi, OFFSET FLAT:x
        call    kmeans
        mov     eax, 0
        leave
        ret
.LC0:
        .long   0
        .long   -1074790400
.LC1:
        .long   -1
        .long   2146435071
.LC3:
        .long   -1598689907
        .long   1051772663
