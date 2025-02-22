import 'package:ekybread/models/datacake.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// CartItem model
class CartItem {
  final Cake cake;
  int quantity;
  final String? paymentMethod;

  CartItem({required this.cake, required this.quantity, this.paymentMethod});
}

// CartNotifier for managing the shopping cart
class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  // Menambahkan item ke keranjang
  void addToCart(Cake cake, int quantity) {
    final existingItemIndex = state.indexWhere((item) => item.cake == cake);

    if (existingItemIndex != -1) {
      // Update quantity if item already exists
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingItemIndex)
            CartItem(cake: cake, quantity: quantity)
          else
            state[i]
      ];
    } else {
      // Add new item to the cart
      state = [...state, CartItem(cake: cake, quantity: quantity)];
    }
  }

  // Menghapus item dari keranjang
  void removeFromCart(Cake cake) {
    state = state.where((item) => item.cake != cake).toList();
  }

  // Menghapus semua item dari keranjang
  void clearCart() {
    state = [];
  }

  // Mendapatkan total item di keranjang
  int get totalItems {
    return state.fold(0, (total, item) => total + item.quantity);
  }
}

// Cart Provider
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

// RiwayatNotifier untuk menyimpan riwayat pesanan
// RiwayatNotifier untuk menyimpan riwayat pesanan
class RiwayatNotifier extends StateNotifier<List<Map<String, List<CartItem>>>> {
  RiwayatNotifier() : super([]);

  // Menambahkan item ke riwayat pesanan sebagai transaksi baru
  void tambahRiwayat(List<CartItem> items, String paymentMethod) {
    state = [
      ...state,
      {paymentMethod: List<CartItem>.from(items)}
    ];
  }

  // Menghapus transaksi berdasarkan metode pembayaran
 void hapusRiwayat(int index) {
  state = [
    for (int i = 0; i < state.length; i++)
      if (i != index) state[i]
  ];
}

}


// Riwayat Provider
final riwayatProvider =
    StateNotifierProvider<RiwayatNotifier, List<Map<String, List<CartItem>>>>(
  (ref) => RiwayatNotifier(),
);
