import 'package:ekybread/models/datacake.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Cake>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<List<Cake>> {
  FavoriteNotifier() : super([]);

  // Menambah item ke favorit
  void addFavorite(Cake cake) {
    if (!state.contains(cake)) {
      state = [...state, cake];
    }
  }

  // Menghapus item dari favorit hanya jika dipanggil dari halaman favorit
  void removeFavorite(Cake cake) {
    state = state.where((item) => item != cake).toList();
  }

  // Memeriksa apakah item adalah favorit
  bool isFavorite(Cake cake) {
    return state.contains(cake);
  }
}
