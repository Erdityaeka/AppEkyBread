class Cake {
  final String nama;
  final String foto;
  final String deskripsi;
  final String ingredients;
  final double price; // Ubah ke double untuk harga

  Cake({
    required this.nama,
    required this.foto,
    required this.deskripsi,
    required this.ingredients,
    required this.price,
  });
}

class CartItem {
  final Cake cake;
  int quantity;

  CartItem({required this.cake, this.quantity = 1});
}

List<CartItem> cartItems = []; // Daftar keranjang

// Daftar untuk kue
final List<Cake> cakes = [
  Cake(
    nama: 'Cake Choko Serut',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi:
        'Cake Choko Serut itu kek yang luar biasa, sering disebut "Chocolate Shavings Cake" dalam Bahasa Inggris.Bayangkan kue lembut yang kaya dengan rasa cokelat yang pekat, di atasnya terdapat lapisan cokelat serut yang memberikan tekstur yang menarik. Setiap gigitan menghadirkan kombinasi sempurna antara kelembutan kue dan kerenyahan cokelat serutnya. Bisa bikin siapa saja yang mencicipinya langsung ketagihan!',
    ingredients:
        'Here’s a quick list of ingredients for your Cake Choko Serut:\n 1.200g dark chocolate,\n 2.150g butter,\n 3.200g sugar,\n 4.3 eggs,\n 5.100g flour,\n 6.1 tsp baking powder,\n 7.100ml milk.\n 8.A handful of chocolate shavings for garnish',
    price: 200000,
    
  ),
  Cake(
    nama: 'Cake Choko Straw',
    foto: 'assets/home/cake/Cake3.jpg',
    deskripsi: 'Kue coklat yang lembut dan kaya rasa.',
    ingredients: 'Bahan-bahan kue.',
    price: 200000,
  ),
  Cake(
    nama: 'Cake Choko Astor',
    foto: 'assets/home/cake/Cake2.jpg',
    deskripsi: 'Kue coklat yang lembut dan kaya rasa.',
    ingredients: 'Bahan-bahan kue.',
    price: 200000,
  ),
];

// Daftar untuk cupcake
final List<Cake> cupcakes = [
  Cake(
    nama: 'Cupcake Coklat',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Cupcake manis dengan krim coklat.',
    ingredients: 'Bahan-bahan cupcake.',
    price: 50000,
  ),
  Cake(
    nama: 'Cupcake Keju',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Cupcake manis dengan krim coklat.',
    ingredients: 'Bahan-bahan cupcake.',
    price: 50000,
  ),
];

// Daftar untuk pastry
final List<Cake> pastries = [
  Cake(
    nama: 'Pastry Buah',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Pastry dengan isian buah segar.',
    ingredients: 'Bahan-bahan pastry.',
    price: 60000,
  ),
  Cake(
    nama: 'Pastry Buah',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Pastry dengan isian buah segar.',
    ingredients: 'Bahan-bahan pastry.',
    price: 60000,
  ),
  Cake(
    nama: 'Pastry Buah',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Pastry dengan isian buah segar.',
    ingredients: 'Bahan-bahan pastry.',
    price: 60000,
  ),
];

// Daftar untuk donut
final List<Cake> donuts = [
  Cake(
    nama: 'Donut Manis',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Donut manis dengan taburan gula.',
    ingredients: 'Bahan-bahan donut.',
    price: 40000,
  ),
  Cake(
    nama: 'Donut Manis',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Donut manis dengan taburan gula.',
    ingredients: 'Bahan-bahan donut.',
    price: 40000,
  ),
  Cake(
    nama: 'Donut Manis',
    foto: 'assets/home/cake/Cake1.jpg',
    deskripsi: 'Donut manis dengan taburan gula.',
    ingredients: 'Bahan-bahan donut.',
    price: 40000,
  ),
];
