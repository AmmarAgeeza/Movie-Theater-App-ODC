import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.backgroundColor,
      width: 250,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(

                    radius: 35,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: ColorManager.primary,
                    ),
                  ),
                  Text(
                    'Ammar Ageeza',
                    style: AppTextStyles.login(customFontSize: 15),
                  )
                ],
              ),
              buildCustomListTile(title: 'Account', icon: Icons.person),
              buildCustomListTile(title: 'Setting', icon: Icons.settings),
              buildCustomListTile(
                  title: 'About', icon: Icons.security_update_warning_outlined),
              buildCustomListTile(title: 'Logout', icon: Icons.logout),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCustomListTile({required IconData icon, required String title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            size: 35,
            color: ColorManager.primary,
          ),
        ),
        Text(
          title,
          style: AppTextStyles.login(customFontSize: 15),
        ),
      ],
    );
  }
}
