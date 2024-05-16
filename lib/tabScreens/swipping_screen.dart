import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsoonapp/controllers/profile_controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({Key? key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: profileController.allUsersProfileList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final eachProfileInfo =
                profileController.allUsersProfileList[index];

            return Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: SingleChildScrollView( // Wrap the card content with SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200.0, // Adjust height as needed
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            eachProfileInfo.imageProfile.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8.0,
                            left: 8.0,
                            child: Text(
                              eachProfileInfo.name ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profilbeschreibung: ${eachProfileInfo.profileHeading ?? ""}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Alter: ${eachProfileInfo.age ?? 0}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Stadt: ${eachProfileInfo.city ?? ""}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Land: ${eachProfileInfo.country ?? ""}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Erfahrung in Jahren: ${eachProfileInfo.experienceYears}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Karrierische Interessen: ${eachProfileInfo.careerInterests}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Referenzenlink: ${eachProfileInfo.userResumeLink}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
