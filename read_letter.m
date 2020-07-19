function letter=readLetter(snap)
%   funkcija kao rezultat vraca promenljivu letter tipa 'char' 
%   dobijenu na osnovu analize binarne slike - snap.

% Ucitavanje sablona za slova u memoriju
load letter_templates
% Promena velicine ulazne slike kao priprema za poredjenje sa sablonima
snap=imresize(snap,[42 24]);
% Niz koji ce pamtiti koeficijente korelacije izmdju ulazne slike i svakog
% od sablona
comp=[ ];

%figure(4)
%imshow(snap), title('Character')

for n=1:length(letter_templates)
    % Izracunavanje koeficijenta korelacije sa sablonom
    sem=corr2(letter_templates{1,n},snap);
    comp=[comp sem];
end
% Pronalazenje indeksa koji odgovara maksimalnom koeficijentu korelacije
vd=find(comp==max(comp)); 

% Na osnovu prethodno odredjenog indeksa jasno je definisano koje slovo se
% izbacuje na izlaz
if vd==1
    letter='A';
elseif vd==2 || vd==29
    letter='B';
elseif vd==3
    letter='C';
elseif vd==4 || vd==27
    letter='D';
elseif vd==5
    letter='E';
elseif vd==6
    letter='F';
elseif vd==7 || vd == 30
    letter='G';
elseif vd==8
    letter='H';
elseif vd==9 || vd==28
    letter='I';
elseif vd==10
    letter='J';
elseif vd==11
    letter='K';
elseif vd==12
    letter='L';
elseif vd==13
    letter='M';
elseif vd==14
    letter='N';
elseif vd==15
    letter='O';
elseif vd==16
    letter='P';
elseif vd==17
    letter='Q';
elseif vd==18
    letter='R';
elseif vd==19
    letter='S';
elseif vd==20
    letter='T';
elseif vd==21 || vd==31
    letter='U';
elseif vd==22
    letter='V';
elseif vd==23
    letter='W';
elseif vd==24
    letter='X';
elseif vd==25
    letter='Y';
else
    letter='Z';
end
end