#lang racket

(require (for-syntax racket/match))
(provide pda-term->pda)

(define-syntax (pda-term->pda stx)
  (define (list-of-len v n [a '()])
    (if (> n 0) (list-of-len v (sub1 n) (cons v a)) a))
  (define (pda-mod pda)
    (let ((toks (cdar pda)))
      (foldr (λ (n a) (match n
                        (`(NO-SHIFT ,b ...)
                         `((EOS ,@b) (START s0) . ,a))
                        (`(RULE ,rn ,nt ,n (lambda ,args ,body))
                         `((RULE ,rn ,nt ,args ,body) . ,a))
                        (`(RULE ,rn ,nt ,n ,v)
                         `((RULE ,rn ,nt ,(list-of-len v n) ,v) . ,a))
                        (_ (cons n a))))
             '()
             pda)))
  (syntax-case stx ()
    ((_ clauses)
     #`'(#,@(pda-mod (syntax->datum #'clauses))))))
