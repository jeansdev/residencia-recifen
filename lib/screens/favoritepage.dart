import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profilepage.dart';
import 'explorepage.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIndex = 2; // Índice da página selecionada

  // Função chamada quando um item da BottomNavigationBar é tocado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegação baseada no índice selecionado
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExplorePage()), // Página de Explorar
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFCB2A2D)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Caminho para a sua imagem
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Você ainda não possui favoritos",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color(0xFFCB2A2D), // Cor personalizada
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              "Encontre um evento ou artista para adicionar a esta página",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFebb5b8),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        iconSize: 40,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(
          size: 60,
        ),
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFCB2A2D),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFCB2A2D),
                        width: 2,
                      ),
                    ),
                    child: Icon(Icons.home, size: 40, color: Colors.white),
                  )
                : Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFCB2A2D),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFCB2A2D),
                        width: 2,
                      ),
                    ),
                    child: Icon(Icons.explore, size: 40, color: Colors.white),
                  )
                : Icon(Icons.explore),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFCB2A2D),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFCB2A2D),
                        width: 2,
                      ),
                    ),
                    child: Icon(Icons.favorite, size: 40, color: Colors.white),
                  )
                : Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFCB2A2D),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFCB2A2D),
                        width: 2,
                      ),
                    ),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  )
                : Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
