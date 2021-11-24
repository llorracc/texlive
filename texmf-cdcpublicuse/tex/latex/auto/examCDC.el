(TeX-add-style-hook "examCDC"
 (lambda ()
    (TeX-add-symbols
     '("answer" 2)
     "ifExamQuestion"
     "AnswerOrBlankSpace"
     "ifAnswers")
    (TeX-run-style-hooks
     "ifthen")))

