import 'package:jobsoonapp/models/company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Job extends Company {
  String? jobId;
  String? jobProfileImage;
  String? jobTitle;
  String? tasks;
  String? jobBenefits;
  String? industry;
  List<String> jobAdvertisements = [];
  List<String> qualifications = [];
  double? salary;
  DateTime? startDate;
  DateTime? endDate;

  Company company = Company();

  Job({
  this.jobId,
  this.jobProfileImage,
  this.jobTitle,
  this.tasks,
  this.jobBenefits,
  this.industry,
  this.jobAdvertisements = const [],
  this.qualifications = const [],
  this.salary,
  this.startDate,
  this.endDate,
  required String companyName,
}) : super(companyName:companyName);

  static Job fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Job(
      jobId: dataSnapshot['jobId'],
      jobProfileImage: dataSnapshot['jobProfileImage'],
      jobTitle: dataSnapshot['jobTitle'],
      tasks: dataSnapshot['tasks'],
      jobBenefits: dataSnapshot['jobBenefits'],
      industry: dataSnapshot['industry'],
      jobAdvertisements: List<String>.from(dataSnapshot['jobAdvertisements'] ?? []),
      qualifications: List<String>.from(dataSnapshot['qualifications'] ?? []),
      startDate: (dataSnapshot['startDate'] as Timestamp?)?.toDate(),
      endDate: (dataSnapshot['endDate'] as Timestamp?)?.toDate(),
      companyName: dataSnapshot['companyName'],
    );
  }


  
  Future<void> addJob() async
  {

  }

    Map<String, dynamic> toJson() => 
    {
        "jobId": jobId,
        "jobProfileImage": jobProfileImage,
        "jobTitle": jobTitle,
        "tasks": tasks,
        "jobBenefits": jobBenefits,
        "industry": industry,
        "jobAdvertisements": jobAdvertisements,
        "qualifications": qualifications,
        "startDate": startDate != null ? Timestamp.fromDate(startDate!) : null,
        "endDate": endDate != null ? Timestamp.fromDate(endDate!) : null,
    };





}