import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/login_controller.dart';
import '../../model/user_model.dart';
import '../../shared/resources/font_manger.dart';
import '../../shared/resources/padding_manger.dart';
import '../../shared/resources/style_manger.dart';
import '../../shared/widgets/my_app_bar.dart';

class AllCompanyOwners extends StatefulWidget {
  const AllCompanyOwners({super.key});

  @override
  State<AllCompanyOwners> createState() => _AllCompanyOwnersState();
}

class _AllCompanyOwnersState extends State<AllCompanyOwners> {
  final _loginController = Get.find<LoginController>(tag: 'login_controller');

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _loginController.getAllCompany();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: myAppBar(title: 'All Company'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding),
              itemBuilder: (context,index)=>buildCompanyItem(_loginController.allCompany[index]),
              separatorBuilder: (context,index)=>const SizedBox(
                height: PaddingManger.kPadding/2,
              ),
              itemCount: _loginController.allCompany.length,
            ),
          ),
        ],
      ),
    ));
  }
  Widget buildCompanyItem(UserModel model){
    return Container(
      padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding/1.5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding/1.5)
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:NetworkImage(model.profileImage) ,
          ),
          const SizedBox(
            width: PaddingManger.kPadding/4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: PaddingManger.kPadding/4,
              children: [
                Text(
                  'Company Name : ${model.companyName}',
                  style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
                ),
                Text(
                  'Company Owner Name : ${model.companyOwnerName}',
                  style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
                ),
                Text(
                  'Company Email : ${model.email}',
                  style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
                ),
                Text(
                  'User Uid : ${model.uid}',
                  style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
                ),
                Text(
                  'User Phone : ${model.mobileNumber}',
                  style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
                ),
                Text(
                  'Company Location',
                  style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
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
                      markerId:const MarkerId('locatio',),
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
