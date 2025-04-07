import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../model/user_model.dart';
import '../../shared/resources/font_manger.dart';
import '../../shared/resources/padding_manger.dart';
import '../../shared/resources/style_manger.dart';
import '../../shared/widgets/my_app_bar.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  final _loginController = Get.find<LoginController>(tag: 'login_controller');

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _loginController.getAllUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: myAppBar(title: 'All Users'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding),
              itemBuilder: (context,index)=>buildUserItem(_loginController.allUsers[index]),
              separatorBuilder: (context,index)=>const SizedBox(
                height: PaddingManger.kPadding/2,
              ),
              itemCount: _loginController.allUsers.length,
            ),
          ),
        ],
      ),
    ));
  }
  Widget buildUserItem(UserModel model){
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: PaddingManger.kPadding/4,
            children: [
              Text(
                'User Name : ${model.userName}',
                style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
              ),
              Text(
                'User Email : ${model.email}',
                style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
              ),
              Text(
                'User Major : ${model.major}',
                style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
              ),
              Text(
                'User Uid : ${model.uid}',
                style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
              ),
              Text(
                'User Phone : ${model.mobileNumber}',
                style: getMyMediumTextStyle(color: Colors.black,fontSize: FontSize.s14),
              )
            ],
          )
        ],
      ),
    );
  }
}
