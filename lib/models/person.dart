

import 'package:cloud_firestore/cloud_firestore.dart';

class Person
{
  //personal info
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  String? experienceYears;
  String? careerInterests;
  String? userResumeLink;
  int? publishedDateTime;


  Person(
    {
    //personal info
    this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,
    this.experienceYears,
    this.careerInterests,
    this.userResumeLink,

    }
  );

  static Person fromDataSnapshot(DocumentSnapshot snapshot)
  {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      uid : dataSnapshot['uid'],
      name : dataSnapshot['name'],
      imageProfile: dataSnapshot["imageProfile"],
      email: dataSnapshot['email'],
      password: dataSnapshot['password'],
      age : dataSnapshot['age'],
      phoneNo : dataSnapshot['phoneNo'],
      city : dataSnapshot['city'],
      country : dataSnapshot['country'],
      profileHeading : dataSnapshot['profileHeading'],
      lookingForInaPartner : dataSnapshot['lookingForInaPartner'],
      publishedDateTime: dataSnapshot['publishedDateTime'],
      experienceYears: dataSnapshot['experienceYears'],
      careerInterests: dataSnapshot['careerInterests'],
      userResumeLink: dataSnapshot['userResumeLink'],


     
    );  
  }

  Map<String, dynamic> toJson()=>
      {
        //personal info
        "uid": uid,
        "imageProfile" : imageProfile,
        "email" : email,
        "password" : password,
        "name" : name,
        "age" : age,
        "phoneNo" : phoneNo,
        "city" : city,
        "country" : country,
        "profileHeading" : profileHeading,
        "lookingForInaPartner" : lookingForInaPartner,
        "publishedDateTime" : publishedDateTime,
        "experienceYears" : experienceYears,
        "careerInterests" : careerInterests,
        "userResumeLink" : userResumeLink,
      };



}