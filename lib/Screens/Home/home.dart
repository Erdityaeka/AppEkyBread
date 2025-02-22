import 'package:ekybread/Screens/Home/deskripisi.dart';
import 'package:ekybread/models/datacake.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


class Homescreen extends StatefulWidget {
   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0; // Indeks kategori yang dipilih
  List<Cake> _currentData = cakes; // Data yang ditampilkan sesuai kategori
  List<Cake> _allData = cakes; // Data asli untuk referensi pencarian
  TextEditingController _searchController =
      TextEditingController(); // Controller untuk input pencarian

  // Fungsi untuk mengganti kategori
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Menyimpan indeks kategori yang dipilih
      List<Cake> selectedList;

      // Menentukan daftar data berdasarkan kategori yang dipilih
      switch (index) {
        case 0:
          selectedList = cakes;
          break;
        case 1:
          selectedList = cupcakes;
          break;
        case 2:
          selectedList = pastries;
          break;
        case 3:
          selectedList = donuts;
          break;
        default:
          selectedList = cakes;
      }

      // Memperbarui data yang ditampilkan dan referensi pencarian
      _currentData = selectedList;
      _allData = selectedList;
      _searchController
          .clear(); // Menghapus input pencarian saat kategori berubah
    });
  }

  // Fungsi untuk memfilter data berdasarkan input pencarian
  void _filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        _currentData = _allData; // Jika kosong, tampilkan semua data kategori
      } else {
        _currentData = _allData
            .where(
                (item) => item.nama.toLowerCase().contains(query.toLowerCase()))
            .toList(); // Filter data berdasarkan nama
      }
    });
  }

  PreferredSizeWidget _buildHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration:  BoxDecoration(color: Colors.white),
      ),
      title:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/login/me.jpg',
              ),
            ),
            SizedBox(width: 14),
            Text(
              'Erditya Pratama',
              style: SubtitleblackB
            ),
          ],
        ),
      ),
      actions:  [
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: Text(
            'Ekybread',
            style: SubtitleblackB
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration:  BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0XFF523710), width: 2),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 23, right: 24, top: 37),
            child: TextFormField(
              controller: _searchController,
              onChanged: _filterData,
              style: body1blackM,
              decoration: InputDecoration(
                prefixIcon:  Icon(Icons.search, color: greycolor, size: 15,),
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                       BorderSide(color: Color(0xff523710), width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                       BorderSide(color: Color(0xff523710), width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Search', hintStyle: Bodygrey
              ),
            ),
          ),
           SizedBox(height: 50),
          Padding(
            padding:  EdgeInsets.only(left: 23, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildFilterOption('Cake', 0),
               Spacer(),
                _buildFilterOption('Cup Cake', 1),
                Spacer(),
                _buildFilterOption('Pastry', 2),
                 Spacer(),
                _buildFilterOption('Donat', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String text, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        width: 75,
        height: 34,
        decoration: BoxDecoration(
          color: isSelected ?  browncolor : whitecolor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color:  browncolor,
            width: isSelected ? 0 : 3,
          ),
        ),
        child: Align(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? whitecolor : blackcolor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataContent(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 23, right: 24, top: 18),
      child: _currentData.isEmpty
          ? Center(
              // Jika hasil pencarian kosong, tampilkan teks "Data tidak ada"
              child: Text(
                'Maaf data tidak ditemukan',
                style: body2blackB
              ))
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 60, // Jarak horizontal antara item
                  runSpacing: 15, // Jarak vertikal antara baris
                  children: List.generate(_currentData.length, (index) {
                    return Container(
                        width: 150,
                        height: 202,
                        decoration: BoxDecoration(
                          color: whitecolor,
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(
                                  0.1), // Bayangan hitam dengan opacity
                              spreadRadius: 2,
                              blurRadius: 1, // Tingkat keburaman bayangan
                              offset:  Offset(0, 4), // Posisi bayangan
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(15), // Membulatkan sudut
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 18,
                                right: 18,
                                top: 15,
                              ),
                              child: Image.asset(
                                _currentData[index].foto,
                                width: 111,
                                height: 105,
                              ),
                            ),
                             SizedBox(height: 6),
                            Padding(
                              padding:  EdgeInsets.only(left: 12, top: 6),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigasi ke halaman deskripsi dengan data sesuai filter
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Deskripisikue(
                                        cak: _currentData[
                                            index], // Data sesuai filter
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  _currentData[index].nama,
                                  style:  body1blackB
                                ),
                              ),
                            ),
                             SizedBox(height: 1),
                            Padding(
                              padding:  EdgeInsets.only(left: 12, top: 6),
                              child: Text(
                                'Rp.${NumberFormat("#,###", "id_ID").format(_currentData[index].price)}',
                                style:  body1blackB
                                
                              ),
                            ),
                          ],
                        ),
                      );
                    
                  }),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildHeader(),
      body: Column(
        children: [
          _buildHeaderContent(context),
          Expanded(
            child: _buildDataContent(context),
          ),
        ],
      ),
    );
  }
}
