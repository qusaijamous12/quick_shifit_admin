import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quick_shift_admin/shared/utils/utils.dart';
import 'package:quick_shift_admin/view/mobile_home_screen/mobile_admin_home_screen.dart';

import '../model/user_model.dart';
import '../view/layout_responsive.dart';
import '../view/web_admin_login_screen.dart';

class LoginController extends GetxController{

  final _firebaseFireStore=FirebaseFirestore.instance;
  final _firebaseAuth=FirebaseAuth.instance;
  final isLoading=RxBool(false);
  final _userModel=Rxn<UserModel>();
  final allUsers=RxList<UserModel>([]);
  final allCompany=RxList<UserModel>([]);




  Future<void> adminLogin({required String email,required String password})async{
    isLoading(true);
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value)async{
        if(value.user?.uid!=null){
          await getUserData(uid: value.user!.uid);
          if(_userModel.value!=null){

             if (_userModel.value?.status == 1) {
              Get.offAll(() => const LayoutResponsive(mobileWidget: MobileAdminHomeScreen(), webWidget: WebAdminHomeScreen()));
              Utils.myToast(title: 'Login Success');
            }else{
               Utils.myToast(title: 'Login Failed!');
             }

          }
        }
        else{
          isLoading(false);
          Utils.myToast(title: 'Login Failed!');

        }

      }).catchError((error){
        print('there is an error in login ${error.toString()}');
        Utils.myToast(title: error.toString());

      });
    }catch(error){
      isLoading(false);
      Utils.myToast(title: error.toString());
    }
  }

  Future<void> getUserData({required String uid}) async {
    try {
      final result =
      await _firebaseFireStore.collection('users').doc(uid).get();
      if (result.data() != null) {
        _userModel(UserModel.fromJson(result.data()!));
      } else {
        _userModel(null);
        Utils.myToast(title: 'Please Check your network!');
      }
    } catch (e) {
      print('there is an error in get user Data $e');
    }
  }

  Future<void> getAllUsers()async{
    allUsers.clear();
    print('get all user S');
    isLoading(true);
    try{
      await _firebaseFireStore.collection('users').get().then((value){
        value.docs.forEach((element){
          if(element['status']==0){
            allUsers.add(UserModel.fromJson(element.data()));
          }
        });

      }).catchError((error){
        print('there is an error when get all users ! ${error.toString()}');
      });
      isLoading(false);

    }catch(error){
      isLoading(false);
      print('there is an error when get all users ! ${error.toString()}');
    }


  }
  Future<void> getAllCompany()async{
    allCompany.clear();
    print('get all company S');
    isLoading(true);
    try{
      await _firebaseFireStore.collection('users').get().then((value){
        value.docs.forEach((element){
          if(element['status']==2){
            allCompany.add(UserModel.fromJson(element.data()));
          }
        });

      }).catchError((error){
        print('there is an error when get all company ! ${error.toString()}');
      });
      isLoading(false);

    }catch(error){
      isLoading(false);
      print('there is an error when get all company ! ${error.toString()}');
    }


  }

  Future<void> createCompanyOwnerAccount({required String companyName,required String companyOwnerName,required String email,required String password,required String mobileNumber, String?companyUrl,required String description,required double latitude,required double longitude })async{
    isLoading(true);
    final result=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if(result.user!=null){

      await _firebaseFireStore.collection('users').doc(result.user?.uid).set({
        'company_name':companyName,
        'company_owner_name':companyOwnerName,
        'email':email,
        'mobile_number':mobileNumber,
        'company_url':companyUrl??'',
        'description':description,
        'latitude':latitude,
        'uid':result.user?.uid,
        'status':2,
        'profile_image':'https://static.vecteezy.com/system/resources/thumbnails/051/948/045/small_2x/a-smiling-man-with-glasses-wearing-a-blue-sweater-poses-warmly-against-a-white-background-free-photo.jpeg',
        'longitude':longitude
      }).then((value){
        Utils.myToast(title: 'Create Account Success');
        Get.offAll(()=>const LayoutResponsive(mobileWidget: MobileAdminHomeScreen(), webWidget: WebAdminHomeScreen()));

      }).catchError((error){
        print('there is an error when save data to fire store ${error.toString()}');
      });


    }else{
      Utils.myToast(title: 'Register Failed');
    }


    isLoading(false);

  }



  UserModel? get userModel=>_userModel.value;


}