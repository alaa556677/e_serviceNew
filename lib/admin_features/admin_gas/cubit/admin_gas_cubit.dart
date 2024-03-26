import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_gas_state.dart';

class AdminGasCubit extends Cubit<AdminGasState> {
  AdminGasCubit() : super(AdminGasInitial());
}
