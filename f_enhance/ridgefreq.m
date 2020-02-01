% RIDGEFREQ - Calculates a ridge frequency image
%
% Function to estimate the fingerprint ridge frequency across a
% fingerprint image. This is done by considering blocks of the image and
% determining a ridgecount within each block by a call to FREQEST.
%
% Usage:
%  [freqim, medianfreq] =  ridgefreq(im, mask, orientim, blksze, windsze, ...
%                                    minWaveLength, maxWaveLength)
%
% Arguments:
%         im       - Image to be processed.
%         mask     - Mask defining ridge regions (obtained from RIDGESEGMENT)
%         orientim - Ridge orientation image (obtained from RIDGORIENT)
%         blksze   - Size of image block to use (say 32) 
%         windsze  - Window length used to identify peaks. This should be
%                    an odd integer, say 3 or 5.
%         minWaveLength,  maxWaveLength - Minimum and maximum ridge
%                     wavelengths, in pixels, considered acceptable.
% 
% Returns:
%         freqim     - An image  the same size as im with  values set to
%                      the estimated ridge spatial frequency within each
%                      image block.  If a  ridge frequency cannot be
%                      found within a block, or cannot be found within the
%                      limits set by min and max Wavlength freqim is set
%                      to zeros within that block.
%         medianfreq - Median frequency value evaluated over all the
%                      valid regions of the image.

function [freq, medianfreq] = ridgefreq(im, mask, orient, blksze, windsze, ...
                                        minWaveLength, maxWaveLength)     
    
    [rows, cols] = size(im);
    freq = zeros(size(im));
    
    for r = 1:blksze:rows-blksze
        for c = 1:blksze:cols-blksze
          blkim = im(r:r+blksze-1, c:c+blksze-1);   
          blkor = orient(r:r+blksze-1, c:c+blksze-1);       
          
          freq(r:r+blksze-1,c:c+blksze-1) =  ...
              freqest(blkim, blkor, windsze, minWaveLength, maxWaveLength);
        end
    end

    % Mask out frequencies calculated for non ridge regions
    freq = freq.*mask;
    
    % Find median freqency over all the valid regions of the image.
    medianfreq = median(freq(find(freq>0)));  
