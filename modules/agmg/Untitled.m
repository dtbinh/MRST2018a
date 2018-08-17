m=50; A=delsq(numgrid('S',m+2)); n=m*m; b=ones(n,1);
x=agmg(A,b,1);         % A is symmetric positive definite
x=agmg(A,b);           % Consider A as a general matrix
x=agmg(A,b,1,[],[],1); % Verbose output
% Example of tolerance below attainable accuracy:
[x,flag,relres,iter,resvec]=agmg(A,b,1,1e-20,[],1);
% agmg report normal convergence:
disp('Convergence flag = '),disp(flag)
% The relative residual is nevertheless larger than TOL
% (and than reported by the verbose output):
disp('Relative residual = '),disp(relres)
% But the attained accuracy is similar to the one obtained with "\":
y=A\b;
disp('Relative residual with "\" = '),disp(norm(A*y-b)/norm(b))