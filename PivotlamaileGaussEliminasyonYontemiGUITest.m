k1=input('K1= ');
k2=input('K2= ');
k4=input('K4= ');
k5=input('K5= ');
k6=input('K6= ');

syms x1 x3 x5 x6;

katsayi=[1 0 1 0;1 0 0 1;0 -1 0 1;0 -1 1 0];        % Verilen sistemi denklem haline getirilirse

x=[x1;x3;x5;x6];

k=[k1;k2;k6;k5-k4];

gauss=[katsayi k];                                  % Gauss Eliminasyon Y�ntemi Ba�lang�c�

gauss(2,:)=(gauss(2,:)-gauss(1,:));                 % Birinci ad�m 1.sat�r� -1 ile �arp�l�yor ve 2. sat�ra ekledim.

gauss(2,:)=gauss(2,:)+gauss(3,:);                   % �kinci ad�m 2.sat�r'a 3.sat�r ile toplad�m.

gauss(2,:)=-gauss(2,:);                             % ���nc� ad�m 2.sat�r� negatif yapt�m.

gauss(4,:)=gauss(2,:)+gauss(4,:);                   % D�rd�nc� ad�m 4.sat�r ile 2.sat�r toplad�m.

gauss(3,:)=gauss(2,:)+gauss(3,:);                   % Be�inci ad�m 3.sat�r'a 2.sat�r ile toplad�m.

gauss(4,:)=gauss(4,:)-2*gauss(3,:);                 % Alt�nc� ad�m 3.sat�r�n 2 kat� ile 4.sat�ra fark�n� ald�m.

result=gauss(:,5);

yeniKatsayiler=[gauss(:,1) gauss(:,2) gauss(:,3) gauss(:,4)];

denklem=yeniKatsayiler*x==result;

x3degermin=20;
x3degermax=50;

min=solve(denklem(1),denklem(2),denklem(3),denklem(4),x3==20);
max=solve(denklem(1),denklem(2),denklem(3),denklem(4),x3==50);

x1degermin=min.x1;
x1degermax=max.x1;
x5degermin=min.x5;
x5degermax=max.x5;
x6degermin=min.x6;
x6degermax=max.x6;



