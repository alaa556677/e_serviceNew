import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'features/electricity/presentation/cubit/electricity_cubit.dart';
import 'features/gas/presentation/cubit/gas_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/login/presentation/cubit/register_cubit.dart';
import 'features/login/presentation/pages/Login_screen.dart';
import 'features/water/presentation/cubit/water_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child){
        return MultiBlocProvider(
          providers: [
            BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
            BlocProvider<WaterCubit>(create: (context) => WaterCubit()..getWaterInstallation()..getWaterMaintenance()..getWaterMeterReading()..getWaterRemoveMeter()),
            BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
            BlocProvider<GasCubit>(create: (context) => GasCubit()),
            BlocProvider<ElectricityCubit>(create: (context) => ElectricityCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          )
        );
      },
    ) ;
  }
}