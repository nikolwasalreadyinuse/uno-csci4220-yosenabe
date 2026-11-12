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

#show target/4.
