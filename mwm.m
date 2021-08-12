% *************************************************************************
%
%   Parameters:
%   - f: frequency [MHz]
%   - d: distance between Transmitter and Receiver [m]
%   - numThin: number of thin walls between Transmitter and Receiver
%   - numThick: number of thick walls between Transmitter and Receiver
%   - nFloors: number of floors between Transmitter and Receiver
%
%   Return value:
%   - mwmLoss: signal strength loss [dB]
%
% *************************************************************************

function PL = mwm(f, d, numThin, numThick, numFloors)

    Lc = 0;             % (dB)
    thinLoss = 3.4;     % (dB)
    thickLoss = 6.9;    % (dB)
    b = 0.46;
    Lf = 18.3;

    % Speed of light (divided by 10^6 because f is in MHz)
    c = 299.79246;
    
    % Calculate free space loss (dB)
    LFS = 20*log10(d) + 20*log10(f) + 20*log10((4*pi)/c);

    exp =(numFloors+2)/(numFloors+1) - b;

    PL = LFS + Lc + numThin*thinLoss + numThick*thickLoss + numFloors^exp*Lf;
    
end