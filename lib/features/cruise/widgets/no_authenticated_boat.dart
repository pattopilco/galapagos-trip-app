import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../commons/menu/providers/menu_provider.dart';

class NoAuthenticatedBoat extends ConsumerWidget {
  const NoAuthenticatedBoat({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemNoti = ref.watch(menuItemProvider.notifier);
    //return Scaffold(
    //  body: Center(
    return Center(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            color: Colors.white,
            child: FittedBox(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Unable to display MY CRUISE details',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Locate your booking code and enter it to proceed with viewing this information.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Text(
                      'We look forward to welcoming you on board.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        backgroundColor: const Color(0xff5e1f20),
                      ),
                      onPressed: () {
                        menuItemNoti.onClickMenu(id: '0');
                        context.go('/trip');
                      },
                      child: const Text('Enter code',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //);
  }
}
