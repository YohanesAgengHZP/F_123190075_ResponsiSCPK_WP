clc;clear;%hapus

%Data Import
data=xlsread('dataset_realestate.xlsx','C2:E51');%membaca data dari excel dari kolom X2 house age, X3 distance to the nearest MRT station, X4 number of convenience stores
harga = xlsread('dataset_realestate.xlsx','H2:H51'); %membaca kolom harga
raw=[data harga];%deklarasi kolom harga

k=[1,0,1,0]; %0= cost,1 = benefit

w = [3,5,4,1];%bobot nilai

[m n]=size(raw); %normalisasi
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua
for j=1:n,
    if k(j)==0,
        w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(raw(i,:).^w);
end;
data= S/sum(S);%tahap terakhir melakukan perankingan
Descend=sort(data,'descend')%mengurutkan data dari terbesar ke terkecil
skor_tertinggi = max(data) %maka diperoleh skor tertinggi
