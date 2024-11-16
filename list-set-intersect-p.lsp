(defun elem-in-set-p (elem set)
  (cond
    ((null set) nil)                      ; Якщо список порожній, повертаємо nil
    ((eql elem (car set)) t)               ; Якщо знайшли елемент, повертаємо t
    (t (elem-in-set-p elem (cdr set)))))   ; Інакше рекурсивно перевіряємо решту списку

(defun list-set-intersect-p (set1 set2)
  (cond
    ((null set1) nil)                      ; Якщо перший список порожній, повертаємо nil
    ((elem-in-set-p (car set1) set2) t)    ; Якщо перший елемент set1 є в set2, повертаємо t
    (t (list-set-intersect-p (cdr set1) set2))))  ; Інакше перевіряємо решту елементів set1
    
(defun pretty-print-test (test-num result expected)
  (format t "Test ~a: " test-num)
  (if (equal result expected)
      (format t "Passed!~%")
      (format t "Failed!~%  Expected: ~a~%  Got: ~a~%" expected result)))

(defun run-tests ()
  (let ((test1 (list-set-intersect-p '(1 2 3 4) '(5 6 7)))
        (test2 (list-set-intersect-p '(1 2 3) '(3 4 5)))
        (test3 (list-set-intersect-p '() '(x y z)))
        (test4 (list-set-intersect-p '(a b c) '(d e f)))
        (test5 (list-set-intersect-p '(1) '(1))))
    (pretty-print-test 1 test1 nil)  
    (pretty-print-test 2 test2 t)    
    (pretty-print-test 3 test3 nil)   
    (pretty-print-test 4 test4 nil)   
    (pretty-print-test 5 test5 t)))

(run-tests)
