import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_images.dart';
import 'package:crypto_listing/src/screens/details_page/details_page.dart';
import 'package:crypto_listing/src/screens/home_page/home_page.dart';
import 'package:crypto_listing/src/screens/movement_page/movement_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bottom_navigation_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends ConsumerState<BottomNavBar> {
  final List<Widget> pages = [
    const HomePage(),
    const DetailsPage(),
    const HomeMovement()
  ];

  @override
  Widget build(BuildContext context) {
    ref.watch(currentPage);
    return Scaffold(
      body: pages[ref.read(currentPage)],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.read(currentPage),
        selectedItemColor: AppColors.brandPrimary,
        onTap: (int index) => ref.read(currentPage.state).state = index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppImages.iconWarren)),
              label: AppLocalizations.of(context)!.nameHome),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppImages.iconWallet)),
            label: AppLocalizations.of(context)!.nameWallet,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppImages.iconMovement)),
            label: AppLocalizations.of(context)!.nameMovement,
          ),
        ],
      ),
    );
  }
// Selected
}
