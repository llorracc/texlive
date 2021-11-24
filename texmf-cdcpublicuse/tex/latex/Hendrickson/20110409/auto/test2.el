(TeX-add-style-hook "test2"
 (lambda ()
    (TeX-run-style-hooks
     "printvrb"
     "latex2e"
     "bk10"
     "book"
     "test")))

