function letter=readLetter(snap)
%   funkcija kao rezultat vraca promenljivu letter tipa 'char' 
%   dobijenu na osnovu analize binarne slike - snap.

% Ucitavanje sablona za cifre u memoriju
load num_templates
% Promena velicine ulazne slike kao priprema za poredjenje sa sablonima
snap=imresize(snap,[42 24]); 
% Niz koji ce pamtiti koeficijente korelacije izmdju ulazne slike i svakog
% od sablona
comp=[ ];

%  figure(5)
%  imshow(snap), title('Character')

for n=1:length(num_templates)
    % Izracunavanje koeficijenta korelacije sa sablonom
    sem=corr2(num_templates{1,n},snap); 
    comp=[comp sem]; 
end
% Pronalazenje indeksa koji odgovara maksimalnom koeficijentu korelacije
vd=find(comp==max(comp)); 

% Na osnovu prethodno odredjenog indeksa jasno je definisano koja cifra se
% izbacuje na izlaz
if vd==1
    letter='1';
elseif vd==2 || vd==13
    letter='2';
elseif vd==3
    letter='3';
elseif vd==4
    letter='4';
elseif vd==5
    letter='5';
elseif vd==6
    letter='6';
elseif vd==7 || vd==12
    letter='7';
elseif vd==8
    letter='8';
elseif vd==9 || vd==11
    letter='9';
else
    letter='0';
end
end