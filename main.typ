#import "chars.typ": char
#import "list.typ": *
#import "pages.typ": pages
#import "utils.typ": char_table, render_dict, render_pages
#set page(height: 30cm, margin: .5cm)




== Words with high level of certainty
#render_dict(words1, br: false)
== Words the relative certainty
#render_dict(words2, br: false)
== Words I'm only sure about the sense
#render_dict(sem, br: false)

// #set page(height: 25cm)
== Temp chars
#render_dict(tmp, br: false)
== Char table
#char_table


#set page(paper: "a4", margin: 1.5cm)


== Underscore rendering
Mainly for attempts to find words.
#render_pages()

#pagebreak()
== With temp characters displayed rendering
To easily find where a character is used
#render_pages(tmp: true)
