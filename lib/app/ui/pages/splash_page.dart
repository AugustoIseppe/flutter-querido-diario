import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({ super.key });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('SplashPage'), centerTitle: true,),
           body: Center(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                   Text('Welcome to SplashPage!'),
                   TextButton(
                      onPressed: () {
                       // rota correta registrada em routes.dart é '/home-page'
                       context.push('/home-page');
                      },
                      child: Text('Go to HomePage'),
                   ),
                ],
             ),
           ),
       );
  }
}