import 'package:flutter/material.dart';
import 'package:navegacao/screens/singup_screen.dart';

import '../core/app_colors.dart';
import '../core/app_images.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.logoLogin,
            fit: BoxFit.fitWidth,
            width: double.maxFinite,
            // height: 180,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Senha'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: double.infinity),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                child: const Text('Entrar'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SingupScreen()),
                    (route) => false);
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: const Center(
                    child: Text(
                  'Não tem uma conta?',
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: const Center(
                    child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
