clear

s = tf('s');
%s = sym('s');

Sy_R1 = sym('Sy_R1', 'real');
Sy_R2 = sym('Sy_R2', 'real');
Sy_R3 = sym('Sy_R3', 'real');
Sy_R4 = sym('Sy_R4', 'real');
Sy_R5 = sym('Sy_R5', 'real');
Sy_R6 = sym('Sy_R6', 'real');
Sy_R7 = sym('Sy_R7', 'real');


%??? is npn transistor
%??? is pnp transistor

V_in = sym('V_in', 'real');

omega = 10 * 10^3;
omega = (2*pi)*omega;
C1 = 0 * 10^-12;

R1 = 1 * 10^3;
R2 = 2.4 * 10^3;

R9 = 1 * 10^3;
%R10 = 1 * 10^3;
R10 = sym('R10','real');

V_logic = 5;
V_amp = 12;
V_ref = V_amp * R10 / (R9 + R10);

V_out = (V_ref * (1+R2/R1)) - ((R2/R1)*(1/(1 + R2*C1*omega))*V_in);
R10_sol = double(solve(V_amp/2.0 == subs(V_out, V_in, V_logic/2.0), R10));

%V_out = (V_logic-V_in)* V_amp/V_logic;
%R2_sol = solve(V_ref == ((V_out-V_in)/(R1+R2))*R1 + V_in, R2);


