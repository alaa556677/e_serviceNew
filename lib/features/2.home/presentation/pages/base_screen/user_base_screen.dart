import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../1.login/presentation/pages/edit_profile_screen.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';
import '../complaints/user_complaint_request.dart';
import '../home_screen/user_home_screen.dart';
import '../settings_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BaseScreenUser extends StatefulWidget {
  const BaseScreenUser({super.key});

  @override
  State<BaseScreenUser> createState() => _BaseScreenUserState();
}

class _BaseScreenUserState extends State<BaseScreenUser> {
  late HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          homeCubit = BlocProvider.of(context);
          return DefaultScreen(
            body: SafeArea(
              child: Container(
                child: screens[homeCubit.barIndex],
              ),
            ),
            bottomNavigationBar: kIsWeb ? null : _buildBottomBar(
                homeCubit: homeCubit),
          );
        },
      ),
    );
  }

  ClipRRect _buildBottomBar({HomeCubit? homeCubit}) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
        topEnd: Radius.circular(0),
        topStart: Radius.circular(0),
      ),
      child: BottomNavigationBar(
        backgroundColor: blueColor.withOpacity(.9),
        elevation: 0,
        currentIndex: homeCubit!.barIndex,
        onTap: (newIndex) {
          homeCubit.changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: blackColor,),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: whiteColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: blackColor,),
            label: 'Settings',
            activeIcon: Icon(Icons.settings, color: whiteColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem_outlined, color: blackColor,),
            label: 'Complaints',
            activeIcon: Icon(Icons.report_problem_outlined, color: whiteColor,),
          ),
        ],
      ),
    );
  }


  List screens = [
    HomeScreen(),
    SettingsScreen(),
    UserComplaintRequestScreen()
  ];
}