#let title(
  inst_info: (
    inst_num: 3,
    inst_name: "Системы управления, информатика и электроэнергетика",
    caf_num: 304,
    caf_name: "Вычислительные машины, системы и сети",
  ),
  subj: [],
  work_type: [],
  work_number: [],
  work_name: [],
  group: "М3О-111Св-24",
  students: (
    (name: "Солдатов А.Т.", is_fem: false),
  ),
  teach_name: [],
  is_fem_teach: false,
  year: "2025",
  doc,
) = {
  set math.equation(numbering: "(1)")
  set figure(
    supplement: "",
    numbering: "Рис. 1)",
  )
  show raw: set text(size: 8pt)

  grid(
    inset: 5pt,
    columns: (60pt, auto),
    image("mai_logo.png"),
    [МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ
      ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ
      «МОСКОВСКИЙ АВИАЦИОННЫЙ ИНСТИТУТ
      (национальный исследовательский университет)»],
  )

  line(length: 100%, stroke: 0.5pt + gray)

  align(right)[
    Институт №#inst_info.inst_num «#inst_info.inst_name» \
    Кафедра №#inst_info.caf_num «#inst_info.caf_name»
  ]

  v(20%)

  align(center)[«#subj» \
    Отчет по
    #if work_type == "lab" [
      лабораторной
    ] else if work_type == "pz" [
      практической
    ]
    работе № #work_number \
    “#work_name”
  ]

  v(20%)

  align(right)[
    #for student in students [
      #if student.is_fem == true [
        Выполнила: студентка
      ] else [
        Выполнил: студент
      ]
      группы #group #student.name
      #v(10pt)
      #line(length: 10%, stroke: 0.5pt)
    ]

    #if is_fem_teach == true [
      Проверила:
    ] else [
      Проверил:
    ]
    #teach_name
    #v(10pt)
    #line(length: 10%, stroke: 0.5pt) \
  ]

  align(center + bottom)[Москва #year]

  set page(numbering: "1")

  show raw.where(block: true): it => {
    set par(justify: false)
    grid(
      columns: (100%, 100%),
      column-gutter: -100%,
      block(
        width: 100%,
        inset: 1em,
        for (i, line) in it.text.split("\n").enumerate() {
          box(width: 0pt, align(right, text(gray, str(i + 1)) + h(2em)))
          hide(line)
          linebreak()
        },
      ),
      block(
        stroke: 0.5pt + gray,
        fill: luma(250),
        inset: 8pt,
        radius: 3pt,
        width: 100%,
        it,
      ),
    )
  }

  doc
}
