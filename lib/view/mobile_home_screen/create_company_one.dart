import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/resources/color_manger/color_manger.dart';
import '../../shared/resources/padding_manger.dart';
import '../../shared/resources/style_manger.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/my_app_bar.dart';
import '../../shared/widgets/my_text_field.dart';
import 'create_company_two.dart';

class CreateCompanyOne extends StatefulWidget {
  const CreateCompanyOne({super.key});

  @override
  _CreateCompanyOneState createState() => _CreateCompanyOneState();
}

class _CreateCompanyOneState extends State<CreateCompanyOne> {
  final _companyNameController = TextEditingController();
  final _companyOwnerNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyWebSite = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Utils.hideKeyboard(context);
      },
      onVerticalDragDown: (details){
        Utils.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(title: 'Add Company'),
        body: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: PaddingManger.kPadding,
            children: [
              Text(
                'Please fill the following fields to add a company owner ...',
                style: getMyMediumTextStyle(color: Colors.black),
              ),
              // Company Name
              Text(
                'Company Name',
                style: getMyRegulerTextStyle(color: ColorManger.grey),
              ),
              MyTextField(controller: _companyNameController, labelText: 'Name', prefixIcon: const Icon(Icons.work, color: Colors.white,)),

              // Company Owner Name
              Text(
                'Company Owner Name',
                style: getMyRegulerTextStyle(color: ColorManger.grey),
              ),
              MyTextField(controller: _companyOwnerNameController, labelText: 'Name', prefixIcon: const Icon(Icons.person, color: Colors.white,)),

              // Company Email
              Text(
                'Company Email',
                style: getMyRegulerTextStyle(color: ColorManger.grey),
              ),
              MyTextField(controller: _emailController, labelText: 'Email', prefixIcon: const Icon(Icons.email_outlined, color: Colors.white,)),

              // Password
              Text(
                'Password',
                style: getMyRegulerTextStyle(color: ColorManger.grey),
              ),
              MyTextField(controller: _passwordController, labelText: 'Enter Your Password', prefixIcon: const Icon(Icons.lock_open, color: Colors.white,), isPassword: true),

              // Mobile Number
              Text(
                'Mobile Number',
                style: getMyRegulerTextStyle(color: ColorManger.grey),
              ),
              MyTextField(controller: _phoneController, labelText: 'Enter Your Phone', prefixIcon: const Icon(Icons.phone, color: Colors.white,),keyBoardType: TextInputType.phone,),

              // Company Website
              Text(
                'If your company has a website, please add the URL in the following field',
                style: getMyRegulerTextStyle(color: ColorManger.grey),
              ),
              MyTextField(controller: _companyWebSite, labelText: 'URL', prefixIcon: const Icon(Icons.work, color: Colors.white,)),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Move to the next page ...',
                    style: getMyRegulerTextStyle(color: ColorManger.grey),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(_companyNameController.text.isNotEmpty&&_companyOwnerNameController.text.isNotEmpty&&_emailController.text.isNotEmpty&&_passwordController.text.isNotEmpty&&_phoneController.text.isNotEmpty){
                        Get.to(()=> AddCompanyOwnerScreenTwo(companyName: _companyNameController.text, companyOwnerName: _companyOwnerNameController.text, email: _emailController.text, password: _passwordController.text, mobileNumber: _phoneController.text));

                      }else{
                        Utils.myToast(title: 'All Fields are requierd');
                      }
                    },
                    child: Container(
                      padding:const EdgeInsetsDirectional.all(PaddingManger.kPadding/1.5),
                      decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManger.kPrimary
                      ),
                      child:const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
