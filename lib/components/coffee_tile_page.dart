// ignore_for_file: non_constant_identifier_names

import 'package:coffee_shop/models/coffee_page.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final CoffeePage Coffee;
  void Function()? onPressed;
  final Widget icon;
  CoffeeTile({
    super.key,
    required this.Coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 10,
      ),
      child: ListTile(
        title: Text(Coffee.name),
        subtitle: Text(Coffee.price),
        leading: Image.asset(Coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
