; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --check-attributes
; RUN: opt < %s -passes=function-attrs -S | FileCheck %s
; XFAIL: target=eravm{{.*}}, target=evm{{.*}}

define i32 @a() {
; CHECK: Function Attrs: nofree nosync nounwind memory(none)
; CHECK-LABEL: define {{[^@]+}}@a
; CHECK-SAME: () #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    [[TMP:%.*]] = call i32 @b()
; CHECK-NEXT:    ret i32 [[TMP]]
;
  %tmp = call i32 @b()
  ret i32 %tmp
}

define i32 @b() {
; CHECK: Function Attrs: nofree nosync nounwind memory(none)
; CHECK-LABEL: define {{[^@]+}}@b
; CHECK-SAME: () #[[ATTR0]] {
; CHECK-NEXT:    [[TMP:%.*]] = call i32 @a()
; CHECK-NEXT:    ret i32 [[TMP]]
;
  %tmp = call i32 @a()
  ret i32 %tmp
}
