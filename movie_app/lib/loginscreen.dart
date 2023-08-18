import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // Import the animate_do package
import 'home.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkLoginButtonStatus);
    _passwordController.addListener(_checkLoginButtonStatus);
  }

  void _checkLoginButtonStatus() {
    setState(() {
      _isLoginButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            'images/loginscreen.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            width: 300,
            height: 300,
            left: 130,
            top: 600,
            child: Image.asset('images/logo.png'),
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 180),
                const Text(
                  " Login",
                  style: TextStyle(fontSize: 50),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FadeInLeft(
                    duration:
                        const Duration(milliseconds: 500), // Animation duration
                    child: TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 800),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 800),
                    child: Padding(
                      padding: EdgeInsets.only(left: 90),
                      child: ElevatedButton(
                        onPressed: _isLoginButtonEnabled
                            ? () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const MovieApp()),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6000),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
