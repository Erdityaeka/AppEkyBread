import 'dart:io'; // Digunakan untuk mengelola file gambar pada Android/iOS
import 'dart:typed_data'; // Digunakan untuk menyimpan data gambar dalam format byte (Uint8List)
import 'package:ekybread/Screens/profile/riwayatpage.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb; // Digunakan untuk mengecek apakah aplikasi berjalan di Web
import 'package:flutter/material.dart'; // Paket utama Flutter untuk UI
import 'package:image_picker/image_picker.dart'; // Digunakan untuk memilih gambar dari galeri
import 'package:intl/intl.dart'; // Digunakan untuk format angka (misalnya, format mata uang)


// Widget Stateful untuk halaman Transfer Bank
class ewalletpage extends StatefulWidget {
  final double
      totalPrice; // Properti untuk menyimpan total harga yang akan dibayar

   ewalletpage({super.key, required this.totalPrice});

  @override
  State<ewalletpage> createState() => _ewalletpageState();
}

class _ewalletpageState extends State<ewalletpage> {
  File?
      _selectedImage; // Variabel untuk menyimpan gambar yang dipilih (Android/iOS)
  Uint8List?
      _webImageBytes; // Variabel untuk menyimpan gambar dalam format byte (Web)

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        // Jika aplikasi berjalan di Web, simpan gambar dalam bentuk Uint8List
        _webImageBytes = await pickedFile.readAsBytes();
      } else {
        // Jika aplikasi berjalan di Android/iOS, simpan gambar sebagai File
        _selectedImage = File(pickedFile.path);
      }
      setState(() {}); // Perbarui UI setelah gambar dipilih
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cek apakah gambar sudah dipilih (baik di Web maupun Android/iOS)
    bool isImageSelected =
        kIsWeb ? _webImageBytes != null : _selectedImage != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whitecolor,
          title:  Text(
              'Pembayaran e-wallet')
            ,flexibleSpace: Container(
              decoration: BoxDecoration(color: whitecolor),
            ),), // Header dengan judul "e-wallet"
      body: Padding(
        padding:  EdgeInsets.all(20.0), // Beri padding 20 di semua sisi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/pembayaran/qr.png'),
                  Text(
                    'Silahkan Scan Codeqr untuk\nmelakukan pembayaran',
                    style: body2blackB,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Menampilkan total harga yang harus dibayar dengan format mata uang
            Row(
              children: [
                Text(
                  'Nominal:  ',
                  style:  body2blackB,
                ),
                Text(
                  'Rp.${NumberFormat("#,###", "id_ID").format(widget.totalPrice)}',
                  style:  body2blackB
                ),
              ],
            ),
             SizedBox(height: 20), // Jarak antar elemen

            // Judul bagian upload bukti pembayaran
             Text(
              'Upload bukti pembayaran',
              style: body2blackB
            ),
             SizedBox(height: 10),

            // Container untuk menampilkan gambar yang diunggah
            Stack(
              children: [
                Container(
                  width: double.infinity, // Lebar penuh
                  height: 120, // Tinggi 120
                  decoration: BoxDecoration(
                    color: imggreycolor, // Warna latar abu-abu muda
                    borderRadius: BorderRadius.circular(8), // Sudut membulat
                  ),
                  child: kIsWeb
                      ? (_webImageBytes == null
                          ?  Center(
                              child: Text(
                                  "Gambar tidak ada", style: body1blackM,)) // Jika belum ada gambar di Web
                          : Image.memory(_webImageBytes!,
                              fit: BoxFit
                                  .cover)) // Tampilkan gambar dari Uint8List di Web
                      : (_selectedImage == null
                          ?  Center(
                              child: Text(
                                  "Gambar tidak ada", style: body1blackM,)) // Jika belum ada gambar di Android/iOS
                          : Image.file(_selectedImage!,
                              fit: BoxFit
                                  .cover)), // Tampilkan gambar dari File di Android/iOS
                ),
                // Tombol ikon untuk memilih gambar
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap:
                        _pickImage, // Memanggil fungsi _pickImage ketika ditekan
                    child: Container(
                      padding:  EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: whitecolor,
                        shape: BoxShape.circle, // Bentuk bulat
                        border: Border.all(
                            color: browncolor,
                            width: 2), // Garis ungu di pinggir
                      ),
                      child:  Icon(Icons.add_photo_alternate_rounded,
                          size: 24, color: blackcolor), // Ikon gambar
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Notice!',
                    style: Bodyred15
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Setelah upload pembayaran silahkan\n tekan konfirmasi untuk melakukan pesanan',
                    style:  body2blackB,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Tombol "Bayar"
            Center(
              child: GestureDetector(
                onTap: isImageSelected // Tombol hanya aktif jika gambar sudah diunggah
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RiwayatPage(),
                          ),
                        );
                      }
                    : null, // Jika tidak ada gambar, tombol tidak bisa ditekan
                child: Center(
                  child: Container(
                    width: 206,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isImageSelected
                          ?  browncolor
                          : greycolor,// Warna berubah jika gambar ada
                      borderRadius: BorderRadius.circular(40), // Sudut membulat
                    ),
                    child:  Center(
                      child: Text(
                        'Konfirmasi',
                        style: Body2white// Warna teks putih
                        ),
                      ),
                    ),
                ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
