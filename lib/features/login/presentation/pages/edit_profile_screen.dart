import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../home/presentation/pages/base_screen.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: blackColor.withOpacity(.2),
                          offset: const Offset(0, 0),
                          blurRadius: 14)
                    ]
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CustomTextFormField(
                        label: 'name',
                        autoFocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required Field';
                          }
                          return null;
                        },
                        controller: nameController,
                      ),
                      CustomTextFormField(
                        label: 'Email Address',
                        autoFocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required Field';
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                      CustomTextFormField(
                        label: 'Date of birth',
                        autoFocus: false,
                        controller: dateController,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        autoFocus: false,
                        controller: passwordController,
                      ),
                      CustomTextFormField(
                        label: 'Confirm Password',
                        autoFocus: false,
                        controller: repeatPasswordController,
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonCustomWidget(
                buttonColor: blueColor,
                text: "Edit Profile",
                color: whiteColor,
                buttonWidth:
                MediaQuery.of(context).size.width,
                buttonHeight: 48,
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  BaseScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
