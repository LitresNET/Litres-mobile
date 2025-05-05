import 'package:flutter/material.dart';
import '../router/app_router.dart';

class Header extends StatelessWidget {
  final VoidCallback onCartPressed;

  const Header({super.key, required this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.fromLTRB(0, 42, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRouter.home),
            icon: const Icon(Icons.menu_book_outlined),
          ),
          const SizedBox(width: 8),
          Text(
            'BOOKSTORE',
            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),
          const Spacer(),
          IconButton(
            onPressed: onCartPressed,
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRouter.account), // тут можешь добавить переход в настройки
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}