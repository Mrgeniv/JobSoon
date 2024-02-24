import 'package:flutter/material.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() => _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState extends State<ViewSentViewReceivedScreen> {
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: Center(
        child: Text(
          "Gesendet anzeigen Bildschirm empfangen anzeigen",
          style: TextStyle(
          color :Colors.green,
          fontSize: 20,
          ) 
        )
      ),
    );
  }
}