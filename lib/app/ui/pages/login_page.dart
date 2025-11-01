import 'package:flutter/material.dart';
import 'package:querido_diario/app/auth/auth_service.dart';
import 'package:querido_diario/app/ui/pages/signup_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      authService.signInWithEmailAndPassword(email, password);
    } catch (e) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      }
    }
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Login'),),
           body: Container(
               padding: const EdgeInsets.all(16),
               child: Column(
                   children: [
                       TextField(
                           controller: emailController,
                           decoration: const InputDecoration(labelText: 'Email'),
                       ),
                       TextField(
                           controller: passwordController,
                           decoration: const InputDecoration(labelText: 'Password'),
                           obscureText: true,
                       ),
                       const SizedBox(height: 20),
                       ElevatedButton(
                           onPressed: () async {
                               final email = emailController.text;
                               final password = passwordController.text;
                               await authService.signInWithEmailAndPassword(email, password);
                           },
                           child: const Text('Login'),
                       ),

                       const SizedBox(height: 20),

                       InkWell(
                           onTap: () {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => const SignupPage()),
                               );
                           },
                           child: const Text(
                               'Não tem uma conta? Cadastre-se aqui.',
                               style: TextStyle(color: Colors.blue),
                           ),
                       ),
                   ],
               ),
           ),
       );
  }
}