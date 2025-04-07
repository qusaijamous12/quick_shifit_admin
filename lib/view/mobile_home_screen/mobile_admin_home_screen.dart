import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/resources/color_manger/color_manger.dart';
import '../../shared/resources/padding_manger.dart';
import '../../shared/resources/style_manger.dart';
import '../../shared/widgets/responseive_drawer.dart';
import '../admin_login_screen.dart';
import 'all_company_owners.dart';
import 'all_users.dart';
import 'create_company_one.dart';

class MobileAdminHomeScreen extends StatelessWidget {
  const MobileAdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kPrimary,
        title:const Text('HomeScreen',style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
      ),
      drawer:responsiveDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PaddingManger.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Admin ',
              style: getMySemiBoldTextStyle(color: Colors.black,fontSize: 25),
            ),
            const  SizedBox(
              height:PaddingManger.kPadding ,
            ),
            Text(
              'You Can From Here To Manage All The App ',
              style: getMyMediumTextStyle(color: ColorManger.grey),
            ),
            const SizedBox(
              height: PaddingManger.kPadding,
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>const AllUsers(),transition: Transition.rightToLeft,duration:const Duration(milliseconds: 500),curve: Curves.linear);


              },
              child: Container(
                padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
                  color: Colors.white,

                ),
                child: Row(
                  children: [
                    const  Icon(Icons.person,color: ColorManger.kPrimary,size: 80,),
                    const SizedBox(
                      width: PaddingManger.kPadding,
                    ),
                    Text(
                      'All Users',
                      style: getMyMediumTextStyle(color: Colors.black,fontSize: 20),
                    ),
                    const  Spacer(),
                    const  Icon(Icons.arrow_forward_ios,color: ColorManger.kPrimary,size: 25,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PaddingManger.kPadding,
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>const AllCompanyOwners(),transition: Transition.rightToLeft,duration:const Duration(milliseconds: 500),curve: Curves.linear);


              },
              child: Container(
                padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
                  color: Colors.white,

                ),
                child: Row(
                  children: [
                    const  Icon(Icons.work,color: ColorManger.kPrimary,size: 80,),
                    const SizedBox(
                      width: PaddingManger.kPadding,
                    ),
                    Text(
                      'All Company Owners',
                      style: getMyMediumTextStyle(color: Colors.black,fontSize: 20),
                    ),
                    const  Spacer(),
                    const  Icon(Icons.arrow_forward_ios,color: ColorManger.kPrimary,size: 25,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PaddingManger.kPadding,
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>const CreateCompanyOne(),transition: Transition.rightToLeft,duration:const Duration(milliseconds: 500),curve: Curves.linear);


              },
              child: Container(
                padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
                  color: Colors.white,

                ),
                child: Row(
                  children: [
                    const  Icon(Icons.work,color: ColorManger.kPrimary,size: 80,),
                    const SizedBox(
                      width: PaddingManger.kPadding,
                    ),
                    Text(
                      'Create Company',
                      style: getMyMediumTextStyle(color: Colors.black,fontSize: 20),
                    ),
                    const  Spacer(),
                    const  Icon(Icons.arrow_forward_ios,color: ColorManger.kPrimary,size: 25,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PaddingManger.kPadding,
            ),
            GestureDetector(
              onTap: (){
                Get.offAll(()=>const AdminLoginScreen());

              },
              child: Container(
                padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(PaddingManger.kPadding),
                  color: Colors.white,

                ),
                child: Row(
                  children: [
                    const  Icon(Icons.logout,color: ColorManger.kPrimary,size: 80,),
                    const SizedBox(
                      width: PaddingManger.kPadding,
                    ),
                    Text(
                      'Log Out',
                      style: getMyMediumTextStyle(color: Colors.black,fontSize: 20),
                    ),
                    const  Spacer(),
                    const  Icon(Icons.arrow_forward_ios,color: ColorManger.kPrimary,size: 25,)
                  ],
                ),
              ),
            ),





          ],
        ),
      )
    );
  }
}
