import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:querido_diario/app/ui/components/phrases_card.dart';
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
          extendBodyBehindAppBar: true,
          drawer: HomeDrawer(currentTheme: currentTheme),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: currentTheme['fontColor'],
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: currentTheme['background'],
              image: DecorationImage(
                image: AssetImage(currentTheme['imgBackground']),
                fit: BoxFit.cover,

                colorFilter: ColorFilter.mode(
                  currentTheme['background'].withOpacity(.950),
                  BlendMode.dstATop,
                ),
              ),
            ),

            child: SafeArea(
              child: Column(
                children: [
                  PhrasesCard(
                    phrases:
                        'Ayrton Senna - Se você quer ser bem-sucedido, precisa ter dedicação total, buscar seu último limite e dar o melhor de si.',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
