import 'package:e_services/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_services/features/login/presentation/pages/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/home_component.dart';
import '../cubit/home_states.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  HomeCubit? homeCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is LogoutSuccess){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
        }
      },
      builder: (context, state) {
        homeCubit = HomeCubit.get(context);
        return Center(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeComponent(
                  text: 'Log Out',
                  onTap: (){
                    homeCubit?.logOut();
                  },
                  fontSize: 14,
                  widthContainer: MediaQuery.of(context).size.width,
                  colorContainer: whiteColor,
                  isSvg: false,
                  pathImage: 'assets/images/logOut.png',
                  imageWidth: 60,
                  imageHeight: 60,
                  fontColor: textGreyColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
