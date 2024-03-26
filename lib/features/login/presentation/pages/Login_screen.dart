import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../home/presentation/pages/base_screen.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RegisterCubit? registerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is LoginSuccess){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const BaseScreen()), (route) => false);
          }
        },
        builder: (context, state) {
          registerCubit = RegisterCubit.get(context);
          return DefaultScreen(
            body:Center(
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
                            Image.asset(
                              'assets/images/logo.png',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: whiteColor,
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
                                text: "Login",
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                fontColor: blackColor,
                              ),
                              const SizedBox(height: 30),
                              CustomTextFormField(
                                controller: emailController,
                                radius: 10,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'require';
                                  }
                                  return null;
                                },
                                label: "Email address",
                                prefix: const Icon(Icons.email_outlined),
                                autoFocus: false,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                autoFocus: false,
                                controller: passwordController,
                                radius: 10,
                                label: "Password",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'require';
                                  }
                                  return null;
                                },
                                prefix: const Icon(Icons.lock_outline),
                              ),
                              const SizedBox(height: 30),
                              ConditionalBuilder(
                                  condition: state is !LoginLoading,
                                  builder: (context) => ButtonCustomWidget(
                                    buttonColor: blueColor,
                                    text: "Sign In",
                                    color: whiteColor,
                                    buttonWidth:
                                    MediaQuery.of(context).size.width,
                                    buttonHeight: 48,
                                    onPressed: (){
                                      if(formKey.currentState!.validate()){
                                        registerCubit?.loginUser(emailController.text, passwordController.text, context);
                                      }
                                    },
                                  ),
                                  fallback: (context) => const Center(child: CircularProgressIndicator(),)
                              ),
                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: "Don't have an account?",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    fontColor: textGreyColor,
                                  ),
                                  const SizedBox(width: 5,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                    },
                                    child: TextWidget(
                                      text: "Sign Up",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontColor: blueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
