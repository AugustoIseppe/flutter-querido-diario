import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:querido_diario/app/ui/cubit/theme_mode_cubit.dart';
import 'package:querido_diario/app/ui/pages/home_page.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _DashboardState();
}

class _DashboardState extends State<HomeDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomePage(), Container(), Container(), Container()];

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.user,
    FontAwesomeIcons.gear,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
      builder: (context, state) {
        final currentTheme = context.read<ThemeModeCubit>().currentTheme;
        
        return Scaffold(
   // permite que o body se estenda por baixo da bottom navigation bar
   extendBody: true,
   body: _screens[_currentIndex], //destination screen
   floatingActionButton: FloatingActionButton(
    
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: currentTheme['bottomNavBar'],
      elevation: 8.0,
      child: Icon(Icons.add, color: currentTheme['fontColor']),
   ),
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   bottomNavigationBar: ClipRRect(
    
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: Material(
        color: currentTheme['bottomNavBar'],
        child: AnimatedBottomNavigationBar(
          backgroundColor: currentTheme['bottomNavBar'], // usa a cor diretamente também
          activeColor: currentTheme['fontColor'],
          inactiveColor: currentTheme['fontColor']?.withOpacity(0.5),
          icons: iconList,
          activeIndex: _currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => setState(() => _currentIndex = index),
          //other params
        ),
      ),
   ),
);
      },
    );
  }
}
