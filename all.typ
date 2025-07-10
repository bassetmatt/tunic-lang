#import "chars.typ": char

#box(width: 2.4em)[0]
#for i in range(0, 4096) {
  box(baseline: 0.48em)[#char(i)] + h(3pt)
  if calc.rem-euclid(i + 1, 32) == 0 {
    linebreak() + box(width: 2.4em)[#(i + 1)] + h(3pt)
  }
}
