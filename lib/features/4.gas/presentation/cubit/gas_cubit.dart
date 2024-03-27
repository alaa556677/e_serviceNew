import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/entity/1.1gas_installation_entity.dart';
import '../../domain/entity/2.1gas_maintenance_entity.dart';
import '../../domain/entity/3.1gas_meter_reading_entity.dart';
import '../../domain/entity/4.1gas_remove_meter_entity.dart';
import 'gas_states.dart';
import 'dart:io';

class GasCubit extends Cubit<GasStates>{
  GasCubit(): super(InitialGasState());
  static GasCubit get(context) => BlocProvider.of(context);
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
  CollectionReference gasInstallation = FirebaseFirestore.instance.collection('gasInstallation');
  sendGasInstallation({customerName, customerAddress, customerMobile, homeType, idImage, imageContract, imageReceipt}){
    emit(SendGasInstallationLoading());
    try{
      gasInstallation.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'homeType': homeType,
        'idImage': idImage,
        'imageContract': imageContract,
        'imageReceipt': imageReceipt,
      });
      emit(SendGasInstallationSuccess());
    } catch (e){
      emit(SendGasInstallationError());
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
  CollectionReference gasMaintenance = FirebaseFirestore.instance.collection('gasMaintenance');
  sendMaintenanceRequest ({customerName, customerAddress, customerMobile, homeType, details, imageReceiptMaintenance}) async {
    emit(SendMaintenanceRequestLoading());
    try{
      gasMaintenance.add({
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
  CollectionReference gasMeterReading = FirebaseFirestore.instance.collection('gasMeterReading');
  sendGasMeterReading ({customerName, customerAddress, previousReading, nowReading, meterNumber, imageMeterReceipt}){
    emit(SendGasReadingLoading());
    try{
      gasMeterReading.add({
        'customerName' : customerName,
        'customerAddress' : customerAddress,
        'previousReading': previousReading,
        'nowReading': nowReading,
        'meterNumber': meterNumber,
        'imageMeterReceipt': imageMeterReceipt,
      });
      emit(SendGasReadingSuccess());
    } catch (e){
      emit(SendGasReadingError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  CollectionReference removeGasMeter = FirebaseFirestore.instance.collection('removeGasMeter');
  sendRemoveGasMeter ({customerName, customerAddress, customerMobile, meterNumber, nowReadingMeter, reason}){
    emit(SendRemoveGasMeterLoading());
    try{
      removeGasMeter.doc(FirebaseAuth.instance.currentUser?.uid).set({
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerMobile': customerMobile,
        'meterNumber': meterNumber,
        'nowReadingMeter': nowReadingMeter,
        'reason': reason,
      });
      emit(SendRemoveGasMeterSuccess());
    } catch (e){
      emit(SendRemoveGasMeterError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  List <GasInstallationEntity> gasInstallationRequestList = [];
  getGasInstallation() async {
    emit(GetGasInstallationListLoading());
    await FirebaseFirestore.instance.collection('gasInstallation').get().then((value){
      for(var i in value.docs){
        gasInstallationRequestList.add(GasInstallationEntity.fromJson(i.data()));
      }
      emit(GetGasInstallationListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetGasInstallationListError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <GasMaintenanceEntity> gasMaintenanceRequestList = [];
  getGasMaintenance() async{
    emit(GetGasMaintenanceListLoading());
    await FirebaseFirestore.instance.collection('gasMaintenance').get().then((value){
      for(var i in value.docs){
        gasMaintenanceRequestList.add(GasMaintenanceEntity.fromJson(i.data()));
      }
      emit(GetGasMaintenanceListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetGasMaintenanceListError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <GasMeterReadingEntity> gasMeterReadingRequestList = [];
  getGasMeterReading() async{
    emit(GetGasMeterReadingLoading());
    await FirebaseFirestore.instance.collection('gasMeterReading').get().then((value){
      for(var i in value.docs){
        gasMeterReadingRequestList.add(GasMeterReadingEntity.fromJson(i.data()));
      }
      emit(GetGasMeterReadingSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetGasMeterReadingError());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  List <GasRemoveMeterEntity> gasRemoveMeterList = [];
  getWaterRemoveMeter() async{
    emit(GetRemoveGasMeterLoading());
    await FirebaseFirestore.instance.collection('removeGasMeter').get().then((value){
      for(var i in value.docs){
        gasRemoveMeterList.add(GasRemoveMeterEntity.fromJson(i.data()));
      }
      emit(GetRemoveGasMeterSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetRemoveGasMeterError());
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