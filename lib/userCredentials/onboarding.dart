import 'package:flutter/material.dart';
import 'package:foodshood/userCredentials/credenstials.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> navigateToCredentials() async {
    isLoading.value = true;
    await Future.delayed(
        Duration(seconds: 1)); // Simulate loading for 2 seconds
    isLoading.value = false;
    Get.to(const Credentials());
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Obx(() => Scaffold(
          backgroundColor: const Color.fromARGB(250, 250, 74, 13),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  // height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/Toys.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/image/Group 3.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        const Text(
                          "Food for Everyone",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SF Pro Rounded"),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            controller.navigateToCredentials();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(249, 255, 255, 255),
                            ),
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(MediaQuery.of(context).size.width * 0.8,
                                  MediaQuery.of(context).size.height * 0.07),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: const Color.fromARGB(250, 250, 74, 13),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       CircleAvatar(
          //         radius: 30,
          //         backgroundColor: Colors.white,
          //         child: Image.asset("assets/image/Group 3.png"),
          //       ),
          //       const Text(
          //         "Food for Everyone",
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 50,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: "SF Pro Rounded"),
          //       ),
          //       Stack(
          //         children: [
          //           Image.asset("assets/image/ToyFaces.png"),
          //         ],
          //       ),
          //     ],
          //   ),
        ));
  }
}
