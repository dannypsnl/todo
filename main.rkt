#lang racket
(provide todo)
(require (for-syntax syntax/parse
                     racket/syntax-srcloc))

(define-syntax (todo stx)
  (syntax-parse stx
    [(_) #`(raise (format "TODO ~a" #,((compose srcloc->string syntax-srcloc) stx)))]))

(module+ test
  (require rackunit)

  (check-exn string? (lambda () (todo)))
)
