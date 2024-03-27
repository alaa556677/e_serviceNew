import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:e_services/features/water/presentation/cubit/water_states.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../domain/entity/1.1water_installation_entity.dart';
import '../../domain/entity/2.1water_maintenance_entity.dart';
import '../../domain/entity/3.1water_meter_reading_entity.dart';
import '../../domain/entity/4.1water_remove_meter_entity.dart';

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
  sendMaintenanceRequest ({customerName, customerAddress, customerMobile, homeType, details, imageReceiptMaintenance}) async {
    emit(SendMaintenanceRequestLoading());
    try{
      waterMaintenanceRequest.add({
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
//   String? imageMeterMaintenanceUrl;
//   uploadImageMeterMaintenance() async {
//     emit(UploadImageMeterLoading());
//     try {
//       XFile? imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
//       var nameImage = basename(imgPicked!.path);
//       if (imgPicked != null) {
//         File imageId = File(imgPicked.path);
//         var random = Random().nextInt(10000);
//         nameImage = '$random$nameImage';
//         var refStorage = FirebaseStorage.instance.ref("images/$nameImage");
//         await refStorage.putFile(imageId!);
//         imageMeterMaintenanceUrl = await refStorage.getDownloadURL();
//       }
//       emit(UploadImageMeterSuccess());
//     } catch (e) {
//       emit(UploadImageMeterError());
//     }
//   }
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
  sendWaterMeterReading ({customerName, customerAddress, previousReading, nowReading, meterNumber, imageMeterReceipt}){
    emit(SendWaterReadingLoading());
    try{
      waterMeterReading.add({
        'customerName' : customerName,
        'customerAddress' : customerAddress,
        'previousReading': previousReading,
        'nowReading': nowReading,
        'meterNumber': meterNumber,
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
  sendRemoveWaterMeter ({customerName, customerAddress, customerMobile, meterNumber, nowReadingMeter, reason}){
    emit(SendRemoveWaterMeterLoading());
    try{
      removeWaterMeter.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'meterNumber': meterNumber,
        'nowReadingMeter': nowReadingMeter,
        'reason': reason,
      });
      emit(SendRemoveWaterMeterSuccess());
    } catch (e){
      emit(SendRemoveWaterMeterError());
    }
  }
//////////////////////////////////////////////////////////////////////////////// show all water installation request
  List <WaterInstallationEntity> waterInstallationRequestList = [];
  getWaterInstallation() async {
    emit(GetWaterInstallationListLoading());
    await FirebaseFirestore.instance.collection('waterInstallation').get().then((value){
      for(var i in value.docs){
        waterInstallationRequestList.add(WaterInstallationEntity.fromJson(i.data()));
      }
      emit(GetWaterInstallationListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetWaterInstallationListError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <WaterMaintenanceEntity> waterMaintenanceRequestList = [];
  getWaterMaintenance() async{
    emit(GetWaterMaintenanceListLoading());
    await FirebaseFirestore.instance.collection('waterMaintenanceRequest').get().then((value){
      for(var i in value.docs){
        waterMaintenanceRequestList.add(WaterMaintenanceEntity.fromJson(i.data()));
      }
      emit(GetWaterMaintenanceListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetWaterMaintenanceListError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <WaterMeterReadingEntity> waterMeterReadingRequestList = [];
  getWaterMeterReading() async{
    emit(GetWaterMeterReadingLoading());
    await FirebaseFirestore.instance.collection('waterMeterReading').get().then((value){
      for(var i in value.docs){
        waterMeterReadingRequestList.add(WaterMeterReadingEntity.fromJson(i.data()));
      }
      emit(GetWaterMeterReadingSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetWaterMeterReadingError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <WaterRemoveMeterEntity> waterRemoveMeterList = [];
  getWaterRemoveMeter() async{
    emit(GetRemoveWaterMeterLoading());
    await FirebaseFirestore.instance.collection('removeWaterMeter').get().then((value){
      for(var i in value.docs){
        waterRemoveMeterList.add(WaterRemoveMeterEntity.fromJson(i.data()));
      }
      emit(GetRemoveWaterMeterSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetRemoveWaterMeterError());
    });
  }
}