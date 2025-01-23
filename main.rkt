#lang racket
(provide todo)
(require (for-syntax syntax/parse
                     racket/syntax-srcloc))

(define-syntax (todo stx)
  (syntax-parse stx
    [(_) #`(error (format "TODO at ~a" #,((compose srcloc->string syntax-srcloc) stx)))]
    [(_ msg) #`(error (format "TODO (~a) at ~a" msg #,((compose srcloc->string syntax-srcloc) stx)))]
    ))

(module+ test
  (require rackunit)

  (check-exn exn:fail? (lambda () (todo)))
)

(module+ main
  (todo "add type inference")
  )
