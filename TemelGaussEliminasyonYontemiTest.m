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

gauss(2,:)=(gauss(2,:)-gauss(1,:));                 % Birinci ad�m 1.sat�r� -1 ile �arp�l�yor ve 2. sat�ra ekleniyor.

change=gauss(2,:);                                  % �kinci ad�m 2.sat�r ile 3.sat�r yer de�i�tiriyor.
gauss(2,:)=gauss(3,:);
gauss(3,:)=change;

gauss(2,:)=-gauss(2,:);                             % ���nc� ad�m 2.sat�r� negatif yapt�m.

gauss(4,:)=gauss(2,:)+gauss(4,:);                   % D�rd�nc� ad�m 4.sat�r ile 2.sat�r toplad�m.

gauss(3,:)=-gauss(3,:);                             % Be�inci ad�m 3.sat�r� -1 ile �arpt�m.

gauss(4,:)=gauss(4,:)-gauss(3,:);                   % Alt�nc� ad�m 3.sat�r� ile 4.sat�ra toplad�m.

gauss(1,:)=gauss(1,:)-gauss(3,:);


result=gauss(:,5);

yeniKatsayiler=[gauss(:,1) gauss(:,2) gauss(:,3) gauss(:,4)];

denklem=yeniKatsayiler*x==result;

x3degermin=20;
asd=subs(denklem(2),{x3},{x3degermin});
x6degermin=solve(asd);
asd=subs(denklem(3),{x6},{x6degermin});
x5degermin=solve(asd);
asd=subs(denklem(1),{x6},{x6degermin});
x1degermin=solve(asd);

x3degermax=50;
asd=subs(denklem(2),{x3},{x3degermax});
x6degermax=solve(asd);
asd=subs(denklem(3),{x6},{x6degermax});
x5degermax=solve(asd);
asd=subs(denklem(1),{x6},{x6degermax});
x1degermax=solve(asd);

data=[];

data(1,1)=x1degermin;
data(1,2)=x1degermax;
data(2,1)=x3degermin;
data(2,2)=x3degermax;
data(3,1)=x5degermin;
data(3,2)=x5degermax;
data(4,1)=x6degermin;
data(4,2)=x6degermax;