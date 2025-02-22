// // // void _confirmPayment() {
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) => AlertDialog(
// // //         title: const Text("Konfirmasi Pembayaran"),
// // //         content: const Text("Apakah Anda yakin ingin mengonfirmasi pembayaran ini?"),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.pop(context),
// // //             child: const Text("Batal"),
// // //           ),
// // //           TextButton(
// // //             onPressed: () {
// // //               Navigator.pop(context);
// // //               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RiwayatPage()));
// // //             },
// // //             child: const Text("Ya, Lanjutkan"),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
//  GestureDetector(
//               onTap: isImageSelected
//                   ? () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const RiwayatPage()));
//                     }
//                   : null,
//               child: Container(
//                 width: 206,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: isImageSelected ? const Color(0xff523710) : Colors.grey,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Bayar',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),