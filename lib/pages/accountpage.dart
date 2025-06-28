import 'package:flutter/material.dart';
import 'package:learningapp/defaultpage.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Account",
      child: Center(child: Text("Account Page")),
    );
  }
}
