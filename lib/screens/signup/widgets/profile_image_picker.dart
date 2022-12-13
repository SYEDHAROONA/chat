import 'package:chat/provider/signup/create_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? file;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        file == null
            ? CircleAvatar(
                radius: size.width * 0.2,
                backgroundImage: const AssetImage('images/profileLogo.png'),
              )
            : CircleAvatar(
                radius: size.width * 0.2,
                backgroundImage: FileImage(file!),
              ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
            onPressed: (() async {
              XFile? xFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (xFile == null) return;
              setState(() {
                file = File(xFile.path);
                Provider.of<CreateAccountProvider>(context, listen: false)
                    .file = file;
              });
            }),
            icon: const Icon(
              Icons.camera_alt,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}
