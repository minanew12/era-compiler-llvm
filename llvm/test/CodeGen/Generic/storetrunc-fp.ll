; UNSUPPORTED: target=eravm{{.*}}, target=evm{{.*}}
; Unsupported because of floats.
; RUN: llc < %s

define void @foo(double %a, double %b, ptr %fp) {
	%c = fadd double %a, %b
	%d = fptrunc double %c to float
	store float %d, ptr %fp
	ret void
}
