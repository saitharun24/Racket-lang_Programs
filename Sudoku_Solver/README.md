# Sudoku Solver in Racket Lang

It is based on simple systematic backtracking algorithm.

#### Steps involved in the algorithm
1. Read the rows one by one from left to right and top to bottom, starting with first row and first column. 
2. If the cell is blank (here we are using 0 to denote a black cell), try to put numbers 1-9. 
3. Each number is checked that it should not be present in that row, column or subgrid. 
4. If no such number is found, the loop will return to previous level (previous empty cell) and try next number there. 
5. Once a suitable number is found, it is placed at the site and the loop is started again with next column (if columns are over, it moves over to first column of next row). 
6. If all rows and columns are done, it means a solution has been reached and the solution is printed.

#### Procedural abstractions used here
1. **print_board** - Used to print the board
2. **get_num** - Used to get the number present in the current cell
3. **get_set** - Used to get the index set of the rows or columns of the grid the particular cell is located in
4. **subgrid** - Used to return the list of all values present in the subgrid the particular cell is located in
5. **check_num?** - Used to check if the number being placed in the particular cell is valid
<br>

*A set of 5 boards are defined, along with the code itself, with varying level of difficulty to test the working of the code.*

#### Sample Input 1
```
> (Sudoku_solver board1)
```

#### Sample Output 1
```
Selected Board is 
'(0 0 3 0 2 0 6 0 0)
'(9 0 0 3 0 5 0 0 1)
'(0 0 1 8 0 6 4 0 0)
'(0 0 8 1 0 2 9 0 0)
'(7 0 0 0 0 0 0 0 8)
'(0 0 6 7 0 8 2 0 0)
'(0 0 2 6 0 9 5 0 0)
'(8 0 0 2 0 3 0 0 9)
'(0 0 5 0 1 0 3 0 0)


Solution obtained:
'(4 8 3 9 2 1 6 5 7)
'(9 6 7 3 4 5 8 2 1)
'(2 5 1 8 7 6 4 9 3)
'(5 4 8 1 3 2 9 7 6)
'(7 2 9 5 6 4 1 3 8)
'(1 3 6 7 9 8 2 4 5)
'(3 7 2 6 8 9 5 1 4)
'(8 1 4 2 5 3 7 6 9)
'(6 9 5 4 1 7 3 8 2)

```

#### Sample Input 2
```
> (Sudoku_solver board5)
```

#### Sample Output 2
```
Selected Board is 
'(0 0 0 9 7 0 0 0 0)
'(0 4 0 2 5 0 1 0 7)
'(0 0 7 6 0 0 4 0 3)
'(0 1 2 8 0 0 6 0 0)
'(9 7 0 0 4 0 0 3 5)
'(0 0 4 0 0 2 9 1 0)
'(2 0 1 0 0 7 5 0 0)
'(4 0 9 0 8 1 0 6 0)
'(0 0 0 0 2 9 0 0 0)


Solution obtained:
'(1 2 3 9 7 4 8 5 6)
'(8 4 6 2 5 3 1 9 7)
'(5 9 7 6 1 8 4 2 3)
'(3 1 2 8 9 5 6 7 4)
'(9 7 8 1 4 6 2 3 5)
'(6 5 4 7 3 2 9 1 8)
'(2 8 1 3 6 7 5 4 9)
'(4 3 9 5 8 1 7 6 2)
'(7 6 5 4 2 9 3 8 1)
```
