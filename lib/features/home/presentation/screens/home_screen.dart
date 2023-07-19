import 'package:flutter/material.dart';
import '../../widgets/button_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'assets/images/home/initial_bg.png',
                      fit: BoxFit.cover,
                    ))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/home/logo_galapagos.png',
                        width: 145,
                        height: 145,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const FittedBox(
                    child: Padding(
                      // Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Welcome to\nMy Galapagos Trip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const ButtonHomeWidget(
                    goToPage: "/trip",
                  ),
                  const Spacer(),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/home/powered-by-galavail.png',
                      scale: 2.0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



/*

@override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      body: homeProvider.initialLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Container(
              color: Colors.black,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/images/home/initial_bg.png',
                            fit: BoxFit.cover,
                          ))),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        ClipOval(
                          child: Container(
                            width: 150,
                            height: 150,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/home/logo_galapagos.png',
                              width: 145,
                              height: 145,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          'Welcome to\nMy Galapagos Trip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        const ButtonHomeWidget(
                          goToPage: "/trip",
                        ),
                        const Spacer(),
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/home/powered-by-galavail.png',
                            scale: 2.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
*/