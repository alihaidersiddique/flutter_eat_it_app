import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/const/const.dart';
import 'package:flutter_eat_it_app/strings/restaurant_home_strings.dart';
import 'package:flutter_eat_it_app/view_model/menu_vm/menu_view_model_imp.dart';
import 'package:flutter_eat_it_app/widget/menu/menu_widget.dart';
import 'package:flutter_eat_it_app/widget/menu/home_menu_widget.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final viewModel = MenuViewModelImp();

  MenuScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Color(COLOR_ICON_DRAWER),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
            Divider(thickness: 1),
            HomeMenuWidget(zoomDrawerController: zoomDrawerController),
            Divider(thickness: 1),
            MenuWidget(
              icon: Icons.list,
              menuName: categoryText,
              callback: viewModel.navigateCategories,
            )
          ],
        ),
      ),
    );
  }
}
