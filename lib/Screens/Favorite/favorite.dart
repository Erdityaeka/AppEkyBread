import 'package:ekybread/Screens/Home/deskripisi.dart';
import 'package:ekybread/models/datacake.dart';
import 'package:ekybread/provider/favorite.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';


// StateNotifier untuk mengelola selectedIndex
class SelectedIndexNotifier extends StateNotifier<int> {
  SelectedIndexNotifier() : super(0); // Default ke 0 (Cakes)

  void selectIndex(int index) {
    state = index;
  }
}

// Provider untuk selectedIndex
final selectedIndexProvider =
    StateNotifierProvider<SelectedIndexNotifier, int>((ref) {
  return SelectedIndexNotifier();
});

class FavoritesPage extends ConsumerWidget {
   FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteItems = ref.watch(favoriteProvider);
    final selectedIndex = ref.watch(selectedIndexProvider);
    List<Cake> currentData = _getCurrentData(selectedIndex);

    return Scaffold(
      backgroundColor: whitecolor,
      appBar: _buildHeader(),
      body: Column(
        children: [
          _buildHeaderContent(ref),
          Expanded(
            child: _buildDataContent(favoriteItems, currentData, context, ref),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildHeader() {
    return AppBar(
      automaticallyImplyLeading: false,
      title:  Center(
        child: Text(
          'Favorites',
          style: TitleblackB
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(color: whitecolor),
      ),
    );
  }

  Widget _buildHeaderContent(WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration:  BoxDecoration(
        color: whitecolor,
        border: Border(
          bottom: BorderSide(color: browncolor, width: 2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const SizedBox(height: 20),
          Padding(
            padding:  const EdgeInsets.only(left: 23, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterOption('Cakes', 0, ref),
                 Spacer(),
                _buildFilterOption('Cupcakes', 1, ref),
                 Spacer(),
                _buildFilterOption('Pastries', 2, ref),
                 Spacer(),
                _buildFilterOption('Donuts', 3, ref),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String text, int index, WidgetRef ref) {
    final isSelected = ref.watch(selectedIndexProvider) == index;
    return GestureDetector(
      onTap: () {
        ref.read(selectedIndexProvider.notifier).selectIndex(index);
      },
      child: Container(
        width: 75,
        height: 34,
        decoration: BoxDecoration(
          color: isSelected ?  browncolor : whitecolor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color:  browncolor,
            width: isSelected ? 0 : 3,
          ),
        ),
        child: Align(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? whitecolor : blackcolor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  List<Cake> _getCurrentData(int index) {
    switch (index) {
      case 0:
        return cakes;
      case 1:
        return cupcakes;
      case 2:
        return pastries;
      case 3:
        return donuts;
      default:
        return cakes;
    }
  }

  Widget _buildDataContent(List<Cake> favoriteItems, List<Cake> currentData, BuildContext context, WidgetRef ref) {
    final filteredFavorites = favoriteItems.where((cake) {
      return currentData.any((current) => current.nama == cake.nama);
    }).toList();

    if (filteredFavorites.isEmpty) {
      return  Center(child: Text('Maaf tidak ada favorit', style: body2blackB,));
    } else {
      return Padding(
        padding:  const EdgeInsets.only(left: 23, right: 24, top: 18),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 60,
              runSpacing: 15,
              children: List.generate(filteredFavorites.length, (index) {
                final cake = filteredFavorites[index];
                final isFavorite = favoriteItems.contains(cake);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Deskripisikue(
                          cak: currentData[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                      height: 202,
                    decoration: BoxDecoration(
                      color: whitecolor,
                      boxShadow: [
                        BoxShadow(
                          color: blackcolor.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset:  const Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.only(left: 120, top: 15),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration:  BoxDecoration(
                              color:browncolor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                ref.read(favoriteProvider.notifier).removeFavorite(cake);
                              },
                              icon: Align(
                                child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: whitecolor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  const EdgeInsets.only(left: 18, right: 18),
                          child: Image.asset(
                            cake.foto,
                            width: 111,
                            height: 105,
                          ),
                        ),
                         const SizedBox(height: 6),
                        Padding(
                          padding:  const EdgeInsets.only(left: 12, ),
                          child: Text(
                            cake.nama,
                            style:  body1blackB
                          ),
                        ),
                         const SizedBox(height: 1),
                        Padding(
                          padding:  const EdgeInsets.only(left: 12, ),
                          child: Text(
                            'Rp ${NumberFormat("#,###", "id_ID").format(cake.price)}',
                            style:  body1blackB
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      );
    }
  }
}
