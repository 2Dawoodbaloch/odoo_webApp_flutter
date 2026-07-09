import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadField extends StatefulWidget {
  const FileUploadField({
    super.key,
    this.hint = "Upload your file",
    this.icon,
    this.onFileSelected,
  });

  final String hint;
  final IconData? icon;
  final ValueChanged<PlatformFile>? onFileSelected;

  @override
  State<FileUploadField> createState() => _FileUploadFieldState();
}

class _FileUploadFieldState extends State<FileUploadField> {
  String? fileName;

  Future<void> _pickFile() async {
    final result = await FilePicker.pickFiles(withData: true);

    if (result == null) return; // user cancelled

    final platformFile = result.files.first;
    setState(() {
      fileName = platformFile.name;
    });

    widget.onFileSelected?.call(platformFile);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickFile,
      child: Row(
        children: [
          Expanded(
            child: Text(
              fileName ?? widget.hint, // ✅ shows filename after selection, hint before
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: fileName != null ? Colors.black87 : Colors.grey.shade500,
                fontSize: 14,
              ),
            ),
          ),
          if (widget.icon != null) ...[
            const SizedBox(width: 8),
            Icon(widget.icon, size: 18, color: Colors.teal.shade700),
          ],
        ],
      ),
    );
  }
}