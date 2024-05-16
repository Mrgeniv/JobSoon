import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Company
{
  //company info
  String? companyId;
  String? imageProfile;
  String? companyName;
  String? companyEmail;
  String? password;
  String? recruitingPhoneNumber;
  int? publishedDateTime;
  
  Company(
  {
    this.companyId,
    this.imageProfile,
    this.companyName,
    this.companyEmail,
    this.password,
    this.recruitingPhoneNumber,
    this.publishedDateTime,
  }
);

  static Company fromDataSnapshot(DocumentSnapshot snapshot)
  {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return Company(
      companyId: dataSnapshot['companyId'],
      imageProfile: dataSnapshot['imageProfile'],
      companyName: dataSnapshot['companyName'],
      companyEmail: dataSnapshot['companyEmail'],
      password: dataSnapshot['password'],
      recruitingPhoneNumber: dataSnapshot['recruitingPhoneNumber'],
      publishedDateTime: dataSnapshot['dateTime'],
      
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'companyId': companyId,
    'imageProfile': imageProfile,
    'companyName' : companyName,
    'companyEmail' : companyEmail,
    'password' : password,
    'recruitingPhoneNumber' : recruitingPhoneNumber,
    'dateTime' : publishedDateTime,
  };

}

