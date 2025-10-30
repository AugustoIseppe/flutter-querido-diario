// Extrai as cores diretamente das chaves do colorThemes (definido abaixo)
import 'package:flutter/material.dart';
import 'package:querido_diario/app/utils/assets.dart';

List<Color> get colors => colorThemes.keys.toList();

List<Widget> getTemasWithSelection(Color? selectedColor) => colors.map(
  (color) {
    final isSelected = selectedColor == color;
    final theme = colorThemes[color];
    final backgroundImage = theme?['imgBackground'] as String?;
    final themeName = theme?['name'] as String? ?? 'Tema';
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: isSelected 
          ? Border.all(color: Colors.green, width: 3)
          : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Imagem de fundo
            if (backgroundImage != null)
              Positioned.fill(
                child: Image.asset(
                  height: 170,
                  backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
            // Overlay escuro sutil para melhorar legibilidade
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            // Nome do tema
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                themeName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Círculo com a cor do tema
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                // Check indicator dentro do círculo
                child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20,
                    )
                  : null,
              ),
            ),
          ],
        ),
      ),
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

final blueTheme = {
  'name': 'Azul',
  'background': Colors.blue[50],
  'appBar': Colors.blue[700],
    'fontColor': Colors.black,
  'primary': Colors.blue,
  'imgBackground': Assets.bg4,
  'bottomNavBar': Colors.blue[700],
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

final cyanTheme = {
  'name': 'Ciano',
  'background': Colors.cyan[50],
  'appBar': Colors.cyan[700],
  'fontColor': Colors.black,
  'primary': Colors.cyan,
  'imgBackground': Assets.bg11,
  'bottomNavBar': Colors.cyan[700],
};

final indigoTheme = {
  'name': 'Índigo',
  'background': Colors.indigo[50],
  'appBar': Colors.indigo[700],
  'fontColor': Colors.white,
  'primary': Colors.indigo,
  'imgBackground': Assets.bg6,
  'bottomNavBar': Colors.indigo[700],
};

final pinkTheme = {
  'name': 'Pink',
  'background': Colors.pink[50],
  'appBar': Colors.pink[700],
  'fontColor': Colors.black,
  'primary': Colors.pink,
  'imgBackground': Assets.bg81,
  'bottomNavBar': Colors.pink[700],
};

final colorThemes = {
  Colors.blue: blueTheme,
  Colors.purple: purpleTheme,
  Colors.cyan: cyanTheme,
  Colors.indigo: indigoTheme,
  Colors.black: darkTheme,
  Colors.pink: pinkTheme
};