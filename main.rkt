#lang racket
(provide todo)
(require (for-syntax syntax/parse))

(define-syntax (todo stx)
  (syntax-parse stx
    [(_) (raise (format "~a" stx))]))
