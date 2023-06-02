function [C_CO2] = run7Box(t,gamma,delta,varargin)
% [C_CO2] = run7Box(t,gamma,delta,varargin)calculates the carbon concentration in seven 
% different boxes representing various parts of the carbon cycle, including 
% atmosphere, surface and deep oceans, intermediate oceans, sediment, 
% biosphere, and soil. The function uses a seven-box carbon cycle model based
% on the work of Tomizuka (2009). The model simulates the exchange of carbon 
% between the seven boxes based on their respective transfer rates, and 
% human-induced changes such as land-use changes, CO2 emissions, and 
% atmospheric concentration.
% 
% Inputs
% 
%     *t: A 1D vector of time steps in years.
%     *gamma:  A 1D vector of CO2 emissions into the atmosphere in PgC/year.
%     *delta:  A 1D vector of changes in land use in PgC/year.
%     *varargin:  Optional input arguments to modify default parameter values.
%       The arguments are provided in the form of name-value pairs.
% 
% Optional Inputs
%     *beta - A scalar value representing the control parameter. The default
%       value is 0.42.
%     *f0 - A scalar value representing the pre-industrial value of the net 
%       primary productivity. The default value is 62 PgC/year.
%     *buffer - A scalar value which should be 1 or zero. 
%       The default value is 1, which means that the buffer factor is 
%       calculated.
%
% 
% Outputs
% 
%     *C_CO2 - A 7xN matrix where N is the length of the time vector t, 
% representing the concentration of carbon in each of the seven boxes over time.
% 
% References
% 
% [1] Tomizuka, A. (2009). Is a box model effective for understanding the 
% carbon cycle?. American Journal of Physics, 77(2), 156-163.
% 
% Author: E. Cheynet - UiB - Last modified: 05-05-2023


%% Inputparseer
p = inputParser();
p.CaseSensitive = false;
p.addOptional('beta',0.42); % control parameter
p.addOptional('f0',62); % PgC/ year
p.addOptional('buffer',1); % PgC/ year
p.parse(varargin{:});

f0 = p.Results.f0;
beta = p.Results.beta;
buffer = p.Results.buffer;

%% Initialisation
% Approximation of the buffer factor
getZeta =  @(z) 3.69 + 1.86e-2.*z - 1.8e-6.*z;

% Initial values
C = [615,842,9744,26280,90000000,731,1238]';

Nbox = 7;
N = numel(t);
dt = median(diff(t));
C_CO2 = zeros(Nbox,N); % CO2 concentration in eahc of the seven boxes
C_CO2(:,1) = C; % Initial value

k12 = 60; 
%% Main loop
for ii = 2:N

    
    if buffer==0
        zeta = 1; % No buffer factor
    elseif buffer==1
        zeta = getZeta(C_CO2(1,ii-1)/2.13);% Get buffer factor. The concentration has to be in ppm here
    else
        error('buffer must be 1 or 0');
    end

    % CO 2 uptake by the terrestrial biosphere and CO2 emission by land-use
    % change
    f = getF(f0,beta,C_CO2(1,ii-1),C(1));
    [km]=getKm(C,zeta); % get  negative transfer rate in yr-1
    [kp]=getKp(C,zeta); % get  positive transfer rate in yr-1

    % Get total yearly rates for each box
    F = (km + kp)*C_CO2(:,ii-1);

    % Update atmospheric CO2 concentration with buffer, land use change delta and
    % human emissions gamma
    F(1,1) = F(1,1)  + gamma(ii) - f + delta(ii) + k12.*(1-zeta); 

    % Surface ocean updated with buffer
    F(2,1) = F(2,1) - k12.*(1-zeta);   
    
    % Biosphere updated with land-use changes and emissions
    F(6,1)= F(6,1) - 2.*delta(ii) + f;

    % Soil updated with land-use change
    F(7,1)=  F(7,1)  + delta(ii);

    % Next iteration estimate
    C_CO2(:,ii) = C_CO2(:,ii-1) + F * dt;

    % Check that pools do not become negative
    C_CO2(C_CO2<0)= 0;
end
C_CO2(C_CO2<0)= 0;
C_CO2 = C_CO2/2.13;


%% Nested functions
    function [f] = getF(f0,beta,P,P0)
        % f is the net primary productivity
        % f0  is the preindustrial value of f
        % P is the atmospheric CO2 concentration
        % P0 is the preindustrial value of P

        f = f0.*(1+beta.*log(P/P0));

    end


    function [km]=getKm(C,zeta)
        % negative transfer rate in yr-1
        km = zeros(Nbox);
        km(1,1)= 60/C(1);
        km(2,2)= 9/C(2) + 43/C(2) + 60 /C(2).*zeta ;
        km(3,3)= 52/C(3) + 162/C(3);
        km(4,4)= 205/C(4) + 0.2/C(4);
        km(5,5)= 0.2/C(5);
        km(6,6) = 62/C(6);
        km(7,7)= 62/C(7);
        km = -km;
    end

    function [kp]=getKp(C,zeta)
        % positive transfer rate in yr-1
        kp = zeros(Nbox);
        kp(1,2)= k12/C(2).*zeta;
        kp(1,5)= 0.2/C(5);
        kp(1,7)= 62/C(7);
        kp(2,3)= 52/C(3);
        kp(2,1)= 60/C(1);
        kp(3,2)= 9/C(2);
        kp(3,4)= 205/C(4);
        kp(4,3)= 162/C(3);
        kp(4,2)= 43/C(2);
        kp(5,4)= 0.2/C(4);
        kp(7,6)= 62/C(6);
    end











end


