close all
clear all
clc
tic
alfa=0:.1:0.6;
PL=[0 0.2 0.5 1 2];
N=0:0.5:3;
l=0.015:0.01:0.1;
ThP=3e-4:1e-4:0.9e-3;
iter=0;
R=1e3;
for i=1:length(PL)
    for j=1:length(N)
        for k=1:length(alfa)
            for v=1:length(l)
                for m=1:length(ThP)
    
    
iter=iter+1;

    %}
format long 
fidn=fopen([num2str(iter) 'Out_Vol.txt'],'r');
vlt=fscanf(fidn,'%g',[100 1]);
fclose(fidn);

for it=1:99
eng(it)=(trapz([it it+1],[(abs(vlt(it))).^2 (abs(vlt(it+1))).^2]))./R;
end
OutPut=sum(eng);

Amatrix(iter,:) = [ThP(m),l(v),PL(k),N(j),alfa(i),OutPut];
end
    
%{
fid=fopen('inputTaperFGM.inp','w+');

fprintf(fid,'alfa=%f\n',alfa(i));
fprintf(fid,'N=%f\n',N(j));
fprintf(fid,'PL=%f\n',PL(k));
fprintf(fid,'iter=%f\n',iter);
fprintf(fid,'l=%f\n',l(v));
fprintf(fid,'ThP=%f\n',ThP(m));



fclose(fid);

!SET KMP_STACKSIZE=15000k & "C:\Program Files\ANSYS Inc\v160\ansys\bin\winx64\ansys160.exe" -b -p ANSYS -i C:\Users\hp\Desktop\Kouider_Taper_Code\FGM_with_Patch_Trapezoidal.txt -o C:\Users\hp\Desktop\Kouider_Taper_Code\ansys_out.txt




%filename = 'testdata.xlsx';

%xlswrite(filename,Amatrix(iter,:))

%plot(1:length(vlt),(abs(vlt)))
%hold on
%R=1e6;
%}

                end
            end
        end
    end
end
filename = 'DataANNEW.xlsx';

xlswrite(filename,Amatrix)
toc

