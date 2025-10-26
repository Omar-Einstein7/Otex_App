import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/common/bloc/locale_cubit.dart';
import 'package:optex_app/common/helper/navigation/app_navigation.dart';
import 'package:optex_app/common/helper/navigation/routes.dart';
import 'package:optex_app/presentation/home/bloc/navigation_cubit.dart';

import 'package:optex_app/l10n/app_localizations.dart';

import 'package:optex_app/presentation/home/pages/home_screen.dart';
import 'package:optex_app/presentation/profile/pages/plans_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(), // Home Screen
    const Scaffold(body: Center(child: Text('Chat – coming soon'))), // Chat placeholder
    const Scaffold(body: Center(child: Text('Add Advertisement – coming soon'))), // Placeholder for Screen 3
    const Scaffold(body: Center(child: Text('Advertisement – coming soon'))), // Placeholder for Screen 4
    const Scaffold(body: Center(child: Text('My Account – coming soon'))), // Placeholder for Screen 5
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: _screens[context.watch<NavigationCubit>().state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    theme: SvgTheme(currentColor: context.watch<NavigationCubit>().state.selectedIndex == 0 ? Colors.black : Colors.grey),
                    "lib/assets/icons/bungalow.svg",
                    color: context.watch<NavigationCubit>().state.selectedIndex == 0 ? Colors.black : Colors.grey,
                  ),
                  label: AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    color: context.watch<NavigationCubit>().state.selectedIndex == 1 ? Colors.black : Colors.grey,
                    theme: SvgTheme(currentColor: context.watch<NavigationCubit>().state.selectedIndex == 1 ? Colors.black : Colors.grey),
                    "lib/assets/icons/chat.svg",
                    colorFilter: ColorFilter.mode(context.watch<NavigationCubit>().state.selectedIndex == 1 ? Colors.black : Colors.grey, BlendMode.srcIn),
                  ),
                  label: AppLocalizations.of(context)!.chat,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    theme: SvgTheme(currentColor: context.watch<NavigationCubit>().state.selectedIndex == 2 ? Colors.blue : Colors.blue),
                    "lib/assets/icons/add_box.svg",
                    color: context.watch<NavigationCubit>().state.selectedIndex == 2 ? Colors.blue : Colors.blue,
                  ),
                  label: AppLocalizations.of(context)!.addProduct,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    theme: SvgTheme(currentColor: context.watch<NavigationCubit>().state.selectedIndex == 3 ? Colors.black : Colors.grey),
                    "lib/assets/icons/dataset.svg",
                    color: context.watch<NavigationCubit>().state.selectedIndex == 3 ? Colors.black : Colors.grey,
                  ),
                  label: AppLocalizations.of(context)!.myAds,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    theme: SvgTheme(currentColor: context.watch<NavigationCubit>().state.selectedIndex == 4 ? Colors.black : Colors.grey),
                    "lib/assets/icons/account_circle.svg",
                    color: context.watch<NavigationCubit>().state.selectedIndex == 4 ? Colors.black : Colors.grey,
                  ),
                  label: AppLocalizations.of(context)!.myAccount,
                ),
              ],
              currentIndex: context.watch<NavigationCubit>().state.selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              onTap: (index) {
                if (index == 4) {
                  AppNavigator.push(context, Routes.plan);
                } else {
                  context.read<NavigationCubit>().updateIndex(index);
                }
              },
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}