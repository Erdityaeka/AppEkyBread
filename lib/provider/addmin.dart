import 'package:flutter_riverpod/flutter_riverpod.dart';

// CounterNotifier sebagai StateNotifier untuk mengelola state counter
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(1); // Inisialisasi counter dengan 1

  bool get canIncrease => state < 10;
  // Getter untuk memeriksa apakah tombol min dapat ditekan
  bool get canDecrease => state > 1;

  // Method untuk menambah counter
  void add() {
    if (canIncrease)
    state++; // Menambah nilai counter
  }

  // Method untuk mengurangi counter jika canDecrease bernilai true
  void min() {
    if (canDecrease) {
      state--; // Mengurangi nilai counter
    }
  }

  // Method untuk mereset counter ke 1
  void reset() {
    state = 1; // Reset counter ke 1
  }
}

// Provider untuk CounterNotifier
final counterprovider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
