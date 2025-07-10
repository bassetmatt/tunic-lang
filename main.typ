#import "chars.typ": char
#import "utils.typ": render_dict, render_line
#import "list.typ": *
#set page(height: 40cm, margin: .5cm)



#let glossary = grid(
  columns: (auto, auto, auto),
  inset: 15pt,
  stroke: (x, y) => {
    if (x != 2) {
      if (y == 0) {
        (right: (thickness: .1pt))
      } else {
        (right: .5pt)
      }
    }
    if (y != 0) {
      (bottom: .3pt)
    }
  },
  align: left + top,

  [Sounds], [Words], [Words (sense)],
  render_dict(phon1), render_dict(words1), render_dict(sem),
  render_dict(phon2), render_dict(words2),
)

#let glyphs_values = (phon + tmp).values().sorted()
#grid(
  align: horizon + center,
  columns: (auto, 1fr, auto),
  rows: (1fr, auto, auto),
  [], glossary, [],
  [],
  {
    "Tmp"
    linebreak()
    render_dict(tmp, br: false)
    v(5pt)
  },
  [],

  [],
  {
    "Used glyphs"
    linebreak()
    for v in phon.values().sorted() {
      [#v ]
    }
  },
  [],
)

#for i in range(0, glyphs_values.len() - 1) {
  // Ensures a character isn't present twice
  assert(
    glyphs_values.at(i) != glyphs_values.at(i + 1),
  )
}

#set page(paper: "a4", margin: 1.5cm)


#let page1 = (
  (
    (tmp.t1,),
    (tmp.t2, tmp.t3, phon.d),
    words.a,
    "Civilization",
    words.of,
    (tmp.t5, phon.say, phon.t),
    pseudo-words.w1,
    sym.bullet,
  ),
  (
    words.they,
    words.built,
    words.a,
    pseudo-words.w2,
    ",",
    words.and,
    (phon.o, tmp.t11, phon.n),
    words.that,
    pseudo-words.w2,
    words.they,
    words.built,
  ),
  (
    words.a,
    (tmp.t12, tmp.t2, phon.s),
    sym.bullet,
    words.they,
    words.called,
    words.sacred,
    words.the,
    words.secrets,
    words.of,
  ),
  (
    words.the,
    "Holy Cross,",
    words.and,
    (tmp.t15, tmp.t16, phon.s, tmp.t17, phon.d),
    words.the,
    (phon.p, tmp.t18, tmp.t19),
  ),
  (
    (tmp.t20, tmp.t21),
    words.of,
    (tmp.t22, tmp.t23, tmp.t24, tmp.t25),
    sym.bullet,
    words.they,
    (tmp.t26, phon.n, tmp.t21, phon.d),
    words.to,
    words.the,
    (tmp.t27,),
    (tmp.t28,),
  ),
  (
    words.and,
    (tmp.t29, phon.t),
    pseudo-words.w1,
    (phon.f, tmp.t30, tmp.t31),
    words.the,
    (phon.s, phon.pay, tmp.t9, phon.z),
    (tmp.t32, phon.t, tmp.t33, phon.n),
    sym.bullet,
  ),
)

#let page2 = (
  (
    (tmp.t34,),
    (tmp.t35,),
    (phon.u, tmp.t36, tmp.t37),
    ",",
    words.an,
    (tmp.t38, tmp.t39, tmp.t40),
    (tmp.t41, phon.d),
    pseudo-words.w1,
    words.was,
    (tmp.t42, phon.s, phon.ko, tmp.t43, phon.d),
    sym.bullet,
  ),
  (
    (tmp.t44, tmp.t45, phon.l, phon.z),
    words.of,
    (tmp.t46, phon.l, phon.f),
    ",",
    (tmp.t15, tmp.t47, phon.d),
    (tmp.t48, tmp.t49, phon.n, phon.z),
    words.of,
    words.the,
    (phon.f, phon.u, tmp.t21),
    ",",
  ),
)

=== Page 1
#for line in page1 {
  render_line(line)
}

=== Page 2
#for line in page2 {
  render_line(line)
}
