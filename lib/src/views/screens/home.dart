import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color_constants.dart';
import '../../constants/string_constants.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_formfield.dart';
import 'stopwatch_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          _backgroundGradient(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  StringConstants.hintText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 100),
                Form(
                  key: formkey,
                  child: CustomFormField(
                    hintText: StringConstants.hintText,
                    controller: nameController,
                    errMsg: StringConstants.errorMsg,
                  ),
                ),
                const SizedBox(height: 100),
                ButtonWidget(
                  buttonName: "Continue",
                  onpressed: () async {
                    if (formkey.currentState!.validate()) {
                      Get.to(const StopWatchScreen());
                    }
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

TextEditingController nameController = TextEditingController();

GlobalKey<FormState> formkey = GlobalKey<FormState>();

_backgroundGradient() {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.bgTopColor, AppColors.bgBottomColor])),
  );
}
