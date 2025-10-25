import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:querido_diario/app/ui/cubit/theme_mode_cubit.dart';
import 'package:querido_diario/app/ui/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
      builder: (context, state) {
        final currentTheme = context.read<ThemeModeCubit>().currentTheme;
        return Scaffold(
          drawer: HomeDrawer(currentTheme: currentTheme),
          appBar: AppBar(
            title: Text(
              'HomePage',
              style: TextStyle(color: currentTheme['fontColor']),
            ),
            centerTitle: true,
            backgroundColor: currentTheme['appBar'],
            foregroundColor: currentTheme['fontColor'],
          ),
          body: Container(
            color: currentTheme['background'],
            alignment: Alignment.center,
            child: Text(
              'Welcome to HomePage!',
              style: TextStyle(color: currentTheme['fontColor']),
            ),
          ),
        );
      },
    );
  }
}

