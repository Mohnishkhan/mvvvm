
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({Key? key,
    required this.title,
    this.loading=false,
    required this.onPress}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: appColors.buttoncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: loading?CircleAvatar(): Text(title,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}