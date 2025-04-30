#let title(
  subj: [],
  work_type: [],
  work_number: [],
  work_name: [],
  group: [],
  students: (),
  teach_name: [],
  is_fem_teach: false,
  year: [],
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
    Институт №3 «Системы управления, информатика и электроэнергетика»
    Кафедра № 304 «Вычислительные машины, системы и сети»
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

  doc
}

#let code(
  str,
  lang,
) = {
  block(
    stroke: 0.5pt + gray,
    fill: luma(250),
    inset: 8pt,
    radius: 3pt,
    raw(
      str,
      lang: lang,
    ),
  )
}
