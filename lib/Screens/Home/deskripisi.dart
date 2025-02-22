import 'package:ekybread/models/datacake.dart';
import 'package:ekybread/provider/addmin.dart';
import 'package:ekybread/provider/cart.dart';
import 'package:ekybread/provider/favorite.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Deskripisikue extends ConsumerWidget {
  final Cake cak; // Objek 'cake' yang diterima dari halaman sebelumnya

  Deskripisikue({super.key, required this.cak});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterprovider);
    final counterNotifier = ref.read(counterprovider.notifier);
    ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 65),
          child: Text(cak.nama, style: SubtitleblackB),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(cak.foto, width: 200, height: 200),
              ),
              SizedBox(height: 20),
              Text(cak.nama, style: SubtitleblackB),
              SizedBox(height: 20),
             
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                   cak.deskripsi.replaceAll('\u00A0', ' '),//Non-Breaking Space (NBSP)
                    style: body2blackM,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Ingredient', style: SubtitleblackB),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    cak.ingredients.replaceAll('\u00A0', ' '),//Non-Breaking Space (NBSP)
                    style: body2blackM,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(height: 33),
              Row(
                children: [
                  Text('Order:', style: SubtitleblackB),
                  Spacer(),
                  IconButton(
                    onPressed: counterNotifier.canDecrease
                        ? () => counterNotifier.min()
                        : null,
                    icon: Icon(
                      Icons.do_not_disturb_on,
                      color: counter > 1 ? Color(0xff523710) : Colors.grey,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text('$counter', style: Bodybrown),
                  SizedBox(width: 3),
                  IconButton(
                    onPressed: counterNotifier.canIncrease
                        ? () => counterNotifier.add()
                        : null,
                    icon: Icon(
                      Icons.add_circle,
                      color: counter < 10 ? Color(0xff523710) : Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              _buildFavoriteAndAddToCart(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun widget Favorite dan Add to Cart
  Widget _buildFavoriteAndAddToCart(BuildContext context, WidgetRef ref) {
    final isFavorite = ref
        .watch(favoriteProvider)
        .contains(cak); // Periksa apakah item adalah favorit

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (!isFavorite) {
              ref.read(favoriteProvider.notifier).addFavorite(cak);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${cak.nama} ditambahkan ke favorit',
                    style: Body1white,
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              ref.read(favoriteProvider.notifier).removeFavorite(cak);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${cak.nama} dihapus dari favorit',
                    style: Body1white,
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: redcolor,
                ),
              );
            }
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: browncolor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: whitecolor,
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            ref
                .read(cartProvider.notifier)
                .addToCart(cak, ref.read(counterprovider));
            ref.read(counterprovider.notifier).reset();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${cak.nama} ditambahkan ke keranjang',
                  style: Body1white,
                ),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: Container(
            width: 290,
            height: 70,
            decoration: BoxDecoration(
              color: browncolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
              child: Text('Add to Cart', style: Body2white),
            ),
          ),
        ),
      ],
    );
  }
}
