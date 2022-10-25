import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/core/resources/color_manager.dart';
import 'package:movie_app_odc/core/resources/strings_manager.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/fonts_manager.dart';
import '../../core/resources/values_manager.dart';
import '../../view_model/cubit/login_cubit/login_cubit.dart';
import '../../view_model/cubit/login_cubit/login_states.dart';
import '../components/core_components/custom_button.dart';
import '../components/core_components/custom_text_form_field.dart';
import '../components/core_components/cutom_text_button.dart';
import '../components/core_components/divider_or_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showTopSnackBar(
            context,
            const CustomSnackBar.success(
              message:
              "Login Successfully",
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          body: SafeArea(
            child: Center(
              child: Form(
                key: LoginCubit.get(context).formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(AppPadding.p16),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.starsTheater),
                        const SizedBox(
                          height: 33,
                        ),
                        Text(
                          AppStrings.login,
                          style: AppTextStyles.login(),
                        ),
                        const SizedBox(height: AppSize.s16),
                        const SizedBox(height: AppSize.s25),
                        defaultFormField(
                            controller: LoginCubit.get(context).emailController,
                            label: AppStrings.email,
                            type: TextInputType.emailAddress,
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter E-mail';
                              }
                              return null;
                            }),
                        const SizedBox(height: AppSize.s25),
                        defaultFormField(
                            controller:
                                LoginCubit.get(context).passwordController,
                            label: AppStrings.password,
                            type: TextInputType.visiblePassword,
                            isPassword: LoginCubit.get(context).isPasswordShown,
                            suffix: LoginCubit.get(context).suffixIcon,
                            suffixPressed: () {
                              LoginCubit.get(context).changePasswordIcon();
                            },
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            }),
                        const SizedBox(height: AppSize.s15),
                        Row(
                          children: [
                            buildTextButton(text: 'Forget Password'),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont\'have an account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            buildTextButton(text: 'SignUp', isUnderline: false)
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s25,
                        ),
                        //login button
                        ConditionalBuilder(
                          builder: (context) => defaultButton(
                            function: () {
                              print(LoginCubit.get(context)
                                  .passwordController
                                  .text);
                              print(
                                  LoginCubit.get(context).emailController.text);
                              LoginCubit.get(context).validateData(context);
                            },
                            text: AppStrings.login,
                            backgroundColor: ColorManager.primary,
                            textColor: ColorManager.white,
                          ),
                          condition: state is! LoginLoading,
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        dividerOrDivider(),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageAssets.twitter),
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset(ImageAssets.facebook),
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset(ImageAssets.google),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        buildTextButton(text: 'Enter as a gust'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
