import 'package:cloud_firestore/cloud_firestore.dart';

class Company
{
  String? companyName;
  String? companyEmail;
  String? password;
  String? recruitingPhoneNumber;
  int? publishedDateTime;
  List<String>? jobTitles = []; //List of Job Titles for the company
}