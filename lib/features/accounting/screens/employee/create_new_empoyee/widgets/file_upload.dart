import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {

  Future<void> uploadFile() async {
    try {
      // Use parenthesises () for the method call, not curly braces {}
      FilePickerResult? filePicker = await FilePicker.pickFiles(
        type: FileType.any,
        withData: true, // Crucial for Flutter Web to load file bytes
      );

      if (filePicker != null) {
        // Your upload logic goes here
        debugPrint("File selected: ${filePicker.files.first.name}");
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: ElevatedButton(
          onPressed: uploadFile,
          child: const Text('Pick File'),
        ),
      ),
    );
  }
}