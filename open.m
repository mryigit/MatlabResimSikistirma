function v = open(sikistirilan)
     x = sikistirilan;
     
     liste = [];
     
     t=1;
     str = int2str(x(1,1));
         for c=1:length(x)
             
             
             str1 = int2str(x(1,c));
             sayi = str2num(str1(8:length(str1)));
             satir_no = str2num(str(1:4))-1000;
             satir_no1 = str2num(str1(1:4))-1000;
             piksel = str2num(str1(5:7))-100;
             if satir_no ~= satir_no1
                 t=1;
                 str = str1;
             else
                 t=t;
                 str = str1;
             end
             
             for k=1:sayi
                 liste(satir_no1 , t) = piksel;
                 t=t+1;
             end
         end
     
     
     v=uint8(liste);
end
             