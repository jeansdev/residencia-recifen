import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profilepage.dart';
import 'favoritepage.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _selectedIndex = 1; // Índice da página selecionada

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
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoritePage()),
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
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "O que você procura? Ex: Artista de Xilogravura",
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xFFCB2A2D)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xFFCB2A2D)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xFFCB2A2D)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.tune, color: Color(0xFFCB2A2D)),
                onPressed: () {
                  // Ação do ícone de configurações
                },
              ),
            ),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: ShapeDecoration(
              color: Color(0xFFCB2A2D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Valorize os artistas da sua cidade!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Curta e descubra o melhor da cultura pernambucana com Referência.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Spacer(),
        ],
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
