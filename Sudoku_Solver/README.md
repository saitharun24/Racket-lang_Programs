# Sudoku Solver in Racket Lang
#### Problem Statement
<blockquote>
Your task is to build a Sudoku solver in Racket.  

The problem details are as below.
The given board size is 9 x 9 (though you can try solving for smaller size boards!!) 

The board should contain only digits from 1 to 9 or an empty slot (you can represent the empty slot with any special character of your choice). 

Consider the initial configuration of the board (partly filled and partly empty) such that it has got a single unique solution (to help with your strategy!!) 

Given a full board (with no empty slot) your program shall determine whether the given configuration is a valid sudoku solution. 

The sudoku solution must satisfy all the following conditions 
1. Each of the digits 1-9 must occur exactly once in each row. 
2. Each of the digits 1-9 must occur exactly once in each column. 
3. Each of the the digits 1-9 must occur exactly once in each of the nine 3x3 sub-boxes of the grid. 
</blockquote>
<br>

*Given solution is based on simple systematic backtracking algorithm.*

#### Steps involved in the algorithm
1. Load the unsolved board either by having the user input the values, or reading from a ".txt" or ".csv" file, or from the predefined example boards.
2. Read the rows one by one from left to right and top to bottom, starting with first row and first column. 
3. If the cell is blank (here we are using 0 to denote a black cell), try to put numbers 1-9. 
4. Each number is checked that it should not be present in that row, column or subgrid. 
5. If no such number is found, the loop will return to previous level (previous empty cell) and try next number there. 
6. Once a suitable number is found, it is placed at the cell and the loop is started again with next column (if columns are over, it moves over to first column of next row). 
7. If all rows and columns are done, it means a solution has been reached and the solution is printed.

#### Procedural abstractions used here
1. **print_board** - Used to print the board
2. **get_num** - Used to get the number present in the current cell
3. **get_set** - Used to get the index set of the rows or columns of the grid the particular cell is located in
4. **subgrid** - Used to return the list of all values present in the subgrid the particular cell is located in
5. **check_num?** - Used to check if the number being placed in the particular cell is valid
6. **input_user_board** - Used to take the board as a cell by cell input from the user
7. **length** - Used to return the length of the given list 
8. **read-iter** - Used to read value from the user by checking if the value is a consistent value or not (by consistent we mean that the value should follow the 3 sudoku conditions)
9. **val-iter** - Used to append the values to the respective cell
10. **readfile** - Used to read the contents of the file, specified by the path of the file.
11. **load_user_board** - Used to load the board read from the file using the procedure *readfile*
<br>

You can upload the board you want solved as a ".txt" file or a ".csv" file. 
Just give the location of the file in the format given below

```racket
> (Sudoku_solver (user_board "/path/..../filename"))
```


#### Sample Input 
```racket
> (Sudoku_solver (user_board "/unsolved_sudoku.csv"))
```

#### Sample Output
```racket
The file chosen is a ".csv" file.

Selected Board is 
'(3 0 6 5 0 8 4 0 0)
'(5 2 0 0 0 0 0 0 0)
'(0 8 7 0 0 0 0 3 1)
'(0 0 3 0 1 0 0 8 0)
'(9 0 0 8 6 3 0 0 5)
'(0 5 0 0 9 0 6 0 0)
'(1 3 0 0 0 0 2 5 0)
'(0 0 0 0 0 0 0 7 4)
'(0 0 5 2 0 6 3 0 0)


Solution obtained:
'(3 1 6 5 7 8 4 9 2)
'(5 2 9 1 3 4 7 6 8)
'(4 8 7 6 2 9 5 3 1)
'(2 6 3 4 1 5 9 8 7)
'(9 7 4 8 6 3 1 2 5)
'(8 5 1 7 9 2 6 4 3)
'(1 3 8 9 4 7 2 5 6)
'(6 9 2 3 5 1 8 7 4)
'(7 4 5 2 8 6 3 1 9)

```
<br>


*If you want to just test the code out a set of 6 boards (board1 to board6) are initialised and given along with the code itself, with varying level of difficulty.*

#### Sample Input 1
```racket
> (Sudoku_solver board1)
```

#### Sample Output 1
```racket
Selected Board is 
'(5 3 0 0 7 0 0 0 0)
'(6 0 0 1 9 5 0 0 0)
'(0 9 8 0 0 0 0 6 0)
'(8 0 0 0 6 0 0 0 3)
'(4 0 0 8 0 3 0 0 1)
'(7 0 0 0 2 0 0 0 6)
'(0 6 0 0 0 0 2 8 0)
'(0 0 0 4 1 9 0 0 5)
'(0 0 0 0 8 0 0 7 9)


Solution obtained:
'(5 3 4 6 7 8 9 1 2)
'(6 7 2 1 9 5 3 4 8)
'(1 9 8 3 4 2 5 6 7)
'(8 5 9 7 6 1 4 2 3)
'(4 2 6 8 5 3 7 9 1)
'(7 1 3 9 2 4 8 5 6)
'(9 6 1 5 3 7 2 8 4)
'(2 8 7 4 1 9 6 3 5)
'(3 4 5 2 8 6 1 7 9)

```

#### Sample Input 2
```racket
> (Sudoku_solver board5)
```

#### Sample Output 2
```racket
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
