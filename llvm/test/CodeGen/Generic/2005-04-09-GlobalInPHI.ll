; RUN: llc < %s 
; UNSUPPORTED: target=evm{{.*}}

        %struct.TypHeader = type { i32, ptr, [3 x i8], i8 }
@.str_67 = external global [4 x i8]             ; <ptr> [#uses=1]
@.str_87 = external global [17 x i8]            ; <ptr> [#uses=1]

define void @PrBinop() {
entry:
        br i1 false, label %cond_true, label %else.0

cond_true:              ; preds = %entry
        br label %else.0

else.0:         ; preds = %cond_true, %entry
        %tmp.167.1 = phi i32 [ ptrtoint (ptr @.str_87 to i32), %entry ], [ 0, %cond_true ]               ; <i32> [#uses=0]
        call void @Pr( ptr @.str_67, i32 0, i32 0 )
        ret void
}

declare void @Pr(ptr, i32, i32)

