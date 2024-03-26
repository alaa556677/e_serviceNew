import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'electricity_states.dart';
import 'dart:io';

class ElectricityCubit extends Cubit <ElectricityStates> {
  ElectricityCubit() : super(InitialElectricityState());
  static ElectricityCubit get(context) => BlocProvider.of(context);
////////////////////////////////////////////////////////////////////////////////
  File? imageId;
  uploadImageId() async {
    final imagePicker = ImagePicker();
    emit(UploadIDImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageId = File(pickedImage.path);
        emit(UploadIDImageSuccess());
      }else{
        emit(UploadIDImageError());
      }
    }catch(error){
      emit(UploadIDImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageContract;
  uploadImageContract() async {
    final imagePicker = ImagePicker();
    emit(UploadContractImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageContract = File(pickedImage.path);
        emit(UploadContractImageSuccess());
      }else{
        emit(UploadContractImageError());
      }
    }catch(error){
      emit(UploadContractImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageReceipt;
  uploadImageReceipt() async {
    final imagePicker = ImagePicker();
    emit(UploadReceiptImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageReceipt = File(pickedImage.path);
        emit(UploadReceiptImageSuccess());
      }else{
        emit(UploadReceiptImageError());
      }
    }catch(error){
      emit(UploadReceiptImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageReceiptMaintenance ;
  uploadImageReceiptMaintenance () async {
    final imagePicker = ImagePicker();
    emit(UploadMaintenanceReceiptImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageReceiptMaintenance = File(pickedImage.path);
        emit(UploadMaintenanceReceiptImageSuccess());
      }else{
        emit(UploadMaintenanceReceiptImageError());
      }
    }catch(error){
      emit(UploadMaintenanceReceiptImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageMeter;
  uploadImageMeter () async {
    final imagePicker = ImagePicker();
    emit(UploadImageMeterLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageMeter = File(pickedImage.path);
        emit(UploadImageMeterSuccess());
      }else{
        emit(UploadImageMeterError());
      }
    }catch(error){
      emit(UploadImageMeterError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageMeterReceipt;
  uploadImageMeterReceipt () async {
    final imagePicker = ImagePicker();
    emit(UploadImageMeterReceiptLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageMeterReceipt = File(pickedImage.path);
        emit(UploadImageMeterReceiptSuccess());
      }else{
        emit(UploadImageMeterReceiptError());
      }
    }catch(error){
      emit(UploadImageMeterReceiptError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  String selectedTypeInstallation = 'شقة';
  changeItemInstallation(val){
    selectedTypeInstallation = val;
    emit (ChangeItemInstallation());
  }
////////////////////////////////////////////////////////////////////////////////
}