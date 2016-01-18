;;; Copyright (c) 2003-2013 uim Project https://github.com/uim/uim
;;;
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;; 1. Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;; 2. Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;; 3. Neither the name of authors nor the names of its contributors
;;;    may be used to endorse or promote products derived from this software
;;;    without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
;;; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
;;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
;;; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
;;; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;;; SUCH DAMAGE.
;;;

;; These tests are passed at revision 6605 (new repository)

(define-module test.util.test-list
  (use test.unit.test-case)
  (use test.uim-test))
(select-module test.util.test-list)

(define (setup)
  (uim-test-setup)
  (uim '(define lst '(1 "2" three (4) 5 six "7" (8 8) -9))))

(define (teardown)
  (uim-test-teardown))

(define (test-truncate-list)
  (assert-uim-equal '()
                    '(truncate-list () 0))
  (assert-uim-false '(truncate-list () 1))
  (assert-uim-equal '()
                    '(truncate-list '("foo" "bar" "baz") 0))
  (assert-uim-equal '("foo")
                    '(truncate-list '("foo" "bar" "baz") 1))
  (assert-uim-equal '("foo" "bar")
                    '(truncate-list '("foo" "bar" "baz") 2))
  (assert-uim-equal '("foo" "bar" "baz")
                    '(truncate-list '("foo" "bar" "baz") 3))
  (assert-uim-false '(truncate-list '("foo" "bar" "baz") 4))
  #f)

(define (test-proc-or)
  (assert-uim-false '(proc-or))
  (assert-uim-false '(proc-or #f))
  (assert-uim-true  '(proc-or #t))
  (assert-uim-false '(proc-or #f #f))
  (assert-uim-true  '(proc-or #f #t))
  (assert-uim-true  '(proc-or #t #f))
  (assert-uim-true  '(proc-or #t #t))
  (assert-uim-false '(proc-or #f #f #f))
  (assert-uim-true  '(proc-or #f #f #t))
  (assert-uim-true  '(proc-or #f #t #f))
  (assert-uim-true  '(proc-or #f #t #t))
  (assert-uim-true  '(proc-or #t #f #f))
  (assert-uim-true  '(proc-or #t #f #t))
  (assert-uim-true  '(proc-or #t #t #f))
  (assert-uim-true  '(proc-or #t #t #t))
  (assert-uim-false '(apply proc-or ()))
  (assert-uim-false '(apply proc-or '(#f)))
  (assert-uim-true  '(apply proc-or '(#t)))
  (assert-uim-false '(apply proc-or '(#f #f)))
  (assert-uim-true  '(apply proc-or '(#f #t)))
  (assert-uim-true  '(apply proc-or '(#t #f)))
  (assert-uim-true  '(apply proc-or '(#t #t)))
  (assert-uim-false '(apply proc-or '(#f #f #f)))
  (assert-uim-true  '(apply proc-or '(#f #f #t)))
  (assert-uim-true  '(apply proc-or '(#f #t #f)))
  (assert-uim-true  '(apply proc-or '(#f #t #t)))
  (assert-uim-true  '(apply proc-or '(#t #f #f)))
  (assert-uim-true  '(apply proc-or '(#t #f #t)))
  (assert-uim-true  '(apply proc-or '(#t #t #f)))
  (assert-uim-true  '(apply proc-or '(#t #t #t)))
  #f)

(define (test-proc-and)
  (assert-uim-true  '(proc-and))
  (assert-uim-false '(proc-and #f))
  (assert-uim-true  '(proc-and #t))
  (assert-uim-false '(proc-and #f #f))
  (assert-uim-false '(proc-and #f #t))
  (assert-uim-false '(proc-and #t #f))
  (assert-uim-true  '(proc-and #t #t))
  (assert-uim-false '(proc-and #f #f #f))
  (assert-uim-false '(proc-and #f #f #t))
  (assert-uim-false '(proc-and #f #t #f))
  (assert-uim-false '(proc-and #f #t #t))
  (assert-uim-false '(proc-and #t #f #f))
  (assert-uim-false '(proc-and #t #f #t))
  (assert-uim-false '(proc-and #t #t #f))
  (assert-uim-true  '(proc-and #t #t #t))
  (assert-uim-true  '(apply proc-and ()))
  (assert-uim-false '(apply proc-and '(#f)))
  (assert-uim-true  '(apply proc-and '(#t)))
  (assert-uim-false '(apply proc-and '(#f #f)))
  (assert-uim-false '(apply proc-and '(#f #t)))
  (assert-uim-false '(apply proc-and '(#t #f)))
  (assert-uim-true  '(apply proc-and '(#t #t)))
  (assert-uim-false '(apply proc-and '(#f #f #f)))
  (assert-uim-false '(apply proc-and '(#f #f #t)))
  (assert-uim-false '(apply proc-and '(#f #t #f)))
  (assert-uim-false '(apply proc-and '(#f #t #t)))
  (assert-uim-false '(apply proc-and '(#t #f #f)))
  (assert-uim-false '(apply proc-and '(#t #f #t)))
  (assert-uim-false '(apply proc-and '(#t #t #f)))
  (assert-uim-true  '(apply proc-and '(#t #t #t)))
  #f)

;; See "Specification changes of utility procedures" of doc/COMPATIBILITY
(define (no-test-sublist-uim-1.4)
  ;; 0
  (assert-uim-equal '(1)
                    '(sublist lst 0 0))
  (assert-uim-equal '(1 "2")
                    '(sublist lst 0 1))
  (assert-uim-equal '(1 "2" three)
                    '(sublist lst 0 2))
  (assert-uim-equal '(1 "2" three (4))
                    '(sublist lst 0 3))
  (assert-uim-equal '(1 "2" three (4) 5)
                    '(sublist lst 0 4))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8))
                    '(sublist lst 0 7))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8) -9)
                    '(sublist lst 0 8))
  (assert-uim-error '(sublist lst 0 9))
  ;; 1
  (assert-uim-equal '()
                    '(sublist lst 1 0))
  (assert-uim-equal '("2")
                    '(sublist lst 1 1))
  (assert-uim-equal '("2" three)
                    '(sublist lst 1 2))
  (assert-uim-equal '("2" three (4))
                    '(sublist lst 1 3))
  (assert-uim-equal '("2" three (4) 5)
                    '(sublist lst 1 4))
  (assert-uim-equal '("2" three (4) 5 six "7" (8 8))
                    '(sublist lst 1 7))
  (assert-uim-equal '("2" three (4) 5 six "7" (8 8) -9)
                    '(sublist lst 1 8))
  (assert-uim-error '(sublist lst 1 9))
  ;; 2
  (assert-uim-error '(sublist lst 2 0))
  (assert-uim-equal '()
                    '(sublist lst 2 1))
  (assert-uim-equal '(three)
                    '(sublist lst 2 2))
  (assert-uim-equal '(three (4))
                    '(sublist lst 2 3))
  (assert-uim-equal '(three (4) 5)
                    '(sublist lst 2 4))
  (assert-uim-equal '(three (4) 5 six "7" (8 8))
                    '(sublist lst 2 7))
  (assert-uim-equal '(three (4) 5 six "7" (8 8) -9)
                    '(sublist lst 2 8))
  (assert-uim-error '(sublist lst 2 9))
  ;; 3
  (assert-uim-error '(sublist lst 3 0))
  (assert-uim-error '(sublist lst 3 1))
  (assert-uim-equal '()
                    '(sublist lst 3 2))
  (assert-uim-equal '((4))
                    '(sublist lst 3 3))
  (assert-uim-equal '((4) 5)
                    '(sublist lst 3 4))
  (assert-uim-equal '((4) 5 six "7" (8 8))
                    '(sublist lst 3 7))
  (assert-uim-equal '((4) 5 six "7" (8 8) -9)
                    '(sublist lst 3 8))
  (assert-uim-error '(sublist lst 3 9))
  ;; 8
  (assert-uim-error '(sublist lst 8 0))
  (assert-uim-error '(sublist lst 8 1))
  (assert-uim-error '(sublist lst 8 2))
  (assert-uim-error '(sublist lst 8 3))
  (assert-uim-error '(sublist lst 8 4))
  (assert-uim-equal '()
                    '(sublist lst 8 7))
  (assert-uim-equal '(-9)
                    '(sublist lst 8 8))
  (assert-uim-error '(sublist lst 8 9))
  ;; 9
  (assert-uim-error '(sublist lst 9 0))
  (assert-uim-error '(sublist lst 9 1))
  (assert-uim-error '(sublist lst 9 2))
  (assert-uim-error '(sublist lst 9 3))
  (assert-uim-error '(sublist lst 9 4))
  (assert-uim-error '(sublist lst 9 7))
  (assert-uim-equal '()
                    '(sublist lst 9 8))
  (assert-uim-error '(sublist lst 9 9))
  #f)

(define (no-test-sublist-rel-uim-1.4)
  ;; 0
  (assert-uim-equal '(1)
                    '(sublist-rel lst 0 0))
  (assert-uim-equal '(1 "2")
                    '(sublist-rel lst 0 1))
  (assert-uim-equal '(1 "2" three)
                    '(sublist-rel lst 0 2))
  (assert-uim-equal '(1 "2" three (4))
                    '(sublist-rel lst 0 3))
  (assert-uim-equal '(1 "2" three (4) 5)
                    '(sublist-rel lst 0 4))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8))
                    '(sublist-rel lst 0 7))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 0 8))
  (assert-uim-error '(sublist-rel lst 0 9))
  ;; 1
  (assert-uim-equal '("2")
                    '(sublist-rel lst 1 0))
  (assert-uim-equal '("2" three)
                    '(sublist-rel lst 1 1))
  (assert-uim-equal '("2" three (4))
                    '(sublist-rel lst 1 2))
  (assert-uim-equal '("2" three (4) 5)
                    '(sublist-rel lst 1 3))
  (assert-uim-equal '("2" three (4) 5 six)
                    '(sublist-rel lst 1 4))
  (assert-uim-equal '("2" three (4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 1 7))
  (assert-uim-error '(sublist-rel lst 1 8))
  (assert-uim-error '(sublist-rel lst 1 9))
  ;; 2
  (assert-uim-equal '(three)
                    '(sublist-rel lst 2 0))
  (assert-uim-equal '(three (4))
                    '(sublist-rel lst 2 1))
  (assert-uim-equal '(three (4) 5)
                    '(sublist-rel lst 2 2))
  (assert-uim-equal '(three (4) 5 six)
                    '(sublist-rel lst 2 3))
  (assert-uim-equal '(three (4) 5 six "7")
                    '(sublist-rel lst 2 4))
  (assert-uim-equal '(three (4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 2 6))
  (assert-uim-error '(sublist-rel lst 2 7))
  (assert-uim-error '(sublist-rel lst 2 8))
  (assert-uim-error '(sublist-rel lst 2 9))
  ;; 3
  (assert-uim-equal '((4))
                    '(sublist-rel lst 3 0))
  (assert-uim-equal '((4) 5)
                    '(sublist-rel lst 3 1))
  (assert-uim-equal '((4) 5 six)
                    '(sublist-rel lst 3 2))
  (assert-uim-equal '((4) 5 six "7")
                    '(sublist-rel lst 3 3))
  (assert-uim-equal '((4) 5 six "7" (8 8))
                    '(sublist-rel lst 3 4))
  (assert-uim-equal '((4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 3 5))
  (assert-uim-error '(sublist-rel lst 3 6))
  (assert-uim-error '(sublist-rel lst 3 7))
  (assert-uim-error '(sublist-rel lst 3 8))
  (assert-uim-error '(sublist-rel lst 3 9))
  ;; 8
  (assert-uim-equal '(-9)
                    '(sublist-rel lst 8 0))
  (assert-uim-error '(sublist-rel lst 8 1))
  (assert-uim-error '(sublist-rel lst 8 2))
  (assert-uim-error '(sublist-rel lst 8 3))
  (assert-uim-error '(sublist-rel lst 8 4))
  (assert-uim-error '(sublist-rel lst 8 5))
  (assert-uim-error '(sublist-rel lst 8 6))
  (assert-uim-error '(sublist-rel lst 8 7))
  (assert-uim-error '(sublist-rel lst 8 8))
  (assert-uim-error '(sublist-rel lst 8 9))
  ;; 9
  (assert-uim-error '(sublist-rel lst 9 0))
  (assert-uim-error '(sublist-rel lst 9 1))
  (assert-uim-error '(sublist-rel lst 9 2))
  (assert-uim-error '(sublist-rel lst 9 3))
  (assert-uim-error '(sublist-rel lst 9 4))
  (assert-uim-error '(sublist-rel lst 9 5))
  (assert-uim-error '(sublist-rel lst 9 6))
  (assert-uim-error '(sublist-rel lst 9 7))
  (assert-uim-error '(sublist-rel lst 9 8))
  (assert-uim-error '(sublist-rel lst 9 9))
  #f)

;; See "Specification changes of utility procedures" of doc/COMPATIBILITY
(define (test-sublist-uim-1.5)
  ;; 0
  (assert-uim-equal '()
                    '(sublist lst 0 0))
  (assert-uim-equal '(1)
                    '(sublist lst 0 1))
  (assert-uim-equal '(1 "2")
                    '(sublist lst 0 2))
  (assert-uim-equal '(1 "2" three)
                    '(sublist lst 0 3))
  (assert-uim-equal '(1 "2" three (4))
                    '(sublist lst 0 4))
  (assert-uim-equal '(1 "2" three (4) 5 six "7")
                    '(sublist lst 0 7))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8))
                    '(sublist lst 0 8))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8) -9)
                    '(sublist lst 0 9))
  (assert-uim-error '(sublist lst 0 10))
  ;; 1
  (assert-uim-error '(sublist lst 1 0))
  (assert-uim-equal '()
                    '(sublist lst 1 1))
  (assert-uim-equal '("2")
                    '(sublist lst 1 2))
  (assert-uim-equal '("2" three)
                    '(sublist lst 1 3))
  (assert-uim-equal '("2" three (4))
                    '(sublist lst 1 4))
  (assert-uim-equal '("2" three (4) 5 six "7")
                    '(sublist lst 1 7))
  (assert-uim-equal '("2" three (4) 5 six "7" (8 8))
                    '(sublist lst 1 8))
  (assert-uim-equal '("2" three (4) 5 six "7" (8 8) -9)
                    '(sublist lst 1 9))
  (assert-uim-error '(sublist lst 1 10))
  ;; 2
  (assert-uim-error '(sublist lst 2 0))
  (assert-uim-error '(sublist lst 2 1))
  (assert-uim-equal '()
                    '(sublist lst 2 2))
  (assert-uim-equal '(three)
                    '(sublist lst 2 3))
  (assert-uim-equal '(three (4))
                    '(sublist lst 2 4))
  (assert-uim-equal '(three (4) 5 six "7")
                    '(sublist lst 2 7))
  (assert-uim-equal '(three (4) 5 six "7" (8 8))
                    '(sublist lst 2 8))
  (assert-uim-equal '(three (4) 5 six "7" (8 8) -9)
                    '(sublist lst 2 9))
  (assert-uim-error '(sublist lst 2 10))
  ;; 3
  (assert-uim-error '(sublist lst 3 0))
  (assert-uim-error '(sublist lst 3 1))
  (assert-uim-error '(sublist lst 3 2))
  (assert-uim-equal '()
                    '(sublist lst 3 3))
  (assert-uim-equal '((4))
                    '(sublist lst 3 4))
  (assert-uim-equal '((4) 5)
                    '(sublist lst 3 5))
  (assert-uim-equal '((4) 5 six "7" (8 8))
                    '(sublist lst 3 8))
  (assert-uim-equal '((4) 5 six "7" (8 8) -9)
                    '(sublist lst 3 9))
  (assert-uim-error '(sublist lst 3 10))
  ;; 8
  (assert-uim-error '(sublist lst 8 0))
  (assert-uim-error '(sublist lst 8 1))
  (assert-uim-error '(sublist lst 8 2))
  (assert-uim-error '(sublist lst 8 3))
  (assert-uim-error '(sublist lst 8 4))
  (assert-uim-error '(sublist lst 8 7))
  (assert-uim-equal '()
                    '(sublist lst 8 8))
  (assert-uim-equal '(-9)
                    '(sublist lst 8 9))
  (assert-uim-error '(sublist lst 8 10))
  ;; 9
  (assert-uim-error '(sublist lst 9 0))
  (assert-uim-error '(sublist lst 9 1))
  (assert-uim-error '(sublist lst 9 2))
  (assert-uim-error '(sublist lst 9 3))
  (assert-uim-error '(sublist lst 9 4))
  (assert-uim-error '(sublist lst 9 7))
  (assert-uim-error '(sublist lst 9 8))
  (assert-uim-equal '()
                    '(sublist lst 9 9))
  (assert-uim-error '(sublist lst 9 10))
  #f)

(define (test-sublist-rel-uim-1.5)
  ;; 0
  (assert-uim-error '(sublist-rel lst 0 -1))
  (assert-uim-equal '()
                    '(sublist-rel lst 0 0))
  (assert-uim-equal '(1)
                    '(sublist-rel lst 0 1))
  (assert-uim-equal '(1 "2")
                    '(sublist-rel lst 0 2))
  (assert-uim-equal '(1 "2" three)
                    '(sublist-rel lst 0 3))
  (assert-uim-equal '(1 "2" three (4))
                    '(sublist-rel lst 0 4))
  (assert-uim-equal '(1 "2" three (4) 5)
                    '(sublist-rel lst 0 5))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8))
                    '(sublist-rel lst 0 8))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 0 9))
  (assert-uim-error '(sublist-rel lst 0 10))
  ;; 1
  (assert-uim-error '(sublist-rel lst 1 -1))
  (assert-uim-equal '()
                    '(sublist-rel lst 1 0))
  (assert-uim-equal '("2")
                    '(sublist-rel lst 1 1))
  (assert-uim-equal '("2" three)
                    '(sublist-rel lst 1 2))
  (assert-uim-equal '("2" three (4))
                    '(sublist-rel lst 1 3))
  (assert-uim-equal '("2" three (4) 5)
                    '(sublist-rel lst 1 4))
  (assert-uim-equal '("2" three (4) 5 six)
                    '(sublist-rel lst 1 5))
  (assert-uim-equal '("2" three (4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 1 8))
  (assert-uim-error '(sublist-rel lst 1 9))
  (assert-uim-error '(sublist-rel lst 1 10))
  ;; 2
  (assert-uim-error '(sublist-rel lst 2 -1))
  (assert-uim-equal '()
                    '(sublist-rel lst 2 0))
  (assert-uim-equal '(three)
                    '(sublist-rel lst 2 1))
  (assert-uim-equal '(three (4))
                    '(sublist-rel lst 2 2))
  (assert-uim-equal '(three (4) 5)
                    '(sublist-rel lst 2 3))
  (assert-uim-equal '(three (4) 5 six)
                    '(sublist-rel lst 2 4))
  (assert-uim-equal '(three (4) 5 six "7")
                    '(sublist-rel lst 2 5))
  (assert-uim-equal '(three (4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 2 7))
  (assert-uim-error '(sublist-rel lst 2 8))
  (assert-uim-error '(sublist-rel lst 2 9))
  (assert-uim-error '(sublist-rel lst 2 10))
  ;; 3
  (assert-uim-error '(sublist-rel lst 3 -1))
  (assert-uim-equal '()
                    '(sublist-rel lst 3 0))
  (assert-uim-equal '((4))
                    '(sublist-rel lst 3 1))
  (assert-uim-equal '((4) 5)
                    '(sublist-rel lst 3 2))
  (assert-uim-equal '((4) 5 six)
                    '(sublist-rel lst 3 3))
  (assert-uim-equal '((4) 5 six "7")
                    '(sublist-rel lst 3 4))
  (assert-uim-equal '((4) 5 six "7" (8 8))
                    '(sublist-rel lst 3 5))
  (assert-uim-equal '((4) 5 six "7" (8 8) -9)
                    '(sublist-rel lst 3 6))
  (assert-uim-error '(sublist-rel lst 3 7))
  (assert-uim-error '(sublist-rel lst 3 8))
  (assert-uim-error '(sublist-rel lst 3 9))
  ;; 8
  (assert-uim-error '(sublist-rel lst 8 -1))
  (assert-uim-equal '()
                    '(sublist-rel lst 8 0))
  (assert-uim-equal '(-9)
                    '(sublist-rel lst 8 1))
  (assert-uim-error '(sublist-rel lst 8 2))
  (assert-uim-error '(sublist-rel lst 8 3))
  (assert-uim-error '(sublist-rel lst 8 4))
  (assert-uim-error '(sublist-rel lst 8 5))
  (assert-uim-error '(sublist-rel lst 8 6))
  (assert-uim-error '(sublist-rel lst 8 7))
  (assert-uim-error '(sublist-rel lst 8 8))
  (assert-uim-error '(sublist-rel lst 8 9))
  ;; 9
  (assert-uim-error '(sublist-rel lst 9 -1))
  (assert-uim-equal '()
                    '(sublist-rel lst 9 0))
  (assert-uim-error '(sublist-rel lst 9 1))
  (assert-uim-error '(sublist-rel lst 9 2))
  (assert-uim-error '(sublist-rel lst 9 3))
  (assert-uim-error '(sublist-rel lst 9 4))
  (assert-uim-error '(sublist-rel lst 9 5))
  (assert-uim-error '(sublist-rel lst 9 6))
  (assert-uim-error '(sublist-rel lst 9 7))
  (assert-uim-error '(sublist-rel lst 9 8))
  (assert-uim-error '(sublist-rel lst 9 9))
  #f)

(define (test-list-head)
  (assert-uim-equal '()
                    '(list-head lst 0))
  (assert-uim-equal '(1)
                    '(list-head lst 1))
  (assert-uim-equal '(1 "2")
                    '(list-head lst 2))
  (assert-uim-equal '(1 "2" three)
                    '(list-head lst 3))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8))
                    '(list-head lst 8))
  (assert-uim-equal '(1 "2" three (4) 5 six "7" (8 8) -9)
                    '(list-head lst 9))
  (assert-uim-error '(list-head lst 10))
  (assert-uim-error '(list-head lst -1))
  #f)

(define (test-alist-replace)
  (uim '(define alist ()))
  (uim '(set! alist (alist-replace '(first 1 "1") alist)))
  (assert-uim-equal '((first 1 "1"))
                    'alist)
  (uim '(set! alist (alist-replace '(second 2 "2") alist)))
  (assert-uim-equal '((second 2 "2") (first 1 "1"))
                    'alist)
  (uim '(set! alist (alist-replace '(third 3 "3") alist)))
  (assert-uim-equal '((third 3 "3") (second 2 "2") (first 1 "1"))
                    'alist)
  (uim '(set! alist (alist-replace '(second two "two") alist)))
  (assert-uim-equal '((third 3 "3") (second two "two") (first 1 "1"))
                    'alist)
  #f)

(define (test-list-join)
  (assert-uim-equal '()
                    '(list-join () ()))
  (assert-uim-equal '(())
                    '(list-join '(()) ()))
  (assert-uim-equal '(1)
                    '(list-join '(1) ()))
  (assert-uim-equal '(() () ())
                    '(list-join '(() ()) ()))
  (assert-uim-equal '(1 () 2)
                    '(list-join '(1 2) ()))
  (assert-uim-equal '(1 () 2 () 3)
                    '(list-join '(1 2 3) ()))
  (assert-uim-equal '(one () two () three)
                    '(list-join '(one two three) ()))
  (assert-uim-equal '("1" () "2" () "3")
                    '(list-join '("1" "2" "3") ()))
  (assert-uim-equal '(() () () () ())
                    '(list-join '(() () ()) ()))

  (assert-uim-equal '()
                    '(list-join () "/"))
  (assert-uim-equal '(())
                    '(list-join '(()) "/"))
  (assert-uim-equal '(1)
                    '(list-join '(1) "/"))
  (assert-uim-equal '(() "/" ())
                    '(list-join '(() ()) "/"))
  (assert-uim-equal '(1 "/" 2)
                    '(list-join '(1 2) "/"))
  (assert-uim-equal '(1 "/" 2 "/" 3)
                    '(list-join '(1 2 3) "/"))
  (assert-uim-equal '(one "/" two "/" three)
                    '(list-join '(one two three) "/"))
  (assert-uim-equal '("1" "/" "2" "/" "3")
                    '(list-join '("1" "2" "3") "/"))
  (assert-uim-equal '(() "/" () "/" ())
                    '(list-join '(() () ()) "/"))
  #f)

(define (test-nthcdr)
  (uim-eval '(define lst '(1 2 3 4)))
  (assert-uim-equal '(1 2 3 4)
                    '(nthcdr 0 lst))
  (assert-uim-equal '(2 3 4)
                    '(nthcdr 1 lst))
  (assert-uim-equal '(3 4)
                    '(nthcdr 2 lst))
  (assert-uim-equal '(4)
                    '(nthcdr 3 lst))
  (assert-uim-equal ()
                    '(nthcdr 4 lst))
  (assert-uim-equal #f
                    '(nthcdr 5 lst))
  #f)

(provide "test/util/test-list")
