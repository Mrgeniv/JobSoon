import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsoonapp/authenticationScreen/login_screen.dart';
import 'package:jobsoonapp/homeScreen/home_screen.dart';
import 'package:jobsoonapp/models/company.dart';

//models
import 'package:jobsoonapp/models/person.dart' as personModel;
import 'package:jobsoonapp/models/company.dart' as companyModel;

class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

  late Rx<User?> fireBaseCurrentUser; 

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;


  





  pickImageFileFromGallery() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully picked your profile image from gallery.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));

  }
  captureImageFileFromPhoneCamera() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully captured your profile image using camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));

  }
  Future<String> uploadImageToStorage(File imageFile) async
  {
    Reference referenceStorage = FirebaseStorage.instance.ref()
        .child("Profile Images").child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    String downloadUrlOfImage =  await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }

  createNewUserAccount(
                       //person infos
                       File imageProfile,
                       String email, 
                       String password,
                       String name,
                       String age,
                       String phoneNo,
                       String city,
                       String country,
                       String profileHeading,
                       String lookingForInaPartner,
                       String experienceYears,
                       String careerInterests,
                       String userResumeLink,                    
                  ) async 
{
    try
    {
      
      //1. authenticate user and create User with Email and Password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      
      
      //2. upload image to storage
      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

      //3. upload pdf to storage

      
      //3. save user & compnay infos to firestore database
      personModel.Person personInstace = personModel.Person(
        //Person info
        uid: FirebaseAuth.instance.currentUser!.uid,
        imageProfile: urlOfDownloadedImage,
        email: email,
        password: password,
        name: name,
        age: int.parse(age),
        phoneNo: phoneNo,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingForInaPartner: lookingForInaPartner,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
        experienceYears: experienceYears,
        careerInterests: careerInterests,
        userResumeLink: userResumeLink,

           
      );


      


      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(personInstace.toJson());

      Get.snackbar("Account Created", "Congratulation your Account has been created!");
      Get.to(const HomeScreen());

    } catch(errorMsg)
    {
      Get.snackbar("Accounterstellung fehlgeschlagen!", "Error occurred: $errorMsg");
    }

  }

  loginUser(String emailUser, String passwordUser) async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailUser,
        password: passwordUser,
      );

      Get.snackbar("Anmeldung erfolgreich", "Sie konnten sich einloggen.");

      Get.to(HomeScreen());
    }
    catch(errorMsg)
    {
      Get.snackbar("Anmelden fehlgeschlagen", "Error occured: $errorMsg");
    }
  }
  checkIfUserIsLoggedIn(User? currentUser)
  {
    if (currentUser == null)
    {
      Get.to(LoginScreen());
    }
    else
    {
      Get.to(HomeScreen());
    }
  }

  

  createNewCompanyAccount(
                       File imageProfile,
                       String companyName,
                       String companyEmail,
                       String password,
                       String recruitingPhoneNumber,

  ) async
  {
    try
    {
      UserCredential companyCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: companyEmail,
        password: password,
      );

      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

       companyModel.Company companyInstance = companyModel.Company(
        companyId: FirebaseAuth.instance.currentUser!.uid, 
        imageProfile: urlOfDownloadedImage,
        companyName: companyName,
        companyEmail: companyEmail,
        password: password,
        recruitingPhoneNumber: recruitingPhoneNumber,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
       );

       await FirebaseFirestore.instance.collection("companies").doc(FirebaseAuth.instance.currentUser!.uid).set(companyInstance.toJson());
       
       Get.snackbar("Account Created", "Congratulation your Account has been created!");
       Get.to(const HomeScreen());
    }catch(errorMsg)
    {
      Get.snackbar("Accounterstellung fehlgeschlagen!", "Error occurred: $errorMsg");
    }
      


  }
  
  checkIfCompanyIsLoggedIn(User? currentUser) async {
  if (currentUser != null) {
    // Überprüfe, ob der aktuelle Benutzer eine Unternehmens-UID entspricht
    if (currentUser.uid == companyModel.Company().companyId) {
      // Der Benutzer ist ein Unternehmen
    }
  }
}



  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    fireBaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    fireBaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

    fireBaseCurrentUser.listen((user) {
      checkIfUserIsLoggedIn(user);
      checkIfCompanyIsLoggedIn(user);
    });

  }


}