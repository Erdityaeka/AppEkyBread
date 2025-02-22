// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:ekybread/Screens/profile/profile.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilesettingScreen extends StatefulWidget {
  const ProfilesettingScreen({super.key});

  @override
  State<ProfilesettingScreen> createState() => _ProfilesettingScreenState();
}

class _ProfilesettingScreenState extends State<ProfilesettingScreen> {
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

  bool _isPasswordVissible = true;
  @override
  Widget build(BuildContext context) {
    bool isImageSelected =
        kIsWeb ? _webImageBytes != null : _selectedImage != null;
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        title: Text(
          'Riwayat Pesanan',
          style: SubtitleblackB,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: // Container untuk menampilkan gambar yang diunggah
                    Stack(
                  children: [
                    // Container lingkaran untuk gambar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: imggreycolor,
                      ),
                      child: kIsWeb
                          ? (_webImageBytes == null
                              ? Center(
                                  child: Icon(Icons.person, color: greycolor2))
                              : Image.memory(_webImageBytes!,
                                  fit: BoxFit.cover))
                          : (_selectedImage == null
                              ? Center(
                                  child: Icon(Icons.person, color: greycolor2))
                              : Image.file(_selectedImage!, fit: BoxFit.cover)),
                    ),

                    // Tombol ikon untuk memilih gambar
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: whitecolor,
                              shape: BoxShape.circle,
                              border: Border.all(color: browncolor, width: 2),
                            ),
                            child: Icon(Icons.add_photo_alternate_rounded,
                                size: 15, color: blackcolor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text('Name', style: body2blackM),
              const SizedBox(
                height: 2,
              ),
              TextFormField(
                style: body1blackM,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Erditya Pratama',
                  hintStyle: Bodygrey,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Alamat', style: body2blackM),
              const SizedBox(
                height: 2,
              ),
              TextFormField(
                style: body1blackM,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff523710),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff523710),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Mekar',
                    hintStyle: Bodygrey),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Email', style: body2blackM),
              const SizedBox(
                height: 2,
              ),
              TextFormField(
                style: body1blackM,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff523710),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff523710),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'test@mail.com',
                    hintStyle: Bodygrey),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Password', style: body2blackM),
              const SizedBox(
                height: 2,
              ),
              TextFormField(
                obscureText:
                    _isPasswordVissible, // Menentukan apakah password secara default terlihat
                style: body1blackM,
                decoration: InputDecoration(
                  filled: false, // Tidak mengisi warna latar belakang
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff523710), // Warna border saat tidak fokus
                      width: 2, // Ketebalan border
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff523710), // Warna border saat fokus
                      width: 2, // Ketebalan border
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '*******', hintStyle: Bodygrey,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVissible = !_isPasswordVissible;
                      });
                    },
                    icon: Icon(_isPasswordVissible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    color: const Color(0xff523710),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Profile telah di update!',
                          style: Body1white,
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: Container(
                    width: 113,
                    height: 39,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            color: const Color(0xff523710), width: 3)),
                    child: Align(child: Text('Update', style: body2blackB)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
