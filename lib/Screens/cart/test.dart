// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:kue/provider/cart.dart';

// class RiwayatPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final riwayatItems = ref.watch(riwayatProvider);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Riwayat Pesanan'),
//         backgroundColor: Colors.white,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(color: Colors.white),
//         ),
//       ),
//       body: riwayatItems.isEmpty
//           ? const Center(
//               child: Text('Belum ada riwayat pesanan!'),
//             )
//           : ListView.builder(
//               itemCount: riwayatItems.length,
//               itemBuilder: (context, index) {
//                 final item = riwayatItems[index];
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                         width: double.infinity,
//                         height: 200,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(
//                                     0.1), // Bayangan hitam dengan opacity
//                                 spreadRadius: 2,
//                                 blurRadius: 1, // Tingkat keburaman bayangan
//                                 offset: const Offset(0, 4), // Posisi bayangan
//                               ),
//                             ]),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                 item.cake.foto,
//                                 width: 150,
//                                 height: 150,
//                               ),
//                               SizedBox(width: 10),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text('${item.quantity}x'),
//                                       Text(item.cake.nama),
//                                     ],
//                                   ),
//                                   Text(
//                                     'Rp ${NumberFormat("#,###").format(item.cake.price * item.quantity)}',
//                                   ),
//                                   const SizedBox(height: 10),

//                                   // Menampilkan Metode Pembayaran
//                                   Row(
//                                     children: [
//                                       const Text('Metode Pembayaran: '),
//                                       Text(item.paymentMethod ?? 'Tunai'),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 10),

//                                   // Menampilkan Status Pembayaran
//                                   Row(
//                                     children: [
//                                       const Text('Status: '),
//                                       Text(
//                                         item.paymentMethod == 'Tunai'
//                                             ? 'Ongoing'
//                                             : 'Success',
//                                         style: TextStyle(
//                                           color: item.paymentMethod == 'Tunai'
//                                               ? Colors.orange
//                                               : Colors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               const Spacer(),
//                               IconButton(
//                                 icon:
//                                     const Icon(Icons.delete, color: Colors.red),
//                                 onPressed: () {
//                                   // Hapus item dari riwayat
//                                   ref
//                                       .read(riwayatProvider.notifier)
//                                       .hapusRiwayat(item);
//                                 },
//                               ),
//                             ],
//                           ),
//                         )),
//                   ],
//                 );
//               },
//             ),
//     );
//   }
// }
