import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String> getQuote() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/quotes/1'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return "${data['quote']} - ${data['author']}";
  } else {
    throw Exception('Failed to load quote');
  }
}

class QuoteText extends StatelessWidget {
  const QuoteText({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getQuote(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                snapshot.data!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
