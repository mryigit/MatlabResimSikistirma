function v=govde(resim,islem,comp_oran);
 
    if islem == 'comp'
        
        resim = rgb2yuv(resim);
        resim = floor(resim/comp_oran);
        R = comp(resim(:,:,1));
        G = comp(resim(:,:,2));
        B = comp(resim(:,:,3));
        sonuc{1} = R;
        sonuc{2} = G;
        sonuc{3} = B;
        
    elseif islem == 'open'
        sonuc(:,:,1) = open(resim{1})*comp_oran;
        sonuc(:,:,2) = open(resim{2})*comp_oran;
        sonuc(:,:,3) = open(resim{3})*comp_oran;
        sonuc = yuv2rgb(sonuc);
    end
        
    v = sonuc;
end