import 'package:flutter/material.dart';
import 'login.dart';

class TrackTwo extends StatelessWidget {
  const TrackTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Configs da logo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFCB2A2D),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Estamos aqui para resolver isso!',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFCB2A2D),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          textAlign:
                              TextAlign.justify, // Alinhamento de todo o texto
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                            children: [
                              const TextSpan(text: 'O '),
                              const TextSpan(
                                text: 'Recifência',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFCB2A2D),
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' é a ponte que conecta você ao seu artista predileto. ',
                              ),
                              const TextSpan(
                                text: 'Explore',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFCB2A2D),
                                ),
                              ),
                              const TextSpan(text: ', '),
                              const TextSpan(
                                text: 'conheça',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFCB2A2D),
                                ),
                              ),
                              const TextSpan(text: ' e '),
                              const TextSpan(
                                text: 'consuma',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFCB2A2D),
                                ),
                              ),
                              const TextSpan(
                                  text:
                                      ' artistas recifenses. \n\nVamos juntos?'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              // Redirecionando para a tela de Login com animação
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds: 500), // Duração da animação
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const Login();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0,
                                        0.0); // Animação da direita para a esquerda
                                    const end = Offset.zero; // Posição final
                                    const curve = Curves
                                        .easeInOut; // Animação suave (ease-in-out)

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCB2A2D),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Começar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
