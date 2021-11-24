(TeX-add-style-hook
 "Global"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "bibMake"
    "handout"
    "handout10"
    "handoutSetup")
   (LaTeX-add-bibliographies
    "economics")))

