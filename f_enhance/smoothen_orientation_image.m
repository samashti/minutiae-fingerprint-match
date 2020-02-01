%smoothen_orientation_image: smoothens the orientation image through vectorial gaussian filtering

%new_oimg = smoothen_orientation_image(oimg)
%                               oimg     - orientation image
%                                new_oimg - filtered orientation image

function noimg = smoothen_orientation_image(oimg)

    %smoothen the image

    gx      =   cos(2*oimg);
    gy      =   sin(2*oimg);
    
    msk     =   fspecial('gaussian',5);
    gfx     =   imfilter(gx,msk,'symmetric','same');
    gfy     =   imfilter(gy,msk,'symmetric','same');
    noimg   =   atan2(gfy,gfx);
    noimg(noimg<0) = noimg(noimg<0)+2*pi;
    noimg   =   0.5*noimg;

    %end function smoothen_orientation_image