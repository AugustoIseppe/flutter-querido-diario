import 'package:flutter/material.dart';
import 'package:querido_diario/app/auth/auth_service.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({ super.key });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
    final authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    if (password != confirmPassword) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
      }
      return;
    }
    try {
      authService.signUpWithEmailAndPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: $e')),
        );
      }
    }
  }

  @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body:Container(
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
                        TextField(
                            controller: confirmPasswordController,
                            decoration: const InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                        ),
                       const SizedBox(height: 20),
                       ElevatedButton(
                           onPressed: () async {
                               final email = emailController.text;
                               final password = passwordController.text;
                               final confirmPassword = confirmPasswordController.text;
                               if (password != confirmPassword) {
                                   if (mounted) {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(content: Text('Passwords do not match')),
                                       );
                                   }
                                   return;
                               }
                               try {

                               await authService.signUpWithEmailAndPassword(email, password);
                               } catch (e) {
                                   if (mounted) {
                                    print(e);
                                       ScaffoldMessenger.of(context).showSnackBar(
                                           SnackBar(content: Text('Signup failed: $e')),
                                       );
                                   }
                               }
                           },
                           child: const Text('Sign Up'),
                       ),

                       const SizedBox(height: 20),

                   ],
               ),
           ),
       );
  }
} 