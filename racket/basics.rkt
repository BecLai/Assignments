#lang racket

;;; Return the sum of all numbers up to and including n for 0 <= n.
(define (sum-to-n n)
  (if (zero? n)
      0
      (+ n (sum-to-n (- n 1)))))

;;; Calculate n choose r, for 0 <= n, 0 <= r <= n
(define (combination n r)
  (cond
   ((zero? r) 1)
   ((= n r) 1)
   (else
    (+ (combination (- n 1) r)
       (combination (- n 1) (- r 1))))))

;;;Return the nth fibonacci number 
(define (fibonacci n)
  (cond
   ((= 0 n) 0)
   ((= 1 n) 1)
   (else 
    (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

;;; Return the sum of all numbers in a list
(define (sum lst)
  (cond 
   ((null? lst) 0)
   (else
   (+ (car lst) (sum (cdr lst))))))

;;; Return whether element a is contained in list lst
(define (member? a lst) 
  (cond
   ((null? lst) #f)
   ((equal? a (car lst)) #t)
   (else
    (member? a (cdr lst)))))

;;; Return a list with the *first* instance of element a removed if present
(define (rember lst a) 
  (cond 
   ((null? lst) lst)
   ((equal? a (car lst)) (cdr lst))
   (else
    (cons (car lst) (rember (cdr lst) a)))))

;;; Return whether element a is contained in any level of S-expression lst
(define (member?* a lst) 
	(cond 
	((null? lst) #f) 
	((equal? a (car lst)) #t) 
	((and (list? (car lst)) 
		(member?* a (car lst))) #t) 
	(else 
		(member?* a (cdr lst)))))

;;; Return the intersection of sets set1 and set2
;;; set1 and set2 are guaranteed not to contain duplicate elements
(define (intersect set1 set2) 
	(cond 
	((null? set1) null)
	(else 
	(let ([rest (intersect (cdr set1) set2)])
		(if (member? (car set1) set2) 
			(if (member? (car set1) set2)
				(cons (car set1) rest) 
				rest)))))

;;; Return whether the list contains two equal adjacent elements
(define (two-in-a-row? lst) 
	((null? lst) #f) 
	((null? (cdr lst)) #f)  
	((equal? (car lst) (car (cdr lst))) #t) 
	(else 
	(two-in-a-row? (cdr lst)))) 

(define (two-in-a-row? lst) 
	(define (two-in-a-row-helper last lst))
		(cond 
			((null? lst) #f) 
			((equal? last (car lst)) #t) 
			(else 
			(two-in-a-row-helper (car lst) (cdr lst)))))  
	(and (not (null? lst)) 
		(two-in-a-row-helper (car lst) (cdr lst)))) 

;;; Return the nth element of a list
(define (nth lst n) 
	(cond
		((zero? n) (car lst))
		(else
		(nth (cdr lst) (-n 1))))) 

;;; Return a list containing the unique elements of lst
(define (dedup lst) 
	(cond 
		((null? lst) null) 
		((member? (car lst) (cdr lst))
		(dedup (cdr lst)))	
		(else 
		(cons (car lst) (dedup (cdr lst)))))) 

;;; Return a list containing the elements of lst in reverse order
(define (reverse lst) 
	(define (rev-h lst rev) 
		((null? lst) rev) 
		(else 
		(rev-h (cdr lst) (cons (car lst) rev)))))
	(rev-h lst '())) 

(provide
 sum-to-n
 combination
 fibonacci 
 sum
 rember
 member?
 member?*
 intersect
 two-in-a-row?
 nth
 dedup
 reverse)
