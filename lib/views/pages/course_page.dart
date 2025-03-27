import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gods_of_flutter/data/classes/activity_class.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});
  @override
  CoursePageState createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  Activity? _activity;
  bool _isLoading = false;

  Future<void> fetchActivity() async {
    setState(() {
      _isLoading = true;
    });
    
    final response = await http.get(Uri.parse('https://bored-api.appbrewery.com/random'));
    
    if (response.statusCode == 200) {
      setState(() {
        _activity = Activity.fromJson(json.decode(response.body));
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load activity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Finder')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _activity == null
                ? ElevatedButton(
                    onPressed: fetchActivity,
                    child: const Text('Get Activity'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_activity!.activity, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Type: ${_activity!.type}'),
                        Text('Participants: ${_activity!.participants}'),
                        Text('Price: \$${_activity!.price}'),
                        Text('Kid Friendly: ${_activity!.kidFriendly ? "Yes" : "No"}'),
                        TextButton(
                          onPressed: () => fetchActivity(),
                          child: const Text('Fetch New Activity'),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
