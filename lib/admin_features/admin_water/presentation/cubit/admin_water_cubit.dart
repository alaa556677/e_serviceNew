import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_water_state.dart';

class AdminWaterCubit extends Cubit<AdminWaterState> {
  AdminWaterCubit() : super(AdminWaterInitial());
}
