// Relatively sure
#let phon1 = (
  u: 0b111001000111, // "u"se / "You"
  too: 0b11001001111, // "To"
  a: 0b11,
  the: 0b110000110011,
  d: 0b100000110000,
  n: 0b110100,
  z: 0b110000100100,
  l: 0b110000000000,
  f: 0b10000011000,
  t: 0b10000001100,
  p: 0b10000001000,
  s: 0b110000011000,
  k: 0b100000101000,
  an: 0b1100110111, // "An" item / "An"d
  shi: 0b11011111101, // "Shie"ld
  weh: 0b1011001100, // "We"st
  ee: 0b11011011010, // "Ea"st
  beuh: 0b100000100011, // "Bu"tton
  toh: 0b10011000100, // Bu"to"n
  ho: 0b111011100011, // "Ho"ld
  reh: 0b110011001000, // P"re"ss
  beh: 0b101011100000, // "Be"ll
  roh: 0b111011001011, // "Ro"ll | Cont"ro"ls
  ko: 0b100000101011, // "Co"ntrols
)

// Unsure
#let phon2 = (
  of: 0b100100100111,
  wo: 0b1111, // "Wa"s
  la: 0b111000000011,
  o: 0b11001100, // "A"ll
  they: 0b110000110001,
  loh: 0b111000000001, // "Lo"ck
  ki: 0b111011101001, // "Key"
  pay: 0b10000001001, // "Pa"ge
  dj: 0b100000010000, // Pa"ge"
  bi: 0b100011100000, // "Bui"lt
  za: 0b111000110011, // "Tha"t ???
  ait: 0b10100001110, // Aït? "It"em
  em: 0b1111110000, // Em? It"em"
  say: 0b110000001001, // "Sa"cred
  see: 0b111011011001, // "Se"cret
  koh: 0b111011100000, // "Ca"lled
  "in": 0b111110100, // "In"to
  ka: 0b101000101011, // "Ca"st | Could be "Lo"st
  po: 0b11011001011, // Source: ?
  m: 0b110000,
  un: 0b1111110100, // Op"en" "un"-XX
  op: 0b11111001011, // "Op"en
)

#let phon = phon1 + phon2

#let words1 = (
  use: (phon.u, phon.z),
  shield: (phon.shi, phon.l, phon.d),
  west: (phon.weh, phon.s, phon.t),
  east: (phon.ee, phon.s, phon.t),
  button: (phon.beuh, phon.toh, phon.n),
  press: (phon.p, phon.reh, phon.s),
  hold: (phon.ho, phon.l, phon.d),
  roll: (phon.roh, phon.l),
  lock: (phon.loh, phon.k),
  bell: (phon.beh, phon.l),
  flask: (phon.f, phon.la, phon.s, phon.k),
  well: (phon.weh, phon.l),
  key: (phon.ki,),
  built: (phon.bi, phon.l, phon.t),
  all: (phon.o, phon.l),
  was: (phon.wo, phon.z),
  "and": (phon.an, phon.d),
  hole: (phon.ho, phon.l),
)

#let words2 = (
  that: (phon.za, phon.t),
  sacred: (phon.say, phon.k, phon.reh, phon.d),
  secrets: (phon.see, phon.k, phon.reh, phon.t, phon.s),
  called: (phon.koh, phon.l, phon.d),
  into: (phon.in, phon.too),
  cast: (phon.ka, phon.s, phon.t), // Could be "lost"
  tomb: (phon.too, phon.m),
  untombed: (phon.un, phon.too, phon.m, phon.d),
  open: (phon.op, phon.un),
  opened: (phon.op, phon.un, phon.d),
)

#let words_letter = (
  you: (phon.u,),
  to: (phon.too,),
  the: (phon.the,),
  a: (phon.a,),
  an: (phon.an,),
  of: (phon.of,),
  they: (phon.they,),
  "in": (phon.in,),
)

#let words = words1 + words2 + words_letter


// Characters with unknown pronounciation
#let tmp = (
  c1: 0b10010011000, // "Gai"ned
  c2: 0b10000001101, // Pi or Ta from Pick/Take
  t1: 0b111010110000,
  t2: 0b110011000000,
  t3: 0b100000100100,
  // t4: 0b100100101011, // Reverse of
  t5: 0b10000101000,
  // t6: 0b110000001100, Mistaken for t, replaced by t76
  t7: 0b10010001000,
  t8: 0b1011000010,
  t9: 0b110011011000,
  t10: 0b11011001101,
  t11: 0b110011001100,
  t12: 0b11000001011,
  t15: 0b100110111,
  t16: 0b101011110010,
  t17: 0b11001001100,
  t18: 0b110000000001,
  t19: 0b1011110110,
  t20: 0b110101,
  t21: 0b11011000110,
  t22: 0b111011001001,
  t23: 0b111100000011,
  t24: 0b10111001100,
  t25: 0b1011000001,
  t26: 0b101011100100,
  t27: 0b10011011011,
  t28: 0b11010111111,
  t29: 0b111000011001,
  t30: 0b110000001011,
  // t31: 0b110000, // Became "m"
  t32: 0b101011100001,
  t33: 0b1011001101,
  t34: 0b111100100111,
  t35: 0b110111100100,
  t36: 0b101001111111,
  t37: 0b111101000000,
  t38: 0b110100000011,
  t39: 0b111101001011,
  t40: 0b110111111100,
  t41: 0b111111000011,
  t42: 0b100011110000,
  t43: 0b101011100110,
  t44: 0b11000011001,
  t45: 0b111001011000,
  t46: 0b111011011000,
  t47: 0b111111000001,
  t48: 0b100011100100,
  t49: 0b100000111111,
  // t50: 0b1111110100, // Became "un"
  // t51: 0b101000101011, // Became ka
  t52: 0b110011011011,
  t53: 0b101000101001,
  t54: 0b10000011011,
  t55: 0b10000101010,
  t56: 0b101010100000,
  t57: 0b101111110001,
  t58: 0b111011000001, // Lee ? Holy
  t59: 0b1000110101,
  t60: 0b11110100,
  t61: 0b101001101000,
  t62: 0b11011001111,
  t63: 0b110000001000,
  t64: 0b11011001100,
  t65: 0b11001111100,
  t66: 0b11011001010,
  t67: 0b111000100011,
  t68: 0b10000011001,
  t69: 0b101001100000,
  t70: 0b110000001010,
  // t71: 0b11111001011, // Became op
  t72: 0b101011100101,
  t73: 0b11010001100,
  t74: 0b100100100011,
  t75: 0b111001001011,
  t76: 0b110000001100,
  t77: 0b110000000010,
  t78: 0b10100001101,
  t79: 0b110011110000, // Ha?
  t80: 0b1001110111,
  t81: 0b1010000011,
  t82: 0b100111010000,
  t83: 0b11001011000,
  t84: 0b1011001110,
  t85: 0b111000001011,
  t86: 0b10011001100,
  t87: 0b101111100111,
  t88: 0b11000111111,
  t89: 0b11011001110,
  // t90: 0b111110100t,
)
)

// Words of which I understand the sense but I'm not sure about pronounciation
#let sem = (
  gained: (
    tmp.c1,
    phon.n,
    phon.d,
  ),
  item: (
    phon.ait,
    phon.em,
  ),
  "pick/take": (
    tmp.c2,
    phon.k,
  ),
  page: (
    phon.pay,
    phon.dj,
  ),
)

// Words repeated but I have no other clues about
#let pseudo-words = (
  w1: (tmp.t7, tmp.t8),
  noun1: (tmp.t9, tmp.t10), // City?
  verb1: (tmp.t42, phon.s, phon.ko, tmp.t43), // Verb radical
  people: (tmp.t5, phon.say), // Name of the people?
)
