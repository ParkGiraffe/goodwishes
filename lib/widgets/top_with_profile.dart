import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Providers/profile_model.dart';
import 'package:goodwishes/widgets/profile_icon.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TopWithProfile extends StatefulWidget {
  final String title;
  const TopWithProfile({
    super.key,
    required this.title,
  });

  @override
  State<TopWithProfile> createState() => _TopWithProfileState();
}

class _TopWithProfileState extends State<TopWithProfile> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfiletProvider>(context);

    XFile? image;
    final ImagePicker picker = ImagePicker();

    // 이미지를 가져오는 함수
    Future getImage(ImageSource imageSource) async {
      // pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
      final XFile? pickedFile = await picker.pickImage(source: imageSource);

      if (pickedFile != null) {
        List<int> imageBytes = await pickedFile.readAsBytes();
        setState(() {
          image = XFile(pickedFile.path);
          profileProvider.changeProfile(Uint8List.fromList(imageBytes));
        });
      }
    }

    return SizedBox(
      height: 50,
      // padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // page title
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: -2,
            ),
          ),

          // profile icon

          ProfileIcon(
            profile: profileProvider.profile,
            onUpload: getImage,
          ),
        ],
      ),
    );
  }
}
