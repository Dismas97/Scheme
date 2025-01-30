;(use-modules (oop goops) (g-golf))

;(default-duplicate-binding-handler
;  '(merge-generics replace warn-override-core warn last))

(eval-when (expand load eval)
  (use-modules (oop goops))

  (default-duplicate-binding-handler
    '(merge-generics replace warn-override-core warn last))

  (use-modules (g-golf))
  (gi-import "Gtk"))


(define (activate app)
  (let ((window (make <gtk-application-window>
                  #:title "Hello"
                  #:default-width 320
                  #:default-height 240
                  #:application app))
        (box    (make <gtk-box>
                  #:margin-top 6
                  #:margin-start 6
                  #:margin-bottom 6
                  #:margin-end 6
                  #:orientation 'vertical))
        (label  (make <gtk-label>
                  #:label "Hello, World!"
                  #:hexpand #t
                  #:vexpand #t))
        (button (make <gtk-button>
                  #:label "Close")))

    (connect button
	     'clicked
	     (lambda (b)
               (close window)))

    (set-child window box)
    (append box label)
    (append box button)
    (present window)))


(define (main args)
  (let ((app (make <gtk-application>
               #:application-id "org.gtk.example")))
    (connect app 'activate activate)
    (let ((status (g-application-run app args)))
      (exit status))))

(main '())
