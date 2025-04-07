import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/admin_login_screen.dart';
import '../../view/layout_responsive.dart';
import '../../view/mobile_home_screen/mobile_admin_home_screen.dart';
import '../../view/web_admin_login_screen.dart';
import '../resources/color_manger/color_manger.dart';

Widget responsiveDrawer(){
  return  Drawer(
    backgroundColor: ColorManger.kPrimary,
    child: Column(
      children: [
      const  DrawerHeader(child: Icon(Icons.dashboard,color: Colors.white,)),
        ListTile(
          onTap: (){
            Get.to(()=>const LayoutResponsive(mobileWidget: MobileAdminHomeScreen(), webWidget: WebAdminHomeScreen()));

          },
          leading:const Icon(Icons.home,color: Colors.white,),
          title: const Text('H O M E',style: TextStyle(
              color: Colors.white
          ),),
        ),
        ListTile(
          onTap: (){
            Get.offAll(()=>const AdminLoginScreen());
          },
          leading:const Icon(Icons.logout,color: Colors.white,),
          title:const Text('L O G O U T',style: TextStyle(
              color: Colors.white
          ),),
        )

      ],
    ),
  );
}