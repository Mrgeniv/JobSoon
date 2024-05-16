import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobsoonapp/controllers/authentication_controller.dart';
import 'package:jobsoonapp/widgets/custom_text_field_widget.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  const CompanyRegistrationScreen({super.key});

  @override
  State<CompanyRegistrationScreen> createState() => _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  //company info
  TextEditingController  companyNameTextEditingController = TextEditingController();
  TextEditingController  companyEmailTextEditingController = TextEditingController();
  TextEditingController  passwordTextEditingController = TextEditingController();
  TextEditingController  recruitingPhoneNumberTextEditingController = TextEditingController();



  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),

              const Text(
                "Unternehmens-Account erstellen",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "um jetzt los zu legen.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              authenticationController.imageFile == null ?
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "images/profile_avatar.jpg"
                ),
                backgroundColor: Colors.black,
              ) :
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image:  FileImage(
                      File(authenticationController.imageFile!.path)
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                      onPressed: () async
                      {
                        await authenticationController.pickImageFileFromGallery();

                        setState(() {
                          authenticationController.imageFile;
                        });
                      },
                      icon: const Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: 30,
                      ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),


                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.captureImageFileFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });

                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                ],
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                "Unternehmens Information:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: companyNameTextEditingController,
                  labelText: "Name des Unternehmens",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: companyEmailTextEditingController,
                  labelText: "Email des Unternehmens",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Passwort",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: recruitingPhoneNumberTextEditingController,
                  labelText: "Personal Handynummer",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //create account button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )
                ),
                child: InkWell(
                  onTap: () async
                  {
                    if(authenticationController.imageFile != null)
                    {
                      if(
                        // company info
                        companyNameTextEditingController.text.isNotEmpty &&
                        companyEmailTextEditingController.text.isNotEmpty &&
                        passwordTextEditingController.text.isNotEmpty &&
                        recruitingPhoneNumberTextEditingController.text.isNotEmpty
                        )
                      
                      {
                       setState(() {
                         showProgressBar = true; 
                       });
                       await authenticationController.createNewCompanyAccount(
                          // company info
                          authenticationController.profileImage!,
                          companyNameTextEditingController.text.trim(),
                          companyEmailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
                          recruitingPhoneNumberTextEditingController.text.trim(), 
                        );

                        setState(() {
                          showProgressBar = false;
                          authenticationController.imageFile = null;
                        });

                        
                      }
                      else
                      {
                        Get.snackbar("A Field is Empty", "Please fill out all field in text fields.");
                      }
                    }
                    else
                    {
                      Get.snackbar("Image File Missing", "Please pick image from gallery or cepture with Camera");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Unternehmens Account erstellen",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}