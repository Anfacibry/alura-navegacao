import 'package:flutter/material.dart';
import 'package:navegacao/screens/payment_screen.dart';
import 'package:navegacao/screens/profile_screen.dart';
import '../components/orgs_menu_card.dart';
import '../components/orgs_rate_app.dart';
import '../core/app_colors.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Menu',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGrey),
              ),
              const SizedBox(height: 20),
              const OrgsRateApp(),
              const SizedBox(height: 30),
              OrgsMenuCard(
                text: 'Início',
                icon: Icons.home,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
              const Divider(),
              OrgsMenuCard(
                text: 'Favoritos',
                icon: Icons.favorite,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()),
                ),
              ),
              const Divider(),
              OrgsMenuCard(
                text: 'Perfil',
                icon: Icons.person,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                ),
              ),
              const Divider(),
              OrgsMenuCard(
                text: 'Métodos de pagamento',
                icon: Icons.credit_card,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentScreen()),
                ),
              ),
              const Divider(),
              OrgsMenuCard(
                text: 'Sair',
                icon: Icons.logout,
                action: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
