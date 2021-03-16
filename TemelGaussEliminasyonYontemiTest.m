k1=input('K1= ');
k2=input('K2= ');
k4=input('K4= ');
k5=input('K5= ');
k6=input('K6= ');

syms x1 x3 x5 x6;

katsayi=[1 0 1 0;1 0 0 1;0 -1 0 1;0 -1 1 0];        % Verilen sistemi denklem haline getirilirse

x=[x1;x3;x5;x6];

k=[k1;k2;k6;k5-k4];

gauss=[katsayi k];                                  % Gauss Eliminasyon Yöntemi Başlangıcı

gauss(2,:)=(gauss(2,:)-gauss(1,:));                 % Birinci adım 1.satırı -1 ile çarpılıyor ve 2. satıra ekleniyor.

change=gauss(2,:);                                  % İkinci adım 2.satır ile 3.satır yer değiştiriyor.
gauss(2,:)=gauss(3,:);
gauss(3,:)=change;

gauss(2,:)=-gauss(2,:);                             % Üçüncü adım 2.satırı negatif yaptım.

gauss(4,:)=gauss(2,:)+gauss(4,:);                   % Dördüncü adım 4.satır ile 2.satır topladım.

gauss(3,:)=-gauss(3,:);                             % Beşinci adım 3.satırı -1 ile çarptım.

gauss(4,:)=gauss(4,:)-gauss(3,:);                   % Altıncı adım 3.satırı ile 4.satıra topladım.

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