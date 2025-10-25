// Extrai as cores diretamente das chaves do colorThemes (definido abaixo)
import 'package:flutter/material.dart';

List<Color> get colors => colorThemes.keys.toList();

// Gera os temas visuais baseados nas cores do colorThemes
List<Widget> getTemasWithSelection(Color? selectedColor) => colors.map(
  (color) {
    final isSelected = selectedColor == color;
    return Stack(
      children: [
        CircleAvatar(
         
          backgroundColor: color,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        if (isSelected)
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 16,
              ),
            ),
          ),
      ],
    );
  },
).toList();

// Mantém a função original para compatibilidade
List<Card> get temas => colors.map(
  (color) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    color: color,
  ),
).toList();

final darkTheme = {
  'name': 'Dark',
  'background': Colors.black,
  'appBar': Colors.grey[900],
  'fontColor': Colors.white,
  'primary': Colors.purple,
};

final lightTheme = {
  'name': 'Light',
  'background': Colors.white,
  'appBar': Colors.purple,
  'fontColor': Colors.black,
  'primary': Colors.purple,
};

// Temas individuais para cada cor
final redTheme = {
  'name': 'Vermelho',
  'background': Colors.red[50],
  'appBar': Colors.red[700],
  'fontColor': Colors.white,
  'primary': Colors.red,
};

final blueTheme = {
  'name': 'Azul',
  'background': Colors.blue[50],
  'appBar': Colors.blue[700],
    'fontColor': Colors.black,
  'primary': Colors.blue,
};

final greenTheme = {
  'name': 'Verde',
  'background': Colors.green[50],
  'appBar': Colors.green[700],
  'fontColor': Colors.white,
  'primary': Colors.green,
};

final yellowTheme = {
  'name': 'Amarelo',
  'background': Colors.yellow[200],
  'appBar': Colors.yellow[700],
  'fontColor': Colors.black,
  'primary': Colors.yellow,
};

final orangeTheme = {
  'name': 'Laranja',
  'background': Colors.orange[50],
  'appBar': Colors.orange[700],
  'fontColor': Colors.black,
  'primary': Colors.orange,
};

final purpleTheme = {
  'name': 'Roxo',
  'background': Colors.purple[50],
  'appBar': Colors.purple[700],
  'fontColor': Colors.white,
  'primary': Colors.purple,
};

final tealTheme = {
  'name': 'Verde-azulado',
  'background': Colors.teal[50],
  'appBar': Colors.teal[700],
  'fontColor': Colors.white,
  'primary': Colors.teal,
};

final cyanTheme = {
  'name': 'Ciano',
  'background': Colors.cyan[50],
  'appBar': Colors.cyan[700],
  'fontColor': Colors.black,
  'primary': Colors.cyan,
};

final limeTheme = {
  'name': 'Lima',
  'background': Colors.lime[50],
  'appBar': Colors.lime[700],
  'fontColor': Colors.black,
  'primary': Colors.lime,
};

final indigoTheme = {
  'name': 'Índigo',
  'background': Colors.indigo[50],
  'appBar': Colors.indigo[700],
  'fontColor': Colors.white,
  'primary': Colors.indigo,
};

final brownTheme = {
  'name': 'Marrom',
  'background': Colors.brown[50],
  'appBar': Colors.brown[700],
  'fontColor': Colors.white,
  'primary': Colors.brown,
};

final greyTheme = {
  'name': 'Cinza',
  'background': Colors.grey[100],
  'appBar': Colors.grey[700],
  'fontColor': Colors.black,
  'primary': Colors.grey,
};

// Map que referencia todos os temas individuais
final colorThemes = {
  Colors.red: redTheme,
  Colors.blue: blueTheme,
  Colors.green: greenTheme,
  Colors.yellow: yellowTheme,
  Colors.orange: orangeTheme,
  Colors.purple: purpleTheme,
  Colors.teal: tealTheme,
  Colors.cyan: cyanTheme,
  Colors.lime: limeTheme,
  Colors.indigo: indigoTheme,
  Colors.brown: brownTheme,
  Colors.grey: greyTheme,
  Colors.black: darkTheme,
};