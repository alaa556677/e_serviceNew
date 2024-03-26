import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
}
