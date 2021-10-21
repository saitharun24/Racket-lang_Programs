#lang racket
(define (Sudoku_solver board)

  ;Function to print the board
  (define (print_board b disp)
    (displayln disp)
    (for ((rowline b)) (println rowline))
    (displayln "\n"))

  
  ;Function to print the initial board configuration
  (let initial_board ((b board) (d "Selected Board is ")) (print_board b d))

  
  ;Function to the get the individual number from the list of list
  (define (get_num l x y) (list-ref (list-ref l x) y))

  
  ;Function to get the index set of the rows or columns of the grid the particular cell is located in
  (define (get_set x)
    (define L '((0 1 2)(3 4 5)(6 7 8)))
    (flatten(filter (lambda(y)(member x y)) L)))

  
  ;Function to get the list of all values of the subgrid (the 3x3 block that our number is currently in)
  (define (subgrid b r c)
    (define-values (rr cc) (values (get_set r) (get_set c)))
    (for*/list ((i rr)(j cc)) (get_num b i j)))

  
  ;Function to check if the number being placed in the particular cell is valid 
  (define (check_num? b i r c)
    (or (member i (list-ref b r))                                               ;Check if the number is already in the same row
        (member i (map (lambda(x)(list-ref x c)) b))                            ;Check if the number is already in the same column
        (member i (subgrid b r c))))                                            ;Check if the number is already in the grid

  
  ;Main procedure where the backtracking happens
  (let loop ((b board) (row 0) (col 0))
    (let ((next (lambda(block)
                  (cond [(< col 8) (loop block row (add1 col))]                 ;Iterating the columns one by one 
                        [(< row 8) (loop block (add1 row) 0)]                   ;Iterating the rows one by one
                        [else (print_board block "Solution obtained:")]))))     ;Printing the board once every cell has been traversed
      (if (= 0 (get_num b row col))                                             ;Check if the cell is empty
          (begin (for ((i (range 1 10)))                                        ;If the cell is empty then place values from 1 till 9 while checking whether the particular value can be placed in the cell 
                   (unless(check_num? b i row col)                              ;Checking if the value can be placed
                     (define block                                              ;If yes then placing the value in the particular cell and then go to the next cell
                       (list-set b row (list-set (list-ref b row) col i)))
                     (next block))))
          (next b)))))                                                          ;If the cell already has a value then we go to the next cell



;Initializing a few boards to test our program
(define board1
   '((0 0 3 0 2 0 6 0 0)
    (9 0 0 3 0 5 0 0 1)
    (0 0 1 8 0 6 4 0 0)
    (0 0 8 1 0 2 9 0 0)
    (7 0 0 0 0 0 0 0 8)
    (0 0 6 7 0 8 2 0 0)
    (0 0 2 6 0 9 5 0 0)
    (8 0 0 2 0 3 0 0 9)
    (0 0 5 0 1 0 3 0 0)))

(define board2
   '((3 9 4 0 0 2 6 7 0)
    (0 0 0 3 0 0 4 0 0)
    (5 0 0 6 9 0 0 2 0)
    (0 4 5 0 0 0 9 0 0)
    (6 0 0 0 0 0 0 0 7)
    (0 0 7 0 0 0 5 8 0)
    (0 1 0 0 6 7 0 0 8)
    (0 0 9 0 0 8 0 0 0)
    (0 2 6 4 0 0 7 3 5)))

(define board3
  '((0 0 0 6 0 0 4 0 0) 
    (7 0 0 0 0 3 6 0 0) 
    (0 0 0 0 9 1 0 8 0) 
    (0 0 0 0 0 0 0 0 0) 
    (0 5 0 1 8 0 0 0 3) 
    (0 0 0 3 0 6 0 4 5) 
    (0 4 0 2 0 0 0 6 0) 
    (9 0 3 0 0 0 0 0 0) 
    (0 2 0 0 0 0 1 0 0)))

(define board4
   '((0 0 0 2 6 0 7 0 1) 
    (6 8 0 0 7 0 0 9 0) 
    (1 9 0 0 0 4 5 0 0) 
    (8 2 0 1 0 0 0 4 0) 
    (0 0 4 6 0 2 9 0 0) 
    (0 5 0 0 0 3 0 2 8) 
    (0 0 9 3 0 0 0 7 4) 
    (0 4 0 0 5 0 0 3 6) 
    (7 0 3 0 1 8 0 0 0)))

(define board5
  '((0 0 0 9 7 0 0 0 0) 
    (0 4 0 2 5 0 1 0 7) 
    (0 0 7 6 0 0 4 0 3) 
    (0 1 2 8 0 0 6 0 0) 
    (9 7 0 0 4 0 0 3 5) 
    (0 0 4 0 0 2 9 1 0) 
    (2 0 1 0 0 7 5 0 0) 
    (4 0 9 0 8 1 0 6 0) 
    (0 0 0 0 2 9 0 0 0)))
             
