import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPhoto extends StatefulWidget {
  const AddPhoto({
    super.key,
    required this.onUpload,
    this.alreadyImg,
  });

  final Function onUpload;
  final Uint8List? alreadyImg;

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      List<int> imageBytes = await pickedFile.readAsBytes();
      setState(() {
        image = XFile(pickedFile.path);
        widget.onUpload(Uint8List.fromList(imageBytes));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.alreadyImg);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: image == null
          ? widget.alreadyImg == null
              ? const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                )
              : BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(widget.alreadyImg!),
                    fit: BoxFit.contain,
                  ),
                )
          : BoxDecoration(
              image: DecorationImage(
                image: FileImage(
                  File(image!.path),
                ),
                fit: BoxFit.contain,
              ),
            ),
      child: TextButton(
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          child: image == null && widget.alreadyImg == null
              ? const Center(
                  child: Text(
                    '사진 추가하기',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const Text('')),
    );
  }
}
