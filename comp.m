function v=comp(x)
    i=double(x);
    [R,C] = size(i);
    
    liste =[];
    sayac = 0;
    eklenecek = 0;
   top = 0;
   k=1;
    for r=1:R
        
        
        prev_item = i(r,1);
        c = 1;
        while c <= C
            
            item = i(r,c);
            
            if(prev_item == item)
                sayac = sayac + 1;
                top = top + item;
            else
                
                eklenecek = 100+(top/sayac);
                
                ekle = strcat(int2str(1000+r),int2str(eklenecek),int2str(sayac));
                liste(1,k) = str2num(ekle);
                
                k = k + 1;
                c=c-1;
                top = 0;
                sayac = 0;
                
            end
            prev_item = item;
            c = c+1;
        end
        if sayac > 0
            
            eklenecek = 100+(top/sayac);
            
            ekle = strcat(int2str(1000+r),int2str(eklenecek),int2str(sayac));
            liste(1,k) = str2num(ekle);
            k = k + 1;
            sayac = 0;
            top = 0;
        end
        
    end
    v=uint32(liste);
end
                