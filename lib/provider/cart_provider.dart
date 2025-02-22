import 'package:ekybread/models/datacake.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  // ✅ Tambahkan item ke keranjang
  void addToCart(CartItem item) {
    state = [...state, item];
  }

  // ✅ Hapus item berdasarkan nama kue
  void removeFromCart(String namaCake) {
    state = state.where((item) => item.cake.nama != namaCake).toList();
  }

  // ✅ Kosongkan seluruh keranjang
  void clearCart() {
    state = [];
  }
}
