import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/common/bloc/locale_cubit.dart';

import 'package:optex_app/l10n/app_localizations.dart';

import 'package:optex_app/presentation/home/pages/home_screen.dart';
import 'package:optex_app/presentation/profile/pages/plans_screen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // Home Screen
    Container(color: Colors.red), // Placeholder for Screen 2
    Container(color: Colors.green), // Placeholder for Screen 3
    Container(color: Colors.blue), // Placeholder for Screen 4
    const PlansScreen() 
    // Placeholder for Screen 5
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final currentLocale = context.read<LocaleCubit>().state.locale;
          if (currentLocale.languageCode == 'en') {
            context.read<LocaleCubit>().toArabic();
          } else {
            context.read<LocaleCubit>().toEnglish();
          }
        },
        child: Text(AppLocalizations.of(context)!.appTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              theme: SvgTheme(currentColor: _selectedIndex == 0 ? Colors.black : Colors.grey, ),
              "lib/assets/icons/bungalow.svg",
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
               theme: SvgTheme(currentColor: _selectedIndex == 0 ? Colors.black : Colors.grey, ),
              "lib/assets/icons/chat.svg",
              colorFilter: ColorFilter.mode(_selectedIndex == 1 ? Colors.black : Colors.grey ,  BlendMode.srcIn,),
            ),
            label: AppLocalizations.of(context)!.chat,
          ),
          BottomNavigationBarItem(
            
            icon: SvgPicture.asset(
               theme: SvgTheme(currentColor: _selectedIndex == 0 ? Colors.black : Colors.grey, ),
              "lib/assets/icons/add_box.svg",
            ),
            label: AppLocalizations.of(context)!.addProduct,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
               theme: SvgTheme(currentColor: _selectedIndex == 0 ? Colors.black : Colors.grey, ),
              "lib/assets/icons/dataset.svg",
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: AppLocalizations.of(context)!.myAds,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
               theme: SvgTheme(currentColor: _selectedIndex == 0 ? Colors.black : Colors.grey, ),
              "lib/assets/icons/account_circle.svg",
              color: _selectedIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: AppLocalizations.of(context)!.myAccount,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}