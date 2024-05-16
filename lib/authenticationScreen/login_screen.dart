import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsoonapp/authenticationScreen/company_registration_screen.dart';
import 'package:jobsoonapp/authenticationScreen/registration_screen.dart';
import 'package:jobsoonapp/controllers/authentication_controller.dart';

import '../widgets/custom_text_field_widget.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;
  var controllerAuth = AuthenticationController.authController;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Image.asset(
                "images/jobsoonapplogo.png",
                width: 700,
                height: 400,
              ),
               
              const Text(
                "Wilkommen",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                "Finde den auf dich bestens angepassten Job",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 28,
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
                height: 30,
              ),

              //login button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8E9F3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )
                ),
                child: InkWell(
                  onTap: () async
                  {
                    if(emailTextEditingController.text.trim().isNotEmpty &&
                    passwordTextEditingController.text.trim().isNotEmpty)
                    {
                      setState(() {
                        showProgressBar = true;
                      });


                      await controllerAuth.loginUser(
                        emailTextEditingController.text.trim(), 
                        passwordTextEditingController.text.trim()
                      );


                      setState(() {
                        showProgressBar = false;
                      });


                    }
                    else
                    {
                      Get.snackbar("Email und Passwort fehlen", "Bitte geben Sie Email und Passwort ein.");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Anmelden",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              //dont have an account create here button
              
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Du hast keinen Account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: ()
                    {
                      Get.to(RegistrationScreen());
                    },
                    child: const Text(
                      "ERSTELLEN",
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
                height: 30,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text(
                    "Du hast keinen Unternehmensaccount? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: ()
                    {
                      Get.to(CompanyRegistrationScreen());
                    },
                    child: const Text(
                      "ERSTELLEN",
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

