import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';


class Create extends StatefulWidget {
   Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  bool _isPasswordVissible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: whitecolor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.only(top: 34, left: 20, right: 51),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Create new\nAccount',
                style: TitleblackB,
              ),
               const SizedBox(height: 85),
               Text(
                'Name',
                style:body2blackM
              ),
               const SizedBox(
                height: 2,
              ),
              TextFormField(
                style:  body1blackM,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Name', hintStyle: Bodygrey,
                ),
              ),
               const SizedBox(
                height: 5,
              ),
               Text(
                'Alamat',
                style: body2blackM
              ),
               const SizedBox(
                height: 2,
              ),
              TextFormField(
                style:  body1blackM,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Alamat', hintStyle: Bodygrey
                ),
              ),
               const SizedBox(
                height: 5,
              ),
               Text(
                'Email',
                style: body2blackM
              ),
               const SizedBox(
                height: 2,
              ),
              TextFormField(
                style:  body1blackM,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Email',hintStyle: Bodygrey
                ),
              ),
               const SizedBox(
                height: 5,
              ),
               Text(
                'Password',
                style: body2blackM
              ),
               const SizedBox(
                height: 2,
              ),
              TextFormField(
                obscureText:
                    _isPasswordVissible, // Menentukan apakah password secara default terlihat
                style:  body1blackM,
                decoration: InputDecoration(
                  filled: false, // Tidak mengisi warna latar belakang
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710), // Warna border saat tidak fokus
                      width: 2, // Ketebalan border
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: Color(0xff523710), // Warna border saat fokus
                      width: 2, // Ketebalan border
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Password',hintStyle: Bodygrey,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVissible = !_isPasswordVissible;
                      });
                    },
                    icon: Icon(_isPasswordVissible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    color:  const Color(0xff523710),
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 113,
                  height: 39,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border:
                          Border.all(color:  const Color(0xff523710), width: 3)),
                  child:  Align(
                      child: Text(
                    'Sigin',
                    style: body2blackB
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
