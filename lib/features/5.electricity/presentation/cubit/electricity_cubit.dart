import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../domain/entity/1.1electricity_installation_entity.dart';
import '../../domain/entity/2.1electricity_maintenance_entity.dart';
import '../../domain/entity/3.1electricity_meter_reading_entity.dart';
import '../../domain/entity/4.1electricity_remove_meter_entity.dart';
import 'electricity_states.dart';

class ElectricityCubit extends Cubit<ElectricityStates>{
  ElectricityCubit(): super(InitialElectricityState());
  static ElectricityCubit get(context) => BlocProvider.of(context);
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
  String? imageContractUl;
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
        imageContractUl = await refStorage.getDownloadURL();
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
  CollectionReference electricityInstallation = FirebaseFirestore.instance.collection('electricityInstallation');
  sendGasInstallation({customerName, customerAddress, customerMobile, homeType, idImage, imageContract, imageReceipt}){
    emit(SendElectricityInstallationLoading());
    try{
      electricityInstallation.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'homeType': homeType,
        'idImage': idImage,
        'imageContract': imageContract,
        'imageReceipt': imageReceipt,
      });
      emit(SendElectricityInstallationSuccess());
    } catch (e){
      emit(SendElectricityInstallationError());
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
  CollectionReference electricityMaintenance = FirebaseFirestore.instance.collection('electricityMaintenance');
  sendMaintenanceRequest ({customerName, customerAddress, customerMobile, homeType, details, imageReceiptMaintenance}) async {
    emit(SendMaintenanceRequestLoading());
    try{
      electricityMaintenance.add({
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
  String? imageMeterReceiptUrl;
  uploadImageMeterReceipt() async {
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
        imageMeterReceiptUrl = await refStorage.getDownloadURL();
      }
      emit(UploadImageMeterSuccess());
    } catch (e) {
      emit(UploadImageMeterError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference electricityMeterReading = FirebaseFirestore.instance.collection('electricityMeterReading');
  sendGasMeterReading ({customerName, customerAddress, previousReading, nowReading, meterNumber, imageMeterReceipt}){
    emit(SendElectricityReadingLoading());
    try{
      electricityMeterReading.add({
        'customerName' : customerName,
        'customerAddress' : customerAddress,
        'previousReading': previousReading,
        'nowReading': nowReading,
        'meterNumber': meterNumber,
        'imageMeterReceipt': imageMeterReceipt,
      });
      emit(SendElectricityReadingSuccess());
    } catch (e){
      emit(SendElectricityReadingError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference removeElectricityMeter = FirebaseFirestore.instance.collection('removeElectricityMeter');
  sendRemoveGasMeter ({customerName, customerAddress, customerMobile, meterNumber, nowReadingMeter, reason}){
    emit(SendRemoveElectricityMeterLoading());
    try{
      removeElectricityMeter.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'meterNumber': meterNumber,
        'nowReadingMeter': nowReadingMeter,
        'reason': reason,
      });
      emit(SendRemoveElectricityMeterSuccess());
    } catch (e){
      emit(SendRemoveElectricityMeterError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  List <ElectricityInstallationEntity> electricityInstallationRequestList = [];
  getElectricityInstallation() async {
    emit(GetElectricityInstallationListLoading());
    await FirebaseFirestore.instance.collection('electricityInstallation').get().then((value){
      for(var i in value.docs){
        electricityInstallationRequestList.add(ElectricityInstallationEntity.fromJson(i.data()));
      }
      emit(GetElectricityInstallationListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetElectricityInstallationListError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <ElectricityMaintenanceEntity> electricityMaintenanceRequestList = [];
  getElectricityMaintenance() async{
    emit(GetElectricityMaintenanceListLoading());
    await FirebaseFirestore.instance.collection('electricityMaintenance').get().then((value){
      for(var i in value.docs){
        electricityMaintenanceRequestList.add(ElectricityMaintenanceEntity.fromJson(i.data()));
      }
      emit(GetElectricityMaintenanceListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetElectricityMaintenanceListError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <ElectricityMeterReadingEntity> electricityMeterReadingRequestList = [];
  getElectricityMeterReading() async{
    emit(GetElectricityMeterReadingLoading());
    await FirebaseFirestore.instance.collection('electricityMeterReading').get().then((value){
      for(var i in value.docs){
        electricityMeterReadingRequestList.add(ElectricityMeterReadingEntity.fromJson(i.data()));
      }
      emit(GetElectricityMeterReadingSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetElectricityMeterReadingError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <ElectricityRemoveMeterEntity> electricityRemoveMeterList = [];
  getElectricityRemoveMeter() async{
    emit(GetRemoveElectricityMeterLoading());
    await FirebaseFirestore.instance.collection('removeElectricityMeter').get().then((value){
      for(var i in value.docs){
        electricityRemoveMeterList.add(ElectricityRemoveMeterEntity.fromJson(i.data()));
      }
      emit(GetRemoveElectricityMeterSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetRemoveElectricityMeterError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  String selectedTypeInstallation = 'شقة';
  changeItemInstallation(val){
    selectedTypeInstallation = val;
    emit (ChangeItemInstallation());
  }
////////////////////////////////////////////////////////////////////////////////

}