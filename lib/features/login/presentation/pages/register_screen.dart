import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/snac_bar.dart';
import 'package:e_services/features/home/presentation/pages/base_screen.dart';
import 'package:e_services/features/login/presentation/pages/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_screen.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String route = "RegisterScreen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RegisterCubit? registerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccess){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const BaseScreenUser()), (route) => false);
          }
        },
        builder: (context, state) {
          registerCubit = RegisterCubit.get(context);
          return DefaultScreen(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConditionalBuilder(
                              condition: state is! UploadImageRegisterLoading,
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  registerCubit?.uploadImage();
                                },
                                child: registerCubit?.url == null ? SvgPicture.asset(
                                  "assets/images/profilePicture.svg",
                                  color: textGreyColor,
                                  width: 80,
                                  height: 80,
                                ) : Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage('${registerCubit!.url}')
                                      )
                                  ),
                                ),
                              ),
                              fallback: (context) => const Center(child: CircularProgressIndicator(),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0,0),
                                    color: Colors.black.withOpacity(.2),
                                    blurRadius: 14
                                )
                              ]
                          ),
                          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Sign Up",
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                fontColor: blackColor,
                              ),
                              const SizedBox(height: 30),
                              CustomTextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'require';
                                  }
                                  return null;
                                },
                                autoFocus: false,
                                label: "Email address",
                                prefix: const Icon(Icons.email_outlined),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      controller: firstNameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'require';
                                        }
                                        return null;
                                      },
                                      autoFocus: false,
                                      label: "First name",
                                      //prefix: const Icon(Icons.person),
                                    ),
                                  ),
                                  const SizedBox(width: 6,),
                                  Expanded(
                                    child: CustomTextFormField(
                                      controller: lastNameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'require';
                                        }
                                        return null;
                                      },
                                      autoFocus: false,
                                      label: "Last name",
                                      //prefix: const Icon(Icons.person),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                autoFocus: false,
                                keyboardType: TextInputType.number,
                                controller: idController,
                                maxLength: 14,
                                label: "National ID",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'require';
                                  }
                                  return null;
                                },
                                prefix: const Icon(Icons.person),
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                autoFocus: false,
                                controller: passwordController,
                                label: "Password",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'require';
                                  }
                                  return null;
                                },
                                prefix: const Icon(Icons.lock_outline),
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: repeatPasswordController,
                                autoFocus: false,
                                label: "Repeat Password",
                                prefix: const Icon(Icons.lock_outline),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'require';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              ConditionalBuilder(
                                  condition: state is !RegisterLoading,
                                  builder: (context) => ButtonCustomWidget(
                                    buttonColor: blueColor,
                                    text: "Sign Up",
                                    color: whiteColor,
                                    buttonWidth:
                                    MediaQuery.of(context).size.width,
                                    buttonHeight: 48,
                                    onPressed: (){
                                      if(formKey.currentState!.validate()){
                                        if(passwordController.text == repeatPasswordController.text){
                                          registerCubit?.createUser(
                                            email: emailController.text,
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            nationalId: idController.text,
                                            password: passwordController.text,
                                            urlImage: registerCubit?.url,
                                            context: context
                                          );
                                        }else{
                                          defaultSnackBar(context: context, text: 'The passwords aren\'t match',  color: Colors.red);
                                        }
                                      }
                                    },
                                  ),
                                  fallback: (context) => const Center(child: CircularProgressIndicator(),)
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: "Already have an account?",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    fontColor: textGreyColor,
                                    fontFamily: "poppins",
                                  ),
                                  const SizedBox(width: 5,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                    },
                                    child: TextWidget(
                                      text: "Sign In",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontColor: blueColor,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          );
        },
      ),
    );
  }
}
