import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:querido_diario/app/ui/cubit/theme_mode_cubit.dart';
import 'package:querido_diario/app/utils/themes.dart';
import 'package:toastification/toastification.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.currentTheme,
  });

  final Map<String, dynamic> currentTheme;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: currentTheme['appBar']),
            child: Text(
              'Menu',
              style: TextStyle(
                color: currentTheme['fontColor'],
                fontSize: 24,
              ),
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Home')),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Temas'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: currentTheme['appBar'],
                    title: Text(
                      'Escolher Tema',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: currentTheme['fontColor'],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Escolha uma cor para personalizar o tema do app:',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          // Grid de temas com altura fixa
                          SizedBox(
                            height:
                               180, // Altura menor para círculos pequenos
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        5, // Mais colunas para círculos pequenos
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                  ),
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                final selectedColor =
                                    context
                                        .read<ThemeModeCubit>()
                                        .selectedColor;
                                final temasWithSelection =
                                    getTemasWithSelection(selectedColor);
    
                                return InkWell(
                                  onTap: () {
                                    // Muda o tema baseado na cor selecionada
                                    final selectedColor = colors[index];
                                    context
                                        .read<ThemeModeCubit>()
                                        .switchToCustomTheme(
                                          selectedColor,
                                        );
    
                                    // Fecha o dialog
                                    Navigator.of(context).pop();
    
                                    // Mostra mensagem
                                    final themeName =
                                        colorThemes[selectedColor]?['name'] ??
                                        'Tema Colorido';
                                    toastification.show(
                                       title: Text('Tema Alterado para $themeName'),
                                       autoCloseDuration: Duration(seconds: 2)
                                    );
                                  },
                                  child: temasWithSelection[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
