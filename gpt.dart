// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// const apiUrl = 'https://api.openai.com/engines/text-davinci-003/completions';
// const apiKey = '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';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: FirstPage(),
//     );
//   }
// }

// class FirstPage extends StatefulWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("WIT: What Is That?"),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _controller,
//           ),
//           TextButton(
//             onPressed: () {
//               String prompt = _controller.text;
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ResultPage(prompt),
//               ));
//             },
//             child: const Text("Get Result"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ResultPage extends StatefulWidget {
//   final String prompt;
//   const ResultPage(this.prompt, {Key? key}) : super(key: key);

//   @override
//   State<ResultPage> createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   Future<String>? _resultFuture;

//   @override
//   void initState() {
//     super.initState();
//     _resultFuture = generateText(widget.prompt);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Result from GPT"),
//       ),
//       body: FutureBuilder<String>(
//         future: _resultFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return Text('${snapshot.data}');
//           }
//         },
//       ),
//     );
//   }
// }

// Future<String> generateText(String prompt) async {
//   final response = await http.post(
//     Uri.parse(apiUrl),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $apiKey',
//     },
//     body: jsonEncode({
//       "model": "text-davinci-003",
//       'prompt': "What is $prompt?",
//       'max_tokens': 6000,
//       'temperature': 0,
//       'top_p': 1,
//       'frequency_penalty': 0,
//       'presence_penalty': 0,
//     }),
//   );

//   if (response.statusCode == 200) {
//     Map<String, dynamic> newResponse =
//         jsonDecode(utf8.decode(response.bodyBytes));
//     return newResponse['choices'][0]['text'];
//   } else {
//     throw Exception(
//         'Failed to generate text. Status code: ${response.statusCode}');
//   }
// }
