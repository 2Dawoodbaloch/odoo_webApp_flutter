import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerAvatar extends StatefulWidget {
  const ImagePickerAvatar({
    super.key,
    this.size = 120,
    this.borderRadius = 4,
    this.onImageSelected,
    this.initialImageUrl,
  });

  final double size;
  final double borderRadius;
  final ValueChanged<Uint8List>? onImageSelected;
  final String? initialImageUrl; // e.g. existing avatar from server

  @override
  State<ImagePickerAvatar> createState() => _ImagePickerAvatarState();
}

class _ImagePickerAvatarState extends State<ImagePickerAvatar> {
  final ImagePicker _picker = ImagePicker();

  Uint8List? _imageBytes;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery, // web: opens native file picker dialog
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );


print(picked?.path);

      if (picked == null) {
        // user cancelled the dialog — not an error
        setState(() => _isLoading = false);
        return;
      }

      final bytes = await picked.readAsBytes();

      if (!mounted) return;
      setState(() {
        _imageBytes = bytes;
        _isLoading = false;
      });

      widget.onImageSelected?.call(bytes);
    } catch (e, stackTrace) {
  print(e);
  print(stackTrace);

  if (!mounted) return;

  setState(() {
    _errorMessage = e.toString();
    _isLoading = false;
  });

    }
  }

  void _removeImage() {
    setState(() => _imageBytes = null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _isLoading ? null : _pickImage,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                image: _imageBytes != null
                    ? DecorationImage(
                        image: MemoryImage(_imageBytes!),
                        fit: BoxFit.cover,
                      )
                    : (widget.initialImageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(widget.initialImageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null),
              ),
              child: _buildOverlayContent(),
            ),
          ),
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 6),
          Text(
            _errorMessage!,
            style: TextStyle(color: Colors.red.shade700, fontSize: 12),
          ),
        ],
        if (_imageBytes != null) ...[
          const SizedBox(height: 6),
          TextButton.icon(
            onPressed: _removeImage,
            icon: const Icon(Icons.delete_outline, size: 16),
            label: const Text('Remove'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red.shade700,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildOverlayContent() {
    if (_isLoading) {
      return const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    final hasImage = _imageBytes != null || widget.initialImageUrl != null;

    if (hasImage) {
      // subtle edit icon overlay in corner, doesn't obscure the photo
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.edit, size: 14, color: Colors.white),
        ),
      );
    }

    // empty state — camera + add icon, matches your earlier mockup
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.camera_alt_outlined, size: widget.size * 0.35, color: Colors.grey.shade400),
          Positioned(
            bottom: widget.size * 0.15,
            right: widget.size * 0.2,
            child: Icon(Icons.add_circle, size: widget.size * 0.22, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}