import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class MyCustomStepper extends StatelessWidget {
  final int activeStep;
  final int currentScreenStep;

  const MyCustomStepper({
    Key? key,
    required this.activeStep,
    required this.currentScreenStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: const LineStyle(
        lineLength: 40,
        lineWidth: 4,
        lineThickness: 2,
        lineSpace: 1,
        defaultLineColor: Color(0xFF53B0A2),
      ),
      stepShape: StepShape.circle,
      stepBorderRadius: 15,
      borderThickness: 2,
      disableScroll: true,
      defaultStepBorderType: BorderType.normal,
      activeStepBorderColor: const Color(0xFF53B0A2),
      unreachedStepBackgroundColor: Color(0xFF53B0A2).withOpacity(0.3),
      activeStepBackgroundColor: const Color(0xFF53B0A2),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      stepRadius: 28,
      finishedStepBorderColor: Colors.tealAccent[700],
      finishedStepTextColor: Colors.tealAccent[700],
      finishedStepBackgroundColor: Colors.tealAccent[700],
      activeStepIconColor: Colors.tealAccent[700],
      showLoadingAnimation: false,
      steps: [
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: Image.asset('assets/images/store.png'),
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 1 ? 1 : 0.3,
              child: Image.asset('assets/images/app.png'),
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 2 ? 1 : 0.3,
              child: Image.asset('assets/images/wallet.png'),
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 3 ? 1 : 0.3,
              child: Image.asset('assets/images/open-parcel.png'),
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 4 ? 1 : 0.3,
              child: Image.asset('assets/images/product.png'),
            ),
          ),
        ),
      ],
      onStepReached: (index) {},
    );
  }
}
