import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/snac_bar.dart';
import 'register_states.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit() : super(InitialLoginState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
/////////////////////////////////////////////////////////////////////////////////////////// upload image
  File? file;
  var imagePicker = ImagePicker();
  String? url;
  uploadImage() async {
    emit(UploadImageRegisterLoading());
    try {
      XFile? imgPicked = await imagePicker.pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        file = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(file!);
        url = await refStorage.getDownloadURL();
      }
      emit(UploadImageRegisterSuccess());
    } catch (e) {
      debugPrint('error is $e');
      emit(UploadImageRegisterError());
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////// register
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredentialRegister;
  createUser({email, password, context, urlImage, firstName, lastName, nationalId}) async {
    emit(RegisterLoading());
    userCredentialRegister = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      defaultSnackBar(
          context: context,
          color: blueColor,
          text: 'Your Email is Generated successfully');
      users.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'urlImage': urlImage,
        'emailAddress': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'nationalId': nationalId,
        'uid': FirebaseAuth.instance.currentUser?.uid,
      });
      emit(RegisterSuccess());
    }).catchError((e){
      print('error is ${e.toString()}');
      emit(RegisterError(e.toString()));
    });
  }
/////////////////////////////////////////////////////////////////////////////////////////// login
  UserCredential? userCredentialLogin;
  loginUser( String email, String password, BuildContext context ) async {
    emit(LoginLoading());
    userCredentialLogin = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
      defaultSnackBar(text: 'Login Successfully' , context: context , color: Colors.green);
      emit(LoginSuccess());
    }).catchError((error){
      defaultSnackBar(text: error.toString(), context: context,color: Colors.red);
      emit(LoginError(e.toString())
      );
    });
  }
///////////////////////////////////////////////////////////////////////////////////////////

}