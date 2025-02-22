import 'package:ekybread/Screens/Login/sigin.dart';
import 'package:ekybread/pages/botoomnav.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isPasswordVissible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderImage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage(context) {
    return Stack(
      children: [
        Image.asset(
          'assets/login/login.png',
          fit: BoxFit.fill,
          width: double.maxFinite,
          height: 614,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, top: 50),
          child: SafeArea(
            child: Text(
              'Welcome to \nThe Ekybread',
              style: titlewhite,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 500),
          child: Container(
            width: double.infinity,
            height: 420,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              border: Border(
                top: BorderSide(color: Color(0xff523710), width: 5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 55, right: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please Sign In',
                    style: SubtitleblackB,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email',
                    style: body2blackM,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: body1blackM,
                    decoration: InputDecoration(
                        filled: false, // Background field tidak diisi
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(
                                0xff523710), // Warna border saat tidak fokus
                            width: 2, // Ketebalan border
                          ),
                          borderRadius:
                              BorderRadius.circular(15), // Membulatkan sudut
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff523710), // Warna border saat fokus
                            width: 2, // Ketebalan border
                          ),
                          borderRadius:
                              BorderRadius.circular(15), // Membulatkan sudut
                        ),
                        hintText: 'Email',
                        hintStyle: Bodygrey),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Password',
                    style: body2blackM,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    obscureText: _isPasswordVissible,
                    style: body1blackM,
                    decoration: InputDecoration(
                      filled: false, // Background field tidak diisi
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(
                              0xff523710), // Warna border saat tidak fokus
                          width: 2, // Ketebalan border
                        ),
                        borderRadius:
                            BorderRadius.circular(15), // Membulatkan sudut
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff523710), // Warna border saat fokus
                          width: 2, // Ketebalan border
                        ),
                        borderRadius:
                            BorderRadius.circular(15), // Membulatkan sudut
                      ),
                      hintText: 'Password',
                      hintStyle: Bodygrey,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVissible = !_isPasswordVissible;
                          });
                        },
                        icon: Icon(_isPasswordVissible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: Color(0xff523710),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Log In Telah Berhasil",
                                  style: Body1white,
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: greencolor,
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TombolNav()));
                          },
                          child: Container(
                            width: 113,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color(
                                    0xff523710,
                                  ),
                                  width: 3),
                            ),
                            child: Align(
                              child: Text('Log In', style: body2blackB),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don’t have account?', style: body1blackM),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Create()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: body1blackB,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
