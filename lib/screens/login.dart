import 'package:flutter/material.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool queroEntrar = true; // Variável para alternar entre login e cadastro

  // Chave Global para o Form
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                // Container da logo e textos
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image(
                        image: AssetImage("assets/logo.png"),
                        width: 100,
                      ),
                      SizedBox(height: 20),
                      // Texto "Bem vindo!" ou "Cadastre-se!"
                      Text(
                        queroEntrar ? "Bem vindo!" : "Cadastre-se!",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFCB2A2D),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Subtexto
                      Text(
                        queroEntrar
                            ? "Para continuar, efetue seu login"
                            : "Preencha os campos para se cadastrar",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Parte inferior da tela
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFCB2A2D),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(80)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Campo de E-mail
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF014574),
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(36),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset("assets/email.png",
                                      width: 20, height: 20),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "O e-mail não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O e-mail é muito curto";
                                }
                                if (!value.contains("@")) {
                                  return "O e-mail não é válido";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            // Campo de Senha
                            TextFormField(
                              controller: _senhaController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF014574),
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(36),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset("assets/lock.png",
                                      width: 20, height: 20),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "A senha não pode ser vazia";
                                }
                                if (value.length < 6) {
                                  return "A senha deve ter no mínimo 6 caracteres";
                                }
                                return null;
                              },
                            ),
                            if (!queroEntrar) ...[
                              SizedBox(height: 20),
                              // Campo de Confirmar Senha para cadastro
                              TextFormField(
                                controller: _confirmarSenhaController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirmar Senha',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF014574),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset("assets/lock.png",
                                        width: 20, height: 20),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "A confirmação de senha não pode ser vazia";
                                  }
                                  if (value != _senhaController.text) {
                                    return "As senhas não coincidem";
                                  }
                                  return null;
                                },
                              ),
                            ],
                            SizedBox(height: 20),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (queroEntrar) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    } else {
                                      // Lógica para cadastro
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Usuário cadastrado com sucesso!"),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Center(
                                    child: Text(
                                      queroEntrar ? "Entrar" : "Cadastrar",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFFCB2A2D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            // Alternar entre Login e Cadastro
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    queroEntrar = !queroEntrar;
                                  });
                                },
                                child: Text(
                                  queroEntrar
                                      ? "Ainda não tem conta? Cadastre-se"
                                      : "Já tem conta? Faça login",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
