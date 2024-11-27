import 'package:flutter/material.dart';
import 'eventpage.dart';
import 'eventpagetwo.dart';
import 'eventpagethree.dart';
import 'artistpage.dart';
import 'profilepage.dart';
import 'explorepage.dart';
import 'favoritepage.dart';
import 'artistpagetwo.dart';
import 'artistpagethree.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista para armazenar o histórico de cliques
  List<String> clickHistory = [];

  // Variável para controlar o índice selecionado na barra de navegação
  int _selectedIndex = 0;

  // Função para atualizar o histórico de cliques
  void addToHistory(String name) {
    setState(() {
      clickHistory.insert(0, name); // Adiciona o nome ao topo da lista
    });
  }

  // Mapa para associar os títulos dos cards às suas respectivas páginas
  final Map<String, Widget> pageMap = {
    'Rec\'n\'Play': EventPage(),
    'Conecta+': EventPageTwo(),
    'Cone': EventPageThree(),
    'Laís Souza': ArtistPage(),
    'Alisson Lourenço': ArtistPageTwo(),
    'Paulinho Santos': ArtistPageThree(),
  };

  // Função para atualizar o índice selecionado na barra de navegação
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else if (index == 1) {
      // Adicionei esta parte para a navegação para ExplorePage
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExplorePage()), // Navega para ExplorePage
      );
    } else if (index == 2) {
      // Adicionei esta parte para a navegação para FavoritePage
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FavoritePage()), // Navega para FavoritePage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              // Imagem personalizada sem funcionalidade
              child: Image.asset(
                'assets/logo.png', // Caminho para a sua imagem
                width: 50, // Defina o tamanho da imagem conforme necessário
                height: 50,
              ),
            ),
            Text("Recife, Centro",
                style: TextStyle(
                  color: const Color(0xFFCB2A2D),
                  fontFamily: 'Poppins',
                )),
            Icon(Icons.location_on, color: const Color(0xFFCB2A2D)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Campo de busca
              TextField(
                decoration: InputDecoration(
                  hintText: 'O que você procura? Ex: Artista de Xilogravura',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(
                        color: const Color(0xFFCB2A2D),
                        width: 0.5), // Borda habilitada com a cor desejada
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(
                        color: const Color(0xFFCB2A2D),
                        width: 0.5), // Borda ao focar no campo
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 30),

              // Título da seção
              Text(
                'Vem curtir com a gente!',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: const Color(0xFFCB2A2D)),
              ),
              SizedBox(height: 20),

              // Carrossel de imagens (dinâmico)
              SizedBox(
                height: 150, // Altura fixa para o carrossel
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Card para "Recn'Play"
                    _buildImageCard(
                        'Rec\'n\'Play', 'assets/joyceimage.png', context),
                    // Card para "Conecta+"
                    _buildImageCard(
                        'Conecta+', 'assets/conecta_image.png', context),
                    // Card para "Foto 1"
                    _buildImageCard('Cone', 'assets/foto1_image.png', context),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Título da seção
              Text(
                'Encontre artistas locais para serviços',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 82, 80, 80),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),

              // Carrossel de artistas com imagens clicáveis
              Container(
                color: const Color(
                    0xFFCB2A2D), // Defina a cor de fundo desejada aqui
                padding: EdgeInsets.all(8.0), // Padding opcional
                child: SizedBox(
                  height: 140, // Altura do carrossel
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap:
                          true, // Faz com que o ListView role horizontalmente
                      children: [
                        _buildArtistCard('Laís Souza', 'Artista Plástica',
                            'assets/artista1.jpg', context),
                        SizedBox(width: 20),
                        _buildArtistCard('Alisson Lourenço', 'Artista Visual',
                            'assets/artista2.jpg', context),
                        SizedBox(width: 20),
                        _buildArtistCard('Paulinho Santos', 'Cantor',
                            'assets/artista3.png', context),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Histórico de cliques
              Text(
                'Vistos recentemente',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 82, 80, 80),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCB2A2D)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: clickHistory.isEmpty
                    ? Text('Nenhuma atividade realizada.')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: clickHistory
                            .map((name) => Text(
                                  name,
                                  style: TextStyle(fontSize: 14),
                                ))
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ),

// Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFebb5b8),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        iconSize: 40, // Tamanho dos ícones não selecionados
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Atualiza o índice selecionado ao clicar

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

  // Widget para criar um card de imagem com redirecionamento
  Widget _buildImageCard(String title, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToHistory(title);
        if (pageMap.containsKey(title)) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageMap[title]!));
        }
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white, // Cor de fundo (opcional)
              borderRadius:
                  BorderRadius.circular(15), // Arredondamento das bordas
              border: Border.all(
                color: const Color(0xFFCB2A2D), // Cor da borda
                width: 1, // Espessura da borda
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
                fontSize: 13,
                color: const Color(0xFFCB2A2D),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildArtistCard(
      String name, String profession, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToHistory(name);
        if (pageMap.containsKey(name)) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pageMap[name]!));
        }
      },
      child: Column(
        children: [
          // Substitui o CircleAvatar por um Container para criar um quadrado
          Container(
            width: 80, // Largura do quadrado
            height: 90, // Altura do quadrado
            decoration: BoxDecoration(
              color: Colors.grey[300], // Cor de fundo para o quadrado
              borderRadius: BorderRadius.circular(20), // Bordas arredondadas
              border: Border.all(
                color: Colors.white, // Cor da borda
                width: 0.5, // Espessura da borda
              ),
            ),
            child: Center(
              // Centraliza a inicial dentro do quadrado
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              fontSize: 15, // Tamanho ajustado do nome
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            profession,
            style: TextStyle(
              fontSize: 12, // Tamanho ajustado da profissão
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
