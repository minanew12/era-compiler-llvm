; RUN: llvm-mc -triple eravm -filetype=asm %s -o - | FileCheck %s

  .text
foo:

; mnemonics
  ret  r3
  rev  r3
  pnc

; modifiers (condition, not testing aliases)
  ret.lt   r3
  rev.lt   r3
  pnc.lt

; COM: Autogenerated checks below, see README.md.
; CHECK:  .text
; CHECK:foo:

; CHECK:  ret       r3
; CHECK:  rev       r3
; CHECK:  pnc

; CHECK:  ret.lt    r3
; CHECK:  rev.lt    r3
; CHECK:  pnc.lt
