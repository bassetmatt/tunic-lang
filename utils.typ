#import "chars.typ": char
#import "list.typ": phon, words

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
      #render_word(trunic)
      -- #english
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

#let letter_text_box(text_, letter) = context {
  set text(size: SUB_SIZE)
  let letter_size = measure(char(letter))

  box(width: letter_size.width)[
    #align(center)[#text_]
    // #text_
  ]
}

#let render_transcript(line) = context {
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
        if letter in phon.values() {
          key = find_key(phon, letter)
        }
        letter_text_box(key, letter)
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
#let render_line(line) = {
  grid(
    // stroke: .1pt,
    inset: (top: 1pt),
    align: top + left,
    rows: (15pt, 6pt),
    render_trunic(line),
    render_transcript(line),
  )
}
