import 'package:ekybread/Screens/cart/bank.dart';
import 'package:ekybread/Screens/cart/e-wallet.dart';
import 'package:ekybread/Screens/profile/riwayatpage.dart';
import 'package:ekybread/models/payment.dart';
import 'package:ekybread/pages/botoomnav.dart';
import 'package:ekybread/provider/cart.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


final agreeProvider = StateProvider<bool>((ref) => false);

class CartPage extends ConsumerWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final paymentMethod = ref.watch(paymentMethodProvider);

    // Menghitung total harga
    double totalPrice = cartItems.fold(
        0, (sum, item) => sum + (item.cake.price * item.quantity));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Pesanan', style: TitleblackB),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TombolNav()));
              },
              child: Text(
                'Tambah Pesanan',
                style: Bodyblue,
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: whitecolor,
            border: Border(
              bottom: BorderSide(color: browncolor, width: 1),
            ),
          ),
        ),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Maaf Anda Belum Memesan',
                    style: body2blackB,
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: browncolor, width: 1),
                        top: BorderSide(color: browncolor, width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 15),
                      child: Text(
                        'Rangkuman Pesanan',
                        style: body2blackB,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: blackcolor.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 1,
                              )
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(item.cake.foto),
                              radius: 25,
                            ),
                            title: Text('${item.quantity}x ${item.cake.nama}',
                                style: body1blackM),
                            subtitle: GestureDetector(
                              onTap: () {
                                ref
                                    .read(cartProvider.notifier)
                                    .removeFromCart(item.cake);
                              },
                              child: Text(
                                'Hapus',
                                style: Bodyred12,
                              ),
                            ),
                            trailing: Text(
                              'Rp.${NumberFormat("#,###", "id_ID").format(item.cake.price * item.quantity)}',
                              style: body1blackM,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: whitecolor,
                      border: Border(
                        bottom: BorderSide(color: browncolor, width: 1),
                        top: BorderSide(color: browncolor, width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 15),
                      child: Text(
                        'Metode Pembayaran',
                        style: body2blackB,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'e-wallet',
                                style: body2blackM,
                              ),
                            ),
                            Radio<String>(
                              value: 'e-wallet',
                              groupValue: paymentMethod,
                              onChanged: (value) {
                                ref.read(paymentMethodProvider.notifier).state =
                                    value!;
                              },
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (states) {
                                if (states.contains(WidgetState.selected)) {
                                  return browncolor; // Warna saat radio button dipilih
                                }
                                return greycolor; // Warna default saat tidak dipilih
                              }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Tunai',
                                style: body2blackM,
                              ),
                            ),
                            Radio<String>(
                              value: 'Tunai',
                              groupValue: paymentMethod,
                              onChanged: (value) {
                                ref.read(paymentMethodProvider.notifier).state =
                                    value!;
                              },
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (states) {
                                if (states.contains(WidgetState.selected)) {
                                  return browncolor; // Warna saat radio button dipilih
                                }
                                return greycolor; // Warna default saat tidak dipilih
                              }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Bank',
                                style: body2blackM,
                              ),
                            ),
                            Radio<String>(
                              value: 'Bank',
                              groupValue: paymentMethod,
                              onChanged: (value) {
                                ref.read(paymentMethodProvider.notifier).state =
                                    value!;
                              },
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (states) {
                                if (states.contains(WidgetState.selected)) {
                                  return browncolor; // Warna saat radio button dipilih
                                }
                                return greycolor; // Warna default saat tidak dipilih
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: browncolor), // garis
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Harga: ', style: body2blackB),
                        Text(
                            'Rp ${NumberFormat("#,###", "id_ID").format(totalPrice)}',
                            style: SubtitleblackB),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Pesanan sudah siap',
                            style: Body1white,
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );
                      if (paymentMethod == 'Bank') {
                        ref.read(cartProvider.notifier).clearCart();
                        ref
                            .read(riwayatProvider.notifier)
                            .tambahRiwayat(cartItems, paymentMethod!);

                        // Arahkan ke halaman transfer bank dengan harga
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TransferBankPage(totalPrice: totalPrice),
                          ),
                        );
                      } else if (paymentMethod == 'e-wallet') {
                        // Langsung ke halaman riwayat
                        ref.read(cartProvider.notifier).clearCart();
                        ref
                            .read(riwayatProvider.notifier)
                            .tambahRiwayat(cartItems, paymentMethod!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ewalletpage(totalPrice: totalPrice),
                          ),
                        );
                      } else if (paymentMethod == 'Tunai') {
                        // Langsung ke halaman riwayat
                        ref.read(cartProvider.notifier).clearCart();
                        ref
                            .read(riwayatProvider.notifier)
                            .tambahRiwayat(cartItems, paymentMethod!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RiwayatPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 206,
                      height: 40,
                      decoration: BoxDecoration(
                        color: browncolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          'Bayar',
                          style: Body2white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
