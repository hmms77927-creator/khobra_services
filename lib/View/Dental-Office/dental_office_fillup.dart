import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constant/app-colors.dart';
import '../../Constant/app-images.dart';
import '../../Controller/auth_controller.dart';
import '../../Controller/image_controller.dart';
import '../Widgets/App-Buttons/custom-Buttons.dart';
import '../Widgets/Custom-Container/custom_container.dart';


class ImageScreen extends StatefulWidget {
  final String name, lastname, phone, address;

  const ImageScreen({
    super.key,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.address,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final imgController = Get.put(ImageController());
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.purple,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.white,
        leading: LeadButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 245,
              child: Divider(color: AppColors.darkskin, thickness: 6),
            ),
          ),
          Container(
            width: 393,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColors.pureblack.withOpacity(0.2),
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Divider(color: AppColors.white, thickness: 6),
          ),
          formheader(
            text: 'Enter your information for you\n profile',
            color: AppColors.lightBlack,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: FillForm(
              text: 'Upload Image (optional)',
              color: AppColors.pureblack,
            ),
          ),
          Obx(() {
            return GestureDetector(
              onTap: () => imgController.pickImage(),
              child: imgController.imagePath.value.isEmpty
                  ? Card(
                elevation: 4,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 266,
                    height: 178,
                    child: Image.asset(
                      AppImages.upload_image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
                  : Card(
                elevation: 4,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(imgController.imagePath.value),
                      fit: BoxFit.cover,
                      width: 266,
                      height: 178,
                    ),
                  ),
                ),
              ),
            );
          }),
                    Padding(
          padding: const EdgeInsets.only(top: 160.0, left: 195),
child: ArrowButton(
onPressed: () async{
// controller.pickImage();
  await userController.addUser(
                widget.name,
                widget.lastname,
                widget.phone,
                widget.address,
                imgController.imagePath.value,
              );
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
Text(
'We Say Hello!',
style: TextStyle(
color: AppColors.green,
fontSize: 36,
fontWeight: FontWeight.w700,
),
),
Image.asset(AppImages.dialog),
],
),
);
},
);
},
),
),
        ],
      ),
    );
  }
}