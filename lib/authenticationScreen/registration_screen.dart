import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:get/get.dart';
import 'package:jobsoonapp/controllers/authentication_controller.dart';

import '../widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget
{
  const RegistrationScreen({super.key});

  

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();
  TextEditingController experienceYearsTextEditingController = TextEditingController();
  TextEditingController careerInterestsTextEditingController = TextEditingController();
  TextEditingController userResumeLinkTextEditingController = TextEditingController();


  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;

  


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
            const SizedBox(
                height: 100,
              ),

              const Text(
                "Account erstellen",
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

              //choose image circle avatar
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

              //personal info
              const Text(
                "Persönliche Informationen:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              //name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              //email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
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
              //age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Alter",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Handynummer",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              //city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "Stadt",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              //country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Land",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              //profile Heading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Erscheinungs Text",
                  iconData: Icons.text_fields,
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
                  editingController: careerInterestsTextEditingController,
                  labelText: "Berufliche Interessen",
                  iconData: Icons.text_fields,
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
                  editingController: experienceYearsTextEditingController,
                  labelText: "Berufliche Erfahrung (in Jahre)",
                  iconData: Icons.account_box_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              //lookingForInaPartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "Was für ein Unternehmen suchst du?",
                  iconData: Icons.face,
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
                  editingController: userResumeLinkTextEditingController,
                  labelText: "Berufliches Profil oder Lebenslauf",
                  iconData: Icons.file_present,
                  isObscure: false,
                ),
              ),

             

              const SizedBox(
                height: 24,
              ),

              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )
                ),
                child: InkWell(
                  onTap: () async
                  {
                
                    
                  },
                  child: const Center(
                    child: Text(
                      "Lebenslauf hochladen (.pdf)",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
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
                        // Personal info
                        nameTextEditingController.text.isNotEmpty &&
                        emailTextEditingController.text.isNotEmpty &&
                        passwordTextEditingController.text.isNotEmpty &&
                        ageTextEditingController.text.isNotEmpty &&
                        phoneNoTextEditingController.text.isNotEmpty &&
                        cityTextEditingController.text.isNotEmpty &&
                        countryTextEditingController.text.isNotEmpty &&
                        profileHeadingTextEditingController.text.isNotEmpty &&
                        lookingForInaPartnerTextEditingController.text.isNotEmpty &&
                        experienceYearsTextEditingController.text.isNotEmpty &&
                        careerInterestsTextEditingController.text.isNotEmpty &&
                        userResumeLinkTextEditingController.text.isNotEmpty 
                        )
                      
                      {
                       setState(() {
                         showProgressBar = true; 
                       });
                       await authenticationController.createNewUserAccount(
                          // personal info
                          authenticationController.profileImage!,
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
                          nameTextEditingController.text.trim(),
                          ageTextEditingController.text.trim(),
                          phoneNoTextEditingController.text.trim(),
                          cityTextEditingController.text.trim(),
                          countryTextEditingController.text.trim(),
                          profileHeadingTextEditingController.text.trim(),
                          lookingForInaPartnerTextEditingController.text.trim(),
                          experienceYearsTextEditingController.text.trim(),
                          careerInterestsTextEditingController.text.trim(),
                          userResumeLinkTextEditingController.text.trim(),
                    
                          
                          
                          
                          
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
                      "Account erstellen",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //already have an account login here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Du hast bereits einen Account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: ()
                    {
                      Get.back();
                    },
                    child: const Text(
                      "Hier Anmelden",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              showProgressBar == true
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              )
                  : Container(),

              const SizedBox(
                height: 30,
              ),



            ],
          ),
        ),
      ),
    );
  }
}
