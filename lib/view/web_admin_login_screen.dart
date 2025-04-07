import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/login_controller.dart';
import '../model/user_model.dart';
import '../shared/resources/color_manger/color_manger.dart';
import '../shared/resources/font_manger.dart';
import '../shared/resources/padding_manger.dart';
import '../shared/resources/style_manger.dart';
import 'admin_login_screen.dart';
import 'create_company_web.dart';
import 'mobile_home_screen/create_company_one.dart';

class WebAdminHomeScreen extends StatefulWidget {
  const WebAdminHomeScreen({super.key});

  @override
  State<WebAdminHomeScreen> createState() => _WebAdminHomeScreenState();
}

class _WebAdminHomeScreenState extends State<WebAdminHomeScreen> {
  final _loginController = Get.find<LoginController>(tag: 'login_controller');

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _loginController.getAllUsers();
      await _loginController.getAllCompany();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Row(
        children: [

          Container(
            width: 250,
            color: const Color(0xff212b46), // Primary color
            child:  Column(
              children: [
                const DrawerHeader(
                  child: Icon(Icons.dashboard, color: Colors.white, size: 40),
                ),
                const ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('Home', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: (){
                    Get.offAll(()=>const AdminLoginScreen());

                  },
                  leading:const Icon(Icons.logout, color: Colors.white),
                  title:const Text('Logout', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: (){
                    Get.to(()=>const CreateCompanyOne());

                  },
                  leading:const Icon(Icons.logout, color: Colors.white),
                  title:const Text('Create Company', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(PaddingManger.kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Users',
                    style: getMyMediumTextStyle(
                      color: Colors.black,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  const SizedBox(
                    height: PaddingManger.kPadding,
                  ),
                  Expanded(
                    child: ListView.separated(
                     
                      itemBuilder: (context, index)=>buildUserItem(_loginController.allUsers[index]),
                      separatorBuilder: (context,index)=>const SizedBox(
                        height: PaddingManger.kPadding,
                      ),
                      itemCount: _loginController.allUsers.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: PaddingManger.kPadding),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(PaddingManger.kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Company',
                    style: getMyMediumTextStyle(
                      color: Colors.black,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  const SizedBox(
                    height: PaddingManger.kPadding,
                  ),
                  Expanded(
                    child: ListView.separated(
                      // shrinkWrap: true,
                      // physics:const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index)=>buildCompanyItem(_loginController.allCompany[index]),
                      separatorBuilder: (context,index)=>const SizedBox(
                        height: PaddingManger.kPadding,
                      ),
                      itemCount: _loginController.allCompany.length,
                    ),
                  ),
                  const SizedBox(
                    height: PaddingManger.kPadding,
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(
            height: PaddingManger.kPadding*2,
          ),
        ],
      ),
    ));
  }

  Widget buildUserItem(UserModel model) {
    return Container(
      padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding/2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(model.profileImage),
          ),
          const SizedBox(width: PaddingManger.kPadding / 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Expanded(
                     child: Text(
                       'User Name : ${model.userName}',
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                       style: getMyMediumTextStyle(
                         color: Colors.black,
                         fontSize: FontSize.s14,
                       ),
                     ),
                   ),
                   const SizedBox(width: PaddingManger.kPadding / 2),
                   Expanded(
                     child: Text(
                       'User Email : ${model.email}',
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                       style: getMyMediumTextStyle(
                         color: Colors.black,
                         fontSize: FontSize.s14,
                       ),
                     ),
                   ),
                 ],
               ),
                const SizedBox(width: PaddingManger.kPadding),
                Text(
                  'User Phone : ${model.phoneNumber}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: getMyMediumTextStyle(
                    color: Colors.black,
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget buildCompanyItem(UserModel model) {
    return Container(
      padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding/2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(model.profileImage),
          ),
          const SizedBox(width: PaddingManger.kPadding / 2),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   Expanded(
                     child: Text(
                       'Company Name : ${model.companyName}',
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                       style: getMyMediumTextStyle(
                         color: Colors.black,
                         fontSize: FontSize.s14,
                       ),
                     ),
                   ),
                   const SizedBox(width: PaddingManger.kPadding / 2),
                   Expanded(
                     child: Text(
                       'Company Email : ${model.email}',
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                       style: getMyMediumTextStyle(
                         color: Colors.black,
                         fontSize: FontSize.s14,
                       ),
                     ),
                   ),
                 ],
               ),
               const SizedBox(width: PaddingManger.kPadding ),
               Text(
                 'Company Phone : ${model.phoneNumber}',
                 overflow: TextOverflow.ellipsis,
                 maxLines: 1,
                 style: getMyMediumTextStyle(
                   color: Colors.black,
                   fontSize: FontSize.s14,
                 ),
               ),
               const SizedBox(
                 height: PaddingManger.kPadding,
               ),
               Container(
                 height: 300,
                 width: double.infinity,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
                     color: Colors.white
                 ),
                 child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(model.latitude, model.longitude),zoom: 14),
                   markers: {
                     Marker(
                         markerId: MarkerId('${model.uid}',),
                         position: LatLng(model.latitude, model.longitude)
                     )
                   },
                 ),
               )
             ],
           ),
         )
        ],
      ),
    );
  }
}
