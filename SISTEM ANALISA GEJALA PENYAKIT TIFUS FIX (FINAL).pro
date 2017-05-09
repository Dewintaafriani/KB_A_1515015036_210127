DOMAINS
daftar = string*
sebab1 = string*
sebab2 = string*
sebab3 = string*
nama = string
nim = integer
a = char
kelompok = anggota1(nama,nim);anggota2(nama,nim);anggota3(nama,nim)

FACTS
nondeterm cetak_daftar(daftar)
nondeterm data_kelompok(kelompok)


PREDICATES
nondeterm opsi1
nondeterm opsi2
nondeterm opsi3
nondeterm opsi4
nondeterm penyebab1
nondeterm penyebab2
nondeterm penyebab3
nondeterm penyebab4
nondeterm thanks
nondeterm tengah
nondeterm awal
nondeterm lanjut(char)
nondeterm lanjut1(char)
nondeterm lanjut2(char)
nondeterm lanjut3(char)
nondeterm lanjut4(char)
nondeterm akhir(char)
nondeterm detail_data_kelompok
proses1(a,a)
proses2(a,a)
proses3(a,a)

CLAUSES
proses1(X,X):- !.
proses1(_,_):- fail.

detail_data_kelompok:-
write(" \n\n===ANGGOTA KELOMPOK==="),
write(" \n\nNAMA : M. HUSEN FADHLY"," \nNIM : 1515015001"),
write(" \n\nNAMA : JAINUDDIN"," \nNIM : 1515015010"),
write(" \n\nNAMA : DEWINTA AFRIANI"," \nNIM : ",1515015036),
nl,nl.


awal:- 

write("\n\t___________________________PROJECT AKHIR PRAKTIKUM KECERDASAN BUATAN_________________________"),
write("\n\n\t\t\t<===______===> SISTEM ANALISA GEJALA PENYAKIT TIFUS <===______===>"),
detail_data_kelompok,
cetak_daftar([H1|[H2|[H3|[H4|_]]]]),
write(H1,H2,H3,H4),
write(" \n>>>Tekan ENTER untuk melanjutkan: "),
readchar(A),lanjut(A).
lanjut(_):- opsi1.


tengah:-
cetak_daftar([H1|[H2|[H3|[H4|_]]]]),
write(H1,H2,H3,H4),
write(" >>>): ").



opsi1:-
write(" \nApakah anda demam tinggi lebih dari 3 minggu ? [Y/T]\n"),
readchar(A),lanjut1(A),
readchar(B),lanjut1(B).

lanjut1(A):- proses1(A, 'Y'),penyebab1.
lanjut1(A):- proses1(A, 'y'),penyebab1.
lanjut1(B):- proses1(B, 'T'),penyebab2.
lanjut1(B):- proses1(B, 't'),penyebab2.
lanjut1(_):- opsi2.

opsi2:-
write(" \n\nApakah urine anda berubah menjadi kecoklatan dan perut anda bercak merah ?[Y/T]\n"),
readchar(A),lanjut2(A),
readchar(B),lanjut2(B).

lanjut2(A):- proses1(A, 'Y'),penyebab1.
lanjut2(A):- proses1(A, 'y'),penyebab1.
lanjut2(B):- proses1(B, 'T'),penyebab2.
lanjut2(B):- proses1(B, 't'),penyebab2.
lanjut2(_):- opsi3.

opsi3:-
write(" \n\nApakah anda mengalami penurunan sel darah putih dalam darah ?[Y/T]\n"),
readchar(A),lanjut3(A).

lanjut3(_):- opsi4.

opsi4:-
write(" \n\n____________________________Apakah anda ingin mengetahui hasil pemeriksaan ?[Y/T]_____________________________\n"),
readchar(A),lanjut4(A),
readchar(B),lanjut4(B).

lanjut4(A):- proses1(A, 'Y'),penyebab3.
lanjut4(A):- proses1(A, 'y'),penyebab3.
lanjut4(B):- proses1(B, 'T'),penyebab4.
lanjut4(B):- proses1(B, 't'),penyebab4.
lanjut4(_):- thanks.
proses2(A,A):-!.
proses2(_,_):-fail.

penyebab1:-
write(" \t>>>KELUHAN ANDA SUDAH DISIMPAN UNTUK DI ANALISIS\n=========================================================================\n>>>Tekan ENTER untuk melanjutkan").

penyebab2:-
write(" \t>>>KELUHAN ANDA TIDAK DISIMPAN\n=========================================================================\n>>>Tekan ENTER untuk melanjutkan").

penyebab3:-
write(" \t>>>BERDASARKAN ANALISIS PROGRAM KAMI YANG TELAH DI UJI OLEH PROFESSOR DOKTOR AHLI DIAGNOSA KESEHATAN,\n[[ANDA MENGALAMI GEJALA PENYAKIT TIFUS]]]\n>>>Tekan ENTER untuk melanjutkan").

penyebab4:-
write(" \t>>>KELUHAN ANDA TIDAK KAMI PERIKSA, TERIMAKASIH TELAH MENGGUNAKAN PROGRAM KAMI\n>>>Tekan ENTER untuk melanjutkan").

proses3(A,A):-!.
proses3(_,_):-fail.

thanks:-
write(" \n\n_______________________TERIMA KASIH, ATAS KEPERCAYAAN KELUHAN ANDA TERHADAP KAMI__________________________\n"),
write(" ___________________INGAT!!! JAGA KESEHATAN ANDA JANGAN SAMPAI TIFUS ANDA MAKIN PARAH__________________________\n"),
write(" \n>>>TEKAN TOMBOL 'H' UNTUK KE MENU UTAMA\n"),
write(" >>>TEKAN TOMBOL 'E' JIKA ANDA INGIN KELUAR. \n"),
readchar(A),akhir(A).

akhir(A):-proses3(A, 'H'),awal.
akhir(A):-proses3(A, 'h'),awal.
akhir(A):-proses3(A, 'E'),exit.
akhir(A):-proses3(A, 'e'),exit.
akhir(_):-thanks.

GOAL
consult("data.db"),
awal.
