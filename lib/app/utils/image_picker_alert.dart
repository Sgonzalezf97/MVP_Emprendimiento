import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils.dart';

class ImagePickAlert {
  profilePictureAlert({
    required BuildContext context,
    required void Function() fromPhoto,
    required void Function() fromGallery,
    File? image,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          Itembutton(
            onPressed: fromPhoto,
            label: 'Tomar una foto     ',
            icon: Icons.camera_alt,
          ),
          Itembutton(
            onPressed: fromGallery,
            label: 'Desde galería      ',
            icon: Icons.photo_album,
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: Get.back,
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Palette.darkGreen,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

ImagePickAlert imagePickAlert = ImagePickAlert();

class Itembutton extends StatelessWidget {
  const Itembutton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  final void Function()? onPressed;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Palette.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              icon,
              color: Palette.green.withOpacity(0.3),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Palette.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
