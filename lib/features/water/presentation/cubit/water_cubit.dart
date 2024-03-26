import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:e_services/features/water/presentation/cubit/water_states.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class WaterCubit extends Cubit <WaterStates> {
  WaterCubit() : super(InitialWaterState());
  static WaterCubit get(context) => BlocProvider.of(context);
////////////////////////////////////////////////////////////////////////////////
  String? idImageUrl;
  uploadImageId() async {
    emit(UploadIDImageLoading());
    try {
      XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        File imageId = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(imageId!);
        idImageUrl = await refStorage.getDownloadURL();
      }
      emit(UploadIDImageSuccess());
    } catch (e) {
      emit(UploadIDImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String? imageContractUrl;
  uploadImageContract() async {
    emit(UploadContractImageLoading());
    try {
      XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        File imageId = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(imageId!);
        imageContractUrl = await refStorage.getDownloadURL();
      }
      emit(UploadContractImageSuccess());
    } catch (e) {
      emit(UploadContractImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String? imageReceiptUrl;
  uploadImageReceipt() async {
    emit(UploadReceiptImageLoading());
    try {
      XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        File imageId = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(imageId!);
        imageReceiptUrl = await refStorage.getDownloadURL();
      }
      emit(UploadReceiptImageSuccess());
    } catch (e) {
      emit(UploadReceiptImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference waterInstallation = FirebaseFirestore.instance.collection('waterInstallation');
  sendWaterInstallation({customerName, customerAddress, customerMobile, homeType, idImage, imageContract, imageReceipt}){
    emit(SendWaterInstallationLoading());
    try{
      waterInstallation.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'homeType': homeType,
        'idImage': idImage,
        'imageContract': imageContract,
        'imageReceipt': imageReceipt,
      });
      emit(SendWaterInstallationSuccess());
    } catch (e){
      emit(SendWaterInstallationError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String? imageReceiptMaintenanceUrl;
  uploadImageReceiptMaintenance() async {
    emit(UploadMaintenanceReceiptImageLoading());
    try {
      XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        File imageId = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(imageId!);
        imageReceiptMaintenanceUrl = await refStorage.getDownloadURL();
      }
      emit(UploadMaintenanceReceiptImageSuccess());
    } catch (e) {
      emit(UploadMaintenanceReceiptImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference waterMaintenanceRequest = FirebaseFirestore.instance.collection('waterMaintenanceRequest');
  sendMaintenanceRequest ({customerName, customerAddress, customerMobile, homeType, details, imageReceiptMaintenance}){
    emit(SendMaintenanceRequestLoading());
    try{
      waterMaintenanceRequest.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'homeType': homeType,
        'details': details,
        'imageReceiptMaintenance': imageReceiptMaintenance,
      });
      emit(SendMaintenanceRequestSuccess());
    } catch (e){
      emit(SendMaintenanceRequestError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String? imageMeterMaintenanceUrl;
  uploadImageMeterMaintenance() async {
    emit(UploadImageMeterLoading());
    try {
      XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        File imageId = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(imageId!);
        imageMeterMaintenanceUrl = await refStorage.getDownloadURL();
      }
      emit(UploadImageMeterSuccess());
    } catch (e) {
      emit(UploadImageMeterError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String? imageMeterReceiptUrl;
  uploadImageMeterReceiptMaintenance() async {
    emit(UploadImageMeterReceiptLoading());
    try {
      XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        File imageId = File(imgPicked.path);
        var random = Random().nextInt(10000);
        nameImage = '$random$nameImage';
        var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
        await refStorage.putFile(imageId!);
        imageMeterReceiptUrl = await refStorage.getDownloadURL();
      }
      emit(UploadImageMeterReceiptSuccess());
    } catch (e) {
      emit(UploadImageMeterReceiptError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference waterMeterReading = FirebaseFirestore.instance.collection('waterMeterReading');
  sendWaterMeterReading ({previousReading, nowReading, imageMeterMaintenance, imageMeterReceipt}){
    emit(SendWaterReadingLoading());
    try{
      waterMeterReading.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'previousReading': previousReading,
        'nowReading': nowReading,
        'imageMeterMaintenance': imageMeterMaintenance,
        'imageMeterReceipt': imageMeterReceipt,
      });
      emit(SendWaterReadingSuccess());
    } catch (e){
      emit(SendWaterReadingError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String selectedTypeInstallation = 'شقة';
  changeItemInstallation(val){
    selectedTypeInstallation = val;
    emit (ChangeItemInstallation());
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference removeWaterMeter = FirebaseFirestore.instance.collection('removeWaterMeter');
  sendRemoveWaterMeter ({customerName, customerAddress, customerMobile, nationalId, nowReadingMeter, reason}){
    emit(SendRemoveWaterMeterLoading());
    try{
      removeWaterMeter.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'nationalId': nationalId,
        'nowReadingMeter': nowReadingMeter,
        'reason': reason,
      });
      emit(SendRemoveWaterMeterSuccess());
    } catch (e){
      emit(SendRemoveWaterMeterError());
    }
  }
}