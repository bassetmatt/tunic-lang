#import "@preview/cetz:0.4.0"

#import cetz.draw: *

#let points = {
  let H_RATIO = 180
  let V_RATIO = 180

  let mid1 = 18 / V_RATIO
  let mid2 = 13 / V_RATIO
  let mid3 = 13 / V_RATIO
  let down1 = 16 / V_RATIO
  let down2 = 13 / V_RATIO
  let down3 = 13 / V_RATIO
  let lr = 30 / H_RATIO
  let circle = 3 / V_RATIO

  let up-top = mid1 + mid2 + mid3
  let up-mid = mid1 + mid2
  let up-low = mid1
  let left = -lr
  let right = lr
  let down-low = -(down1)
  let down-mid = -(down1 + down2)
  let down-top = -(down1 + down2 + down3)
  let circ = -(down1 + down2 + down3 + circle)
  (
    top: (0, up-top),
    top-left: (left, up-mid),
    top-right: (right, up-mid),
    up-low: (0, up-low),
    zero-left: (left, 0),
    zero-right: (right, 0),
    zero: (0, 0),
    down-low: (0, down-low),
    down-low-left: (left, down-low),
    bottom-left: (left, down-mid),
    bottom-right: (right, down-mid),
    bottom: (0, down-top),
    circ: (0, circ),
    rad: 3 / V_RATIO,
  )
}

#let char-lines = (
  // High
  (line(points.top, points.top-left),), // High TL
  (line(points.top, points.top-right),), // High TR
  (line(points.up-low, points.top-left),), // High LL
  (line(points.up-low, points.top-right),), // High LR
  // Low
  (line(points.down-low, points.bottom-left),), // Low TL
  (line(points.down-low, points.bottom-right),), // Low TR
  (line(points.bottom, points.bottom-left),), // Low BL
  (line(points.bottom, points.bottom-right),), // Low BR
  //
  //
  // Vertical
  (circle(points.circ, radius: points.rad),), // Circle
  (
    line(points.top-left, points.zero-left),
    line(points.down-low-left, points.bottom-left),
  ), // Left vert
  (
    line(points.up-low, points.zero),
    line(points.down-low, points.bottom),
  ), // Middle low vert
  (line(points.top, points.zero),), // Middle vert
)


#let horiz-line = line(points.zero-left, points.zero-right)

#let all_at(i) = {
  for x in char-lines.at(i) {
    x
  }
}

#let char(x) = {
  cetz.canvas({
    group(name: "Char", {
      set-style(stroke: black + .3pt)
      horiz-line
      for i in range(0, 12) {
        let power2i = calc.pow(2, i)
        let bit-i = calc.div-euclid(x, power2i)
        if (calc.rem-euclid(bit-i, 2) == 1) {
          set-style(stroke: black + .3pt)
          all_at(i)
        } else {
          set-style(stroke: rgb(0, 0, 0, 0) + 0pt)
          all_at(i)
        }
      }
    })
  })
}
