#import "chars.typ": char
#import "list.typ": phon, tmp, words
#import "pages.typ": pages

#let WORD_SPACE = 4pt
#let SUB_SIZE = 7pt
#let render(c) = box(baseline: 0.425em)[#c]

#let render_word(word) = {
  if type(word) == array {
    for letter in word {
      render(char(letter))
    }
  } else {
    render(char(word))
  }
}

#let render_dict(d, br: true) = {
  for (english, trunic) in d.pairs() {
    [
      #box()[#render_word(trunic)~--~#english]
      #if br { linebreak() } else { h(5pt) }
    ]
  }
}

#let find_key(dict, target) = {
  for (key, val) in dict.pairs() {
    if val == target {
      return key
    }
  }
  assert(false)
}

#let word_text_box(text_, word) = context {
  set text(size: SUB_SIZE)
  let word_size = measure(render_word(word))
  (
    box(width: word_size.width)[
      #align(center)[#text_]
    ]
  )
}

#let letter_text_box(text_, letter, style: (:)) = context {
  set text(size: SUB_SIZE)
  let letter_size = measure(char(letter))

  box(width: letter_size.width)[
    #align(center)[
      #text(..style)[#text_]
    ]
  ]
}

#let render_transcript(line, inc_tmp: false) = context {
  for word in line {
    if type(word) != array {
      h(measure([#word]).width)
      h(WORD_SPACE)
      continue
    }

    if word in words.values() {
      let key = find_key(words, word)
      word_text_box(key, word)
    } else {
      for letter in word {
        // Letter is an int
        let key = "_"
        let style = (:)
        if letter in phon.values() {
          key = find_key(phon, letter)
        } else if (inc_tmp and letter in tmp.values()) {
          key = find_key(tmp, letter)
          style = (fill: gray, size: 6pt)
        }
        letter_text_box(key, letter, style: style)
      }
    }
    h(WORD_SPACE)
  }
}

#let render_trunic(line) = {
  for word in line {
    if type(word) == array {
      render_word(word)
    } else {
      word
    }
    h(WORD_SPACE)
  }
}

#let render_line(line, tmp: false) = {
  grid(
    // stroke: .1pt,
    inset: (top: 1pt),
    align: top + left,
    rows: (15pt, 6pt),
    render_trunic(line),
    render_transcript(line, inc_tmp: tmp),
  )
}
#let render_pages(tmp: false) = {
  for i in range(0, pages.len()) {
    heading(level: 3)[Page #(i + 1)]
    for line in pages.at(i) {
      render_line(line)
    }
  }
}

#let compare_middle(x, ref) = {
  // 0xABC -> 0XAB
  x = calc.div-euclid(x, 16)
  // 0xAB -> 0xB
  x = calc.rem-euclid(x, 16)
  return x == ref
}

#let char_lines = range(0, 16).map(i => {
  let matching_chars = (
    (phon + tmp) // All sounds
      .values() // Ints
      .filter(x => compare_middle(x, i)) // That have the seeked middle part
      .sorted() // Sorted
      .map(x => (x,)) // Put into array to be considered as words
  )
  grid(
    columns: (auto, auto),
    rows: 25pt,
    inset: (right: 5pt, left: 5pt, top: 1pt),
    stroke: (x, y) => { if x == 0 { (right: .5pt) } },
    char(i * 16), render_line(matching_chars, tmp: true),
  )
  // linebreak()
})

#let char_table = grid(
  columns: (auto,),
  // inset: (bottom: 4pt),
  stroke: (bottom: .5pt, top: .5pt),
  align: left,
  ..char_lines
)

#let duplicate_check() = {
  let glyphs_values = (phon + tmp).values().sorted()
  for i in range(0, glyphs_values.len() - 1) {
    let cur = glyphs_values.at(i)
    let next = glyphs_values.at(i + 1)
    // Ensures a character isn't present twice
    assert(
      cur != next,
      message: "Double glyph: " + find_key(phon + tmp, cur),
    )
  }
}
