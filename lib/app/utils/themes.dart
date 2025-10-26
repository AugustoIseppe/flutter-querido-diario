// Extrai as cores diretamente das chaves do colorThemes (definido abaixo)
import 'package:flutter/material.dart';
import 'package:querido_diario/app/utils/assets.dart';

List<Color> get colors => colorThemes.keys.toList();

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
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    color: color,
  ),
).toList();

final darkTheme = {
  'name': 'Dark',
  'background': Colors.black,
  'appBar': Colors.black,
  'fontColor': Colors.white,
  'primary': Colors.purple,
  'imgBackground': Assets.bg1,
  'bottomNavBar': Colors.black,
};

final lightTheme = {
  'name': 'Light',
  'background': Colors.white,
  'appBar': Colors.purple,
  'fontColor': Colors.black,
  'primary': Colors.purple,
  'imgBackground': Assets.bg2,
  'bottomNavBar': Colors.white,
};

// Temas individuais para cada cor
final redTheme = {
  'name': 'Vermelho',
  'background': Colors.red[50],
  'appBar': Colors.red[700],
  'fontColor': Colors.white,
  'primary': Colors.red,
  'imgBackground': Assets.bg3,
  'bottomNavBar': Colors.red[700],
};

final blueTheme = {
  'name': 'Azul',
  'background': Colors.blue[50],
  'appBar': Colors.blue[700],
    'fontColor': Colors.black,
  'primary': Colors.blue,
  'imgBackground': Assets.bg4,
  'bottomNavBar': Colors.blue[700],
};

final greenTheme = {
  'name': 'Verde',
  'background': Colors.green[50],
  'appBar': Colors.green[700],
  'fontColor': Colors.white,
  'primary': Colors.green,
  'imgBackground': Assets.bg6,
  'bottomNavBar': Colors.green[700],
};

final yellowTheme = {
  'name': 'Amarelo',
  'background': Colors.yellow[200],
  'appBar': Colors.yellow[700],
  'fontColor': Colors.black,
  'primary': Colors.yellow,
  'imgBackground': Assets.bg7,
  'bottomNavBar': Colors.yellow[700], 
};

final orangeTheme = {
  'name': 'Laranja',
  'background': Colors.orange[50],
  'appBar': Colors.orange[700],
  'fontColor': Colors.black,
  'primary': Colors.orange,
  'imgBackground': Assets.bg8,
  'bottomNavBar': Colors.orange[700],
};

final purpleTheme = {
  'name': 'Roxo',
  'background': Colors.purple[50],
  'appBar': Colors.purple[700],
  'fontColor': Colors.white,
  'primary': Colors.purple,
  'imgBackground': Assets.bg9,
  'bottomNavBar': Colors.purple[700],
};

final tealTheme = {
  'name': 'Verde-azulado',
  'background': Colors.teal[50],
  'appBar': Colors.teal[700],
  'fontColor': Colors.white,
  'primary': Colors.teal,
  'imgBackground': Assets.bg10,   
  'bottomNavBar': Colors.teal[700],
};

final cyanTheme = {
  'name': 'Ciano',
  'background': Colors.cyan[50],
  'appBar': Colors.cyan[700],
  'fontColor': Colors.black,
  'primary': Colors.cyan,
  'imgBackground': Assets.bg11,
  'bottomNavBar': Colors.cyan[700],
};

final limeTheme = {
  'name': 'Lima',
  'background': Colors.lime[50],
  'appBar': Colors.lime[700],
  'fontColor': Colors.black,
  'primary': Colors.lime,
  'imgBackground': Assets.bg1,
  'bottomNavBar': Colors.lime[700],
};

final indigoTheme = {
  'name': 'Índigo',
  'background': Colors.indigo[50],
  'appBar': Colors.indigo[700],
  'fontColor': Colors.white,
  'primary': Colors.indigo,
  'imgBackground': Assets.bg2,
  'bottomNavBar': Colors.indigo[700],
};

final brownTheme = {
  'name': 'Marrom',
  'background': Colors.brown[50],
  'appBar': Colors.brown[700],
  'fontColor': Colors.white,
  'primary': Colors.brown,
  'imgBackground': Assets.bg3,
  'bottomNavBar': Colors.brown[700],
};

final greyTheme = {
  'name': 'Cinza',
  'background': Colors.grey[100],
  'appBar': Colors.grey[700],
  'fontColor': Colors.black,
  'primary': Colors.grey,
  'imgBackground': Assets.bg4,
  'bottomNavBar': Colors.grey[700],
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