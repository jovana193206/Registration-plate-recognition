%CREATE TEMPLATES
%Letters
A=imread('letterTemplates/A.bmp');B=imread('letterTemplates/B.bmp');
C=imread('letterTemplates/C.bmp');D=imread('letterTemplates/D.bmp');
E=imread('letterTemplates/E.bmp');F=imread('letterTemplates/F.bmp');
G=imread('letterTemplates/G.bmp');H=imread('letterTemplates/H.bmp');
I=imread('letterTemplates/I.bmp');J=imread('letterTemplates/J.bmp');
K=imread('letterTemplates/K.bmp');L=imread('letterTemplates/L.bmp');
M=imread('letterTemplates/M.bmp');N=imread('letterTemplates/N.bmp');
O=imread('letterTemplates/O.bmp');P=imread('letterTemplates/P.bmp');
Q=imread('letterTemplates/Q.bmp');R=imread('letterTemplates/R.bmp');
S=imread('letterTemplates/S.bmp');T=imread('letterTemplates/T.bmp');
U=imread('letterTemplates/U.bmp');V=imread('letterTemplates/V.bmp');
W=imread('letterTemplates/W.bmp');X=imread('letterTemplates/X.bmp');
Y=imread('letterTemplates/Y.bmp');Z=imread('letterTemplates/Z.bmp');
D2 = imread('letterTemplates/D2.bmp');
I2 = imread('letterTemplates/I2.bmp');
B2 = imread('letterTemplates/B2.bmp');
G2 = imread('letterTemplates/G2.bmp');
U2 = imread('letterTemplates/U2.bmp');

letter=[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z D2 I2 B2 G2 U2];
letter_templates=mat2cell(letter,42,[24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24]);
save ('letter_templates','letter_templates');


%%

%Numbers
one=imread('numTemplates/1.bmp');  two=imread('numTemplates/2.bmp');
three=imread('numTemplates/3.bmp');four=imread('numTemplates/4.bmp');
five=imread('numTemplates/5.bmp'); six=imread('numTemplates/6.bmp');
seven=imread('numTemplates/7.bmp');eight=imread('numTemplates/8.bmp');
nine=imread('numTemplates/9.bmp'); zero=imread('numTemplates/0.bmp');
nine_a = imread('numTemplates/9a.bmp');
seven_a = imread('numTemplates/7a.bmp');
two_a = imread('numTemplates/2a.bmp');

number=[one two three four five six seven eight nine zero nine_a seven_a two_a];
num_templates=mat2cell(number,42,[24 24 24 24 24 24 24 24 24 24 24 24 24]);
save ('num_templates','num_templates');

clear all