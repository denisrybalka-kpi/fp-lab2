(defun merge-lists-spinning-pairs (list1 list2)
  (cond
    ((and (null list1) (null list2)) nil)  ; Якщо обидва списки порожні, повертаємо nil
    ((null list1) 
     (cons (list (car list2)) (merge-lists-spinning-pairs nil (cdr list2))))  ; Якщо перший список порожній
    ((null list2) 
     (cons (list (car list1)) (merge-lists-spinning-pairs (cdr list1) nil)))  ; Якщо другий список порожній
    (t 
     (cons (list (car list1) (car list2)) 
           (merge-lists-spinning-pairs (cdr list2) (cdr list1))))))  ; Обробляємо елементи з обох списків
           
(defun pretty-print-test (test-num result expected)
  (format t "Test ~a: " test-num)
  (if (equal result expected)
      (format t "Passed!~%")
      (format t "Failed!~%  Expected: ~a~%  Got: ~a~%" expected result)))

(defun run-tests ()
  (let ((test1 (merge-lists-spinning-pairs '(1 2 3 4 5) '(a b c d)))
        (test2 (merge-lists-spinning-pairs '(1 2) '(a b c d e)))
        (test3 (merge-lists-spinning-pairs '() '(x y z)))
        (test4 (merge-lists-spinning-pairs '(1) '(a))))
    (pretty-print-test 1 test1 '((1 A) (B 2) (3 C) (D 4) (5)))
    (pretty-print-test 2 test2 '((1 A) (B 2) (C) (D) (E)))
    (pretty-print-test 3 test3 '((X) (Y) (Z)))
    (pretty-print-test 4 test4 '((1 A)))))

(run-tests)
