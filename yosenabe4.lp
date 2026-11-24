%% Your code here
%, = and
%$; = or
%restricting X and Y values to a starting number position, restricting destination to a gray square, and then either X or Y can be different, but not both at the same time.

%% The destination must have either the original X value or the original Y value of the number's starting position
destination(X,Y,XX,YY) :- number(X,Y,N), area(XX,YY,A), X = XX.
destination(X,Y,XX,YY) :- number(X,Y,N), area(XX,YY,A), Y = YY.

% the colon means only consider targets when destination is true
%exactly one target MUST be selected, per number.
1 { target(X,Y,XX,YY) : destination(X,Y,XX,YY) } 1 :- number(X,Y,N).

%BEGINNING OF QUESTION 2:
% according to instructions: target(X,Y,XX,YY) = a number in cell (X,Y) is moved to the cell (XX, YY).
%a helper predicate which determines if a target has been filled. 
has_target(A) :- target(X,Y,XX,YY), area(XX,YY,A).

%we negate has_target(A) to eliminate solutions that do not fill all the target squares.
:- area(X,Y,A), not has_target(A).

%BEGINNING OF QUESTION 3:

% identify every cell along a horizontal path
%X, Y = starting position; XX, YY = destination; PX, PY = a cell along the path.

path(X,Y, XX, YY, PX, Y) :- target(X,Y,XX,YY), cell(PX,Y), PX >= X, PX <= XX.
path(X,Y, XX, YY, PX, Y) :- target(X,Y,XX,YY), cell(PX,Y), PX <= X, PX >= XX.

% identify every cell along a vertical path

path(X,Y, XX, YY, X, PY) :- target(X,Y,XX,YY), cell(X,PY), PY >= Y, PY <= YY.
path(X,Y, XX, YY, X, PY) :- target(X,Y,XX,YY), cell(X,PY), PY <= Y, PY >= YY.

%make sure the paths do not cross
:- path(X,Y, XX, YY, PX, PY), path(A,B, AA, BB, PX, PY), X != A.
:- path(X,Y, XX, YY, PX, PY), path(A,B, AA, BB, PX, PY), Y != B.

%BEGINNING OF QUESTION 4:
%make sure the goal value V for area A is equal to the sum of all the numbers that end up in area A.
%goal = the required sum of every value N with a unique starting place that ends up area A.
:- goal(A,V), V != #sum { N, XX, YY : target(XX,YY,X,Y), number(XX,YY,N), area(X,Y,A) }.

#show target/4.