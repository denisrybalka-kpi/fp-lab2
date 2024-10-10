<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/> "Рекурсія"<br/>
дисципліни "Вступ до функціонального програмування" </p>
<p align="right"><b>Студент</b>: Рибалка Денис Віталійович</p> <p align="right"><b>Рік</b>: 2024</p>

## Загальне завдання

Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:

Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового списку, а не зміни наявного (вхідного).
Не допускається використання функцій вищого порядку чи стандартних функцій для роботи зі списками, що не наведені в четвертому розділі навчального посібника.
Реалізована функція не має бути функцією вищого порядку, тобто приймати функції в якості аргументів.
Не допускається використання псевдофункцій (деструктивного підходу).
Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести мають бути оформленні у вигляді модульних тестів (див. п. 2.3).

Додатковий бал за лабораторну роботу можна отримати в разі виконання всіх наступних умов:

- робота виконана до дедлайну (включно з датою дедлайну)

- крім основних реалізацій функцій за варіантом, також реалізовано додатковий варіант однієї чи обох функцій, який працюватиме швидше за основну реалізацію, не порушуючи при цьому перші три вимоги до основної реалізації (вимоги 4 і 5 можуть бути порушені), за виключенням того, що в разі необхідності можна також використати стандартну функцію copy-list

## Варіант 21 (6)

## Лістинг функції merge-lists-spinning-pairs
Написати функцію `merge-lists-spinning-pairs` , яка групує відповідні елементи двох списків, почергово змінюючи їх взаємне розташування в групі:
```lisp
(defun merge-lists-spinning-pairs (list1 list2)
  (cond
    ((and (null list1) (null list2)) nil)  ; Якщо обидва списки порожні, повертаємо nil
    ((null list1) 
     (cons (list (car list2)) (merge-lists-spinning-pairs nil (cdr list2))))  ; Якщо перший список порожній
    ((null list2) 
     (cons (list (car list1)) (merge-lists-spinning-pairs (cdr list1) nil)))  ; Якщо другий список порожній
    (t 
     (cons (list (car list1) (car list2)) 
           (merge-lists-spinning-pairs (cdr list1) (cdr list2))))))  ; Обробляємо елементи з обох списків
 ```
## Тестування
```lisp
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
    (pretty-print-test 1 test1 '((1 A) (2 B) (3 C) (4 D) (5)))
    (pretty-print-test 2 test2 '((1 A) (2 B) (C) (D) (E)))
    (pretty-print-test 3 test3 '((X) (Y) (Z)))
    (pretty-print-test 4 test4 '((1 A)))))

(run-tests)
 ```
```
Output:

Test 1: Passed!
Test 2: Passed!
Test 3: Passed!
Test 4: Passed!
```
## Лістинг функції list-set-intersect-p
Написати предикат `list-set-intersect-p`, який визначає чи перетинаються дві множини, задані списками атомів, чи ні:

```lisp
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
```
## Тестування
```lisp
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
```
```
Test 1: Passed!
Test 2: Passed!
Test 3: Passed!
Test 4: Passed!
Test 5: Passed!
```
