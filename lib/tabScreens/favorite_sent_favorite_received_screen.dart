import 'package:flutter/material.dart';
class FavoriteSentFavoriteReceivedScreen extends StatefulWidget {
  const FavoriteSentFavoriteReceivedScreen({super.key});

  @override
  State<FavoriteSentFavoriteReceivedScreen> createState() => _FavoriteSentFavoriteReceivedScreenState();
}

class _FavoriteSentFavoriteReceivedScreenState extends State<FavoriteSentFavoriteReceivedScreen> {
  @override
  Widget build(BuildContext context) 
  {
     return const Scaffold(
      body: Center(
        child: Text(
          "Favorit gesendet Favorit empfangen Bildschirm",
          style: TextStyle(
          color :Colors.green,
          fontSize: 20,
          ) 
        )
      ),
    );
  }
}