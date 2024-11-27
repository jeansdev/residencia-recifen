import 'package:flutter/material.dart';
import 'homepage.dart';
import 'explorepage.dart';
import 'favoritepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Define o índice inicial como 'Perfil'

  // Controladores de texto para os campos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
// Navega para a página correspondente ao índice selecionado
    if (index == 0) {
      // Navega para a página HomePage ao clicar em "Início"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      // Navega para a página ExplorePage ao clicar em "Explorar"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExplorePage()),
      );
    } else if (index == 2) {
      // Navega para a página FavoritePage ao clicar em "Favoritos"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoritePage()),
      );
    } else if (index == 3) {
      // Permanece na página ProfilePage ao clicar em "Perfil"
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFCB2A2D)),
          onPressed: () {
            // Navega para a HomePage quando a seta de voltar for pressionada
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFCB2A2D),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Adicionar foto de perfil',
            style: TextStyle(
                color: Color(0xFFCB2A2D), fontFamily: 'Poppins', fontSize: 14),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nome do usuário',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFCB2A2D),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.edit, color: Color(0xFFCB2A2D), size: 18),
            ],
          ),
          SizedBox(height: 30),
          ProfileOption(
            label: 'E-mail',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          ProfileOption(
            label: 'Número de telefone',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
          ),
          ProfileOption(
            label: 'Redefinir senha',
            controller: _passwordController,
            obscureText: true,
          ),
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
          size: 60, // Aumenta o tamanho do ícone selecionado
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

class ProfileOption extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const ProfileOption({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFCB2A2D),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.edit, color: Colors.white),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Digite aqui',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
