This directory contain the tests for asm-to-asm round-trip.

The `CHECK-...` lines are generated by the following scripts:

```sh
# Positive tests:
./bin/llvm-mc -arch=eravm < input.s | sed -E 's|^[ \t]+|; CHECK:  |'

# Negative tests:
./bin/llvm-mc -arch=eravm < input.s 2>&1 > /dev/null | sed -E \
    -e '/^<stdin>/ s|^<stdin>:[0-9]+:(.+)$|; CHECK:       <stdin>:{{[0-9]+}}:\1|' \
    -e 's|^([ \t].*)$|; CHECK-NEXT:  \1|'
```
