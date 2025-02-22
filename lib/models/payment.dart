// payment_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentMethodProvider = StateProvider<String?>((ref) {
  return 'Tunai'; // default payment method
});

