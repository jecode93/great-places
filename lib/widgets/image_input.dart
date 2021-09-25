import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late File _storeImage;

  _takePicture() async {
    final imageFile = await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storeImage = imageFile as File;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storeImage != null
              ? Image.file(
                  _storeImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No image taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Take Picture'),
          style: TextButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
          onPressed: _takePicture,
        ),
      ],
    );
  }
}
