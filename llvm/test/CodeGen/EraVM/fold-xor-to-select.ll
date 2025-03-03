; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc -O3 --disable-eravm-scalar-opt-passes < %s | FileCheck %s

target datalayout = "E-p:256:256-i256:256:256-S32-a:256:256"
target triple = "eravm"

define i256 @test_large_imm1(i256 %a) {
; CHECK-LABEL: test_large_imm1:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub.s! code[@CPI0_1], r1, r0
; CHECK-NEXT:    xor.lt code[@CPI0_0], r1, r1
; CHECK-NEXT:    ret
  %xor = xor i256 26959946660873538059280334323183841250350249843923952699046031785980, %a
  %cmp = icmp ult i256 %a, -26959946660873538059280334323183841250350249843923952699046031785985
  %select = select i1 %cmp, i256 %xor, i256 %a
  ret i256 %select
}

define i256 @test_large_imm2(i256 %a) {
; CHECK-LABEL: test_large_imm2:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub.s! code[@CPI1_1], r1, r0
; CHECK-NEXT:    xor.ge code[@CPI1_0], r1, r1
; CHECK-NEXT:    ret
  %xor = xor i256 26959946660873538059280334323183841250350249843923952699046031785980, %a
  %cmp = icmp ult i256 %a, -26959946660873538059280334323183841250350249843923952699046031785985
  %select = select i1 %cmp, i256 %a, i256 %xor
  ret i256 %select
}

define i256 @test_small_imm1(i256 %a) {
; CHECK-LABEL: test_small_imm1:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub.s! code[@CPI2_0], r1, r0
; CHECK-NEXT:    xor.lt 10, r1, r1
; CHECK-NEXT:    ret
  %xor = xor i256 10, %a
  %cmp = icmp ult i256 %a, -5
  %select = select i1 %cmp, i256 %xor, i256 %a
  ret i256 %select
}

define i256 @test_small_imm2(i256 %a) {
; CHECK-LABEL: test_small_imm2:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub.s! code[@CPI3_0], r1, r0
; CHECK-NEXT:    xor.ge 10, r1, r1
; CHECK-NEXT:    ret
  %xor = xor i256 10, %a
  %cmp = icmp ult i256 %a, -5
  %select = select i1 %cmp, i256 %a, i256 %xor
  ret i256 %select
}

define i256 @test_reg1(i256 %a, i256 %b) {
; CHECK-LABEL: test_reg1:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub! r1, r2, r0
; CHECK-NEXT:    xor.lt r1, r2, r1
; CHECK-NEXT:    ret
  %xor = xor i256 %a, %b
  %cmp = icmp ult i256 %a, %b
  %select = select i1 %cmp, i256 %xor, i256 %a
  ret i256 %select
}

define i256 @test_reg2(i256 %a, i256 %b) {
; CHECK-LABEL: test_reg2:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    sub! r1, r2, r0
; CHECK-NEXT:    xor.ge r1, r2, r1
; CHECK-NEXT:    ret
  %xor = xor i256 %a, %b
  %cmp = icmp ult i256 %a, %b
  %select = select i1 %cmp, i256 %a, i256 %xor
  ret i256 %select
}
