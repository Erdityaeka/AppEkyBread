import 'package:ekybread/Screens/Favorite/favorite.dart';
import 'package:ekybread/Screens/Home/home.dart';
import 'package:ekybread/Screens/cart/cart_page.dart';
import 'package:ekybread/Screens/profile/profile.dart';
import 'package:flutter/material.dart';


class TombolNav extends StatefulWidget {
  final int selectedIndex;
  
  const TombolNav({super.key, this.selectedIndex = 0});

  @override
  State<TombolNav> createState() => _TombolNavState();
}

class _TombolNavState extends State<TombolNav> {
  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.selectedIndex;
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listpage = <Widget>[
       Homescreen(),
       FavoritesPage(),
      CartPage(),
       ProfilePage(),
    ];

    final List<BottomNavigationBarItem> bottomNavBarItems =
        <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.home),
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.favorite),
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.shopping_cart_rounded),
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.person),
        ),
        label: '',
      ),
    ];

    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: const Color(0xff7D7D7D),
      selectedItemColor: const Color(0xff523710),
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: listpage[_selectedTabIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xff523710),
              width: 3.0,
            ),
          ),
        ),
        child: bottomNavBar,
      ),
    );
  }
}
