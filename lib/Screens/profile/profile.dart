import 'package:ekybread/Screens/Login/login.dart';
import 'package:ekybread/Screens/profile/profilesetting.dart';
import 'package:ekybread/Screens/profile/riwayatpage.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:  Size.fromHeight(120),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace:  Padding(
              padding: EdgeInsets.only(top: 15, left: 25),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/login/me.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Erditya Pratama',
                        style: SubtitleblackB
                      ),
                      Text(
                        'test@mail.com',
                        style: body1blackM
                      )
                    ],
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize:  Size.fromHeight(3),
              child: Container(
                color:  browncolor,
                height: 1,
              ),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.only(top: 60, left: 25, right: 23),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30,
                decoration:  BoxDecoration(color: whitecolor),
                child: Row(
                  children: [
                     Icon(
                      Icons.person,
                      color: blackcolor, size: 20,
                    ),
                     SizedBox(
                      width: 10,
                    ),
                     Text(
                      'Profile',
                      style: body2blackM
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilesettingScreen()));
                      },
                      child:  Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 30,
                decoration:  BoxDecoration(color: whitecolor),
                child: Row(
                  children: [
                     Icon(
                      Icons.shopping_bag,
                      color: blackcolor,
                      size: 20,
                    ),
                     SizedBox(
                      width: 10,
                    ),
                     Text(
                      'Riwayat Pesanan',
                      style: body2blackM
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RiwayatPage()));
                      },
                      child:  Icon(
                        Icons.keyboard_arrow_right,
                        color: blackcolor,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      content: Text(
                        "Apakah anda ingin Logout?",
                        style: Bodyred15M
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child:  Text("Batal", style: Bodyblue,),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  SignIn()));
                          },
                          child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: browncolor, width: 2)),
                              child: Center(
                                child:  Text(
                                  "Iya",
                                  style: Bodybrown,)
                              )),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 30,
                  decoration:  BoxDecoration(color: Colors.white),
                  child:  Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: redcolor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Logout',
                        style: Bodyred15M
                      ),
                      
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
