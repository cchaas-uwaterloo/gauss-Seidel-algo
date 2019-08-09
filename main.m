%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Class: MTE 204
%Description: Project 1 Gauss-Seidel approximations for resistor circuit networks
%Author: Cameron Haas
%Date: June 1, 2019
%Note: See attached report for circuit diagrams and resistor and node
%      designations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%globals 
gStop_Error = 0.001;  %for convergence to 5 significant digits
gMax_i = 1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Circuit 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\nCIRCUIT 1\n\n');

%%%%%
% Equation Set (using nodal analysis to solve for potential at nodes):
% v1 = 200;
% -2v1 + 7v2 - v3 - 4v5 = 0
% v2 - 11v3 + 10v4 = 0
% 5v3 - 7v4 + 2v5 = 0
% 5v2 + 5v4 - 11v5 = 0
% v6 = 0;
%
%%%%%

%Define coefficient matrix, b-vector and intial guesses for GS sltn
a = [1 0 0 0 0 0 ; -2 7 -1 0 -4 0 ; 0 1 -11 10 0 0 ; 0 0 5 -7 2 0 ; 0 5 0 5 -11 0 ; 0 0 0 0 0 1];
b = [200;0;0;0;0;0];
g = [1;1;1;1;1;1];
g1 = [100;100;100;100;100;100];

%GS solution using lambda = 1
gauss_Seidel_Solution1 = gauss_Seidel(a,b,6,g,gMax_i,gStop_Error,1)

%GS solution using lambda = 0.8
gauss_Seidel_Solution2 = gauss_Seidel(a,b,6,g,gMax_i,gStop_Error,0.8)

%GS solution using lambda = 1.2
gauss_Seidel_Solution3 = gauss_Seidel(a,b,6,g,gMax_i,gStop_Error,1.2)

%GS solution using different intial guesses
gauss_Seidel_Solution4 = gauss_Seidel(a,b,6,g1,gMax_i,gStop_Error,1)

%linsolve solution 
fprintf('The direct solution calculated by the linsolve function is:\n');
direct_Solution = linsolve(a,b)

%map solution vector to node voltages, use gauss_Seidel_Solution1 and
%circuit diagram

fprintf('This gives the voltages at each node of the circuit (in V):\n');

v1 = gauss_Seidel_Solution1(1)
v2 = gauss_Seidel_Solution1(2)
v3 = gauss_Seidel_Solution1(3)
v4 = gauss_Seidel_Solution1(4)
v5 = gauss_Seidel_Solution1(5)
v6 = gauss_Seidel_Solution1(6)

%Use Ohms law to solve for the currents through each resistor 
fprintf('Using Ohms Law, the current through each resistor in the circuit is (in A):\n');
I_R1 = (v1-v2)/10
I_R2 = (v2-v3)/20
I_R3 = (v3-v4)/2
I_R4 = (v4-v5)/5
I_R5 = (v2-v5)/5
I_R6 = (v5-v6)/25

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Circuit 3 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\nCIRCUIT 3\n\n');

%%%%%
% Equation Set (using nodal analysis to solve for potential at nodes):
% v1 = 0
% -v1 + v2 = 80
% v1 + 3v2 - 5.5v3 + 1.5v4 = 0
% 2.5v3 - 4.75v4 + 1.25v5 = 0
% -v1 + v5 = 50
%%%%%

%Define coefficient matrix, b-vector and intial guesses for GS sltn
a = [ 1 0 0 0 0 ; -1 1 0 0 0 ;  1 3 -5.5 1.5 0 ;  1.25 0 2.5 -4.75 1.25 ; -1 0 0 0 1]
b = [0;80;0;0;50];
g = [1;1;1;1;1];
g1 = [100;100;100;100;100];

%GS solution using lambda = 1
gauss_Seidel_Solution1_2 = gauss_Seidel(a,b,5,g,gMax_i,gStop_Error,1)

%GS solution using lambda = 0.8
gauss_Seidel_Solution2_2 = gauss_Seidel(a,b,5,g,gMax_i,gStop_Error,0.8)

%GS solution using lambda = 1.2
gauss_Seidel_Solution3_2 = gauss_Seidel(a,b,5,g,gMax_i,gStop_Error,1.2)

%GS solution using different intial guesses
gauss_Seidel_Solution4_2 = gauss_Seidel(a,b,5,g1,gMax_i,gStop_Error,1)

%linsolve solution 
fprintf('The direct solution calculated by the linsolve function is:\n');
direct_Solution_2 = linsolve(a,b)

%map solution vector to node voltages, use gauss_Seidel_Solution1 and
%circuit diagram

fprintf('This gives the voltages at each node of the circuit (in V):\n');

v1 = gauss_Seidel_Solution1_2(1)
v2 = gauss_Seidel_Solution1_2(2)
v3 = gauss_Seidel_Solution1_2(3)
v4 = gauss_Seidel_Solution1_2(4)
v5 = gauss_Seidel_Solution1_2(5)

%Use Ohms law to solve for the currents through each resistor 
fprintf('Using Ohms Law, the current through each resistor in the circuit is (in A):\n');
I_R1 = (v2-v3)/10
I_R2 = (v3-v1)/20
I_R3 = (v3-v4)/2
I_R4 = (v4-v1)/5
I_R5 = (v5-v4)/5








