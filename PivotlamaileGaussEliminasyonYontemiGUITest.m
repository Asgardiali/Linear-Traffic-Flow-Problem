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

gauss(2,:)=(gauss(2,:)-gauss(1,:));                 % Birinci adım 1.satırı -1 ile çarpılıyor ve 2. satıra ekledim.

gauss(2,:)=gauss(2,:)+gauss(3,:);                   % İkinci adım 2.satır'a 3.satır ile topladım.

gauss(2,:)=-gauss(2,:);                             % Üçüncü adım 2.satırı negatif yaptım.

gauss(4,:)=gauss(2,:)+gauss(4,:);                   % Dördüncü adım 4.satır ile 2.satır topladım.

gauss(3,:)=gauss(2,:)+gauss(3,:);                   % Beşinci adım 3.satır'a 2.satır ile topladım.

gauss(4,:)=gauss(4,:)-2*gauss(3,:);                 % Altıncı adım 3.satırın 2 katı ile 4.satıra farkını aldım.

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



