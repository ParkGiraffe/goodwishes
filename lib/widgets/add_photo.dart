import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPhoto extends StatefulWidget {
  const AddPhoto({
    super.key,
  });

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  // 이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    // pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        image = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: image == null
          ? const BoxDecoration(
              color: Color(0xFFD9D9D9),
            )
          : BoxDecoration(
              image: DecorationImage(
                  image: FileImage(
                    File(image!.path),
                  ),
                  fit: BoxFit.contain),
            ),
      child: TextButton(
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          child: image == null
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
