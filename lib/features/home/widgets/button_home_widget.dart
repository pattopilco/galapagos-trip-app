import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonHomeWidget extends StatelessWidget {
  final String goToPage;

  const ButtonHomeWidget({
    super.key,
    required this.goToPage,
  });

  @override
  Widget build(BuildContext context) {
    const String text = 'START';
    return FilledButton(
      style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary),
      onPressed: () => context.go(goToPage),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
