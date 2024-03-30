import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/complaints_entity.dart';
import 'home_states.dart';

class HomeCubit extends Cubit <HomeStates>{
  HomeCubit (): super (InitialHomeState ());
  static HomeCubit get(context) => BlocProvider.of(context);
/////////////////////////////////////////////////////////////////// please insert this line after every method
  int barIndex = 0 ;
  changeIndex(index){
    barIndex = index;
    emit(ChangeIndexState());
  }
//////////////////////////////////////////////////////////////////////////////////////////
  Future pickCameraImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }
//////////////////////////////////////////////////////////////////////////////////////////
  Future logOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    emit(LogoutLoading());
    auth.signOut().then((value){
      emit(LogoutSuccess());
    }).catchError((e){
      emit(LogoutError());
    });
  }
//////////////////////////////////////////////////////////////////////////////////////////
  CollectionReference complaintsList = FirebaseFirestore.instance.collection('complaintsList');
  sendComplaintsRequest ({customerName, customerMobile, reason}){
    emit(SendComplaintsLoading());
    try{
      complaintsList.add({
        'customerName': customerName,
        'customerMobile': customerMobile,
        'reason': reason,
      });
      emit(SendComplaintsSuccess());
    } catch (e){
      emit(SendComplaintsError());
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////
  List <ComplaintsEntity> complaintsRequestsList = [];
  getComplaintsList() async {
    emit(GetComplaintsListLoading());
    await FirebaseFirestore.instance.collection('complaintsList').get().then((value){
      for(var i in value.docs){
        complaintsRequestsList.add(ComplaintsEntity.fromJson(i.data()));
      }
      emit(GetComplaintsListSuccess());
    }).catchError((error){
      print('error ${error.toString()}');
      emit(GetComplaintsListError());
    });
  }
}
