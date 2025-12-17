program tagihan_sederhana2;
uses crt;

{========================================================}
{ PROGRAM TAGIHAN LISTRIK DAN AIR SEDERHANA               }
{ Menggunakan record, array, function, dan procedure     }
{========================================================}

type
    { Record untuk menyimpan data satu pelanggan }
    TPelanggan = record
        nama : string;                { Nama pelanggan }
        kategori_listrik : integer;   { Kategori daya listrik }
        kategori_air : integer;       { Kategori tarif air }
        kwh : integer;                { Pemakaian listrik (kWh) }
        m3  : integer;                { Pemakaian air (m3) }
        total_listrik : real;         { Total biaya listrik }
        total_air : real;             { Total biaya air }
        total : real;                 { Total keseluruhan tagihan }
    end;

var
    { Array paling sederhana, hanya menyimpan 1 pelanggan }
    p : array[1..1] of TPelanggan;


{========================================================}
{ FUNGSI UNTUK MENGHITUNG BIAYA LISTRIK                   }
{========================================================}
function HitungListrik(kwh, kategori: integer): real;
begin
    { Menentukan tarif berdasarkan kategori listrik }
    case kategori of
        1: HitungListrik := (kwh * 1350) + 2000;  { 900 VA }
        2: HitungListrik := (kwh * 1450) + 2000;  { 1300 VA }
        3: HitungListrik := (kwh * 1550) + 2000;  { 2200 VA }
    else
        HitungListrik := 0;   { Jika kategori tidak valid }
    end;
end;


{========================================================}
{ FUNGSI UNTUK MENGHITUNG BIAYA AIR                       }
{========================================================}
function HitungAir(m3, kategori: integer): real;
begin
    { Menentukan tarif air berdasarkan kategori }
    case kategori of
        1: HitungAir := (m3 * 3500) + 2000;  { R1 }
        2: HitungAir := (m3 * 4500) + 2000;  { R2 }
        3: HitungAir := (m3 * 6000) + 2000;  { R3 }
    else
        HitungAir := 0;   { Jika kategori tidak valid }
    end;
end;


{========================================================}
{ PROSEDUR UNTUK INPUT DATA PELANGGAN                    }
{========================================================}
procedure InputPelanggan(var x: TPelanggan);
begin
    { Input nama pelanggan }
    write('Nama Pelanggan: ');
    readln(x.nama);

    { Input kategori listrik }
    writeln('1. 900VA   2. 1300VA   3. 2200VA');
    write('Kategori Listrik: ');
    readln(x.kategori_listrik);

    { Input pemakaian listrik }
    write('Pemakaian Listrik (kWh): ');
    readln(x.kwh);

    { Input kategori air }
    writeln('1. R1 (3500)   2. R2 (4500)   3. R3 (6000)');
    write('Kategori Air: ');
    readln(x.kategori_air);

    { Input pemakaian air }
    write('Pemakaian Air (m3): ');
    readln(x.m3);
end;


{========================================================}
{ PROSEDUR UNTUK MENAMPILKAN TAGIHAN                     }
{========================================================}
procedure Tampil(x: TPelanggan);
begin
    writeln;
    writeln('---- RINCIAN TAGIHAN ----');
    writeln('Nama           : ', x.nama);
    writeln('Biaya Listrik  : Rp ', x.total_listrik:0:2);
    writeln('Biaya Air      : Rp ', x.total_air:0:2);
    writeln('TOTAL          : Rp ', x.total:0:2);
end;


{========================================================}
{ PROGRAM UTAMA                                          }
{========================================================}
begin
    clrscr;

    writeln('=== INPUT DATA ===');

    { Memanggil prosedur input data }
    InputPelanggan(p[1]);

    { Menghitung biaya listrik dan air menggunakan fungsi }
    p[1].total_listrik := HitungListrik(p[1].kwh, p[1].kategori_listrik);
    p[1].total_air     := HitungAir(p[1].m3, p[1].kategori_air);

    { Menghitung total keseluruhan }
    p[1].total := p[1].total_listrik + p[1].total_air;

    { Menampilkan hasil tagihan }
    Tampil(p[1]);

    readln;
end.