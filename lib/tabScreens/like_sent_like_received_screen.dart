import 'package:flutter/material.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() => _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState extends State<LikeSentLikeReceivedScreen> {
  @override
  Widget build(BuildContext context) 
  {
     return const Scaffold(
      body: Center(
        child: Text(
          "Wie gesendet wie Empfangen Bildschirm",
          style: TextStyle(
          color :Colors.green,
          fontSize: 20,
          ) 
        )
      ),
    );
  }
}