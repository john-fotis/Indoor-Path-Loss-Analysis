% *************************************************************************
%
%   Parameters:
%   - f: frequency [MHz]
%   - d: distance between Transmitter and Receiver [m]
%   - numThin: number of thin walls between Transmitter and Receiver
%   - numThick: number of thick walls between Transmitter and Receiver
%   - numFloors: number of floors between Transmitter and Receiver
%
%   Return value:
%   - PL: total path loss [dB]
%
% *************************************************************************

function PL = mwm(f, d, numThin, numThick, numFloors)

    Lc = 0;                 % (dB)
    thinWallLoss = 3.4;     % (dB)
    thickWallLoss = 6.9;    % (dB)
    b = 0.46;
    Lf = 18.3;              % (dB)

    % Speed of light (divided by 10^6 because f is in MHz)
    c = 299.79246;

    if (f >= 800) && (f <= 2000)
        % Calculate free space loss (dB)
        LFS = 20*log10(d) + 20*log10(f) + 20*log10((4*pi)/c);

        exp =(numFloors+2)/(numFloors+1) - b;

        PL = LFS + Lc + numThin*thinWallLoss + numThick*thickWallLoss + numFloors^exp*Lf;
    else
        PL = 10e14;
    end