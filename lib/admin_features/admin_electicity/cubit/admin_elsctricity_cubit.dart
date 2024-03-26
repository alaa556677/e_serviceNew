import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_elsctricity_state.dart';

class AdminElsctricityCubit extends Cubit<AdminElsctricityState> {
  AdminElsctricityCubit() : super(AdminElsctricityInitial());
}
