// ignore_for_file: deprecated_member_use

import 'package:ekybread/pages/botoomnav.dart';
import 'package:ekybread/provider/cart.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


class RiwayatPage extends ConsumerWidget {
  RiwayatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riwayatItems = ref.watch(riwayatProvider);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => TombolNav(
                  selectedIndex: 3)), // kembali ke profil tapi ada bottom nya

          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Riwayat Pesanan', style: SubtitleblackB,),centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: riwayatItems.isEmpty
            ? Center(child: Text('Belum ada riwayat pesanan!', style: body2blackB,))
            : ListView.builder(
                itemCount: riwayatItems.length,
                itemBuilder: (context, index) {
                  final transaksi = riwayatItems[index];
                  final paymentMethod = transaksi.keys.first;
                  final items = transaksi[paymentMethod]!;
                  final totalPrice = items.fold(0, (sum, item) {
                    return sum + (item.cake.price * item.quantity).toInt();
                  });

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: greycolor2,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: blackcolor.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          ...items.map((item) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: whitecolor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackcolor.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item.cake.foto,
                                    width: 60,
                                    height: 60,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${item.quantity}x ${item.cake.nama}',
                                          style: body2blackB
                                        ),
                                        Text(
                                          'Rp ${NumberFormat("#,###", "id_ID").format(item.cake.price * item.quantity)}',style: body2blackB,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          SizedBox(height: 15),
                          Text('Metode Pembayaran: $paymentMethod',
                              style: body2blackB),
                          Row(
                            children: [
                              const Text('Status: '),
                              Text(
                                paymentMethod == 'Tunai'
                                    ? 'Ongoing'
                                    : 'Success',
                                style: TextStyle(
                                  color: paymentMethod == 'Tunai'
                                      ? Colors.orange
                                      : Colors.green,
                                      fontSize: 12, fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Harga',
                                style: body2blackB
                              ),
                              Spacer(),
                              Text(
                                'Rp ${NumberFormat("#,###", "id_ID").format(totalPrice)}',
                                style: body2blackB
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: redcolor),
                                onPressed: () {
                                  ref
                                      .read(riwayatProvider.notifier)
                                      .hapusRiwayat(index);
                                },
                                child: Text('Hapus', style: Body1white,),
                              ),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: browncolor),
                                onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>TombolNav()));
                                },
                                child: Text('Pesan Lagi', style: Body1white,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
