import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  TextEditingController services1controller = TextEditingController();
  TextEditingController services2controller = TextEditingController();
  TextEditingController services3controller = TextEditingController();
  TextEditingController services4controller = TextEditingController();
  TextEditingController services5controller = TextEditingController();
  TextEditingController services6controller = TextEditingController();
  TextEditingController services7controller = TextEditingController();
  TextEditingController services8controller = TextEditingController();
  TextEditingController services9controller = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 200,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Add Service',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 130,
                  width: 335,
                  decoration: DottedDecoration(
                    shape: Shape.box,
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.purple,
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Container(child: Image.asset(AppImages.image2)),

                      Container(
                        child: Text(
                          'Choose Image',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: .w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 15),
              child: servicetext(
                text: 'Support : JPG , PNG, JPEG',
                color: AppColors.fullgrey,
              ),
            ),
            Container(
              width: 335,
              height: 515,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.fieldcolor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: 295,
                      height: 48,
                      child: addservicea(
                        text: 'Car Washing',
                        label: 'Car Washing',
                        controller: services1controller,
                        icon: Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: 295,
                      height: 48,
                      child: addservicea(
                        text: 'Select Category',
                        label: 'Select Category',
                        controller: services2controller,
                        icon: Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: 295,
                      height: 48,
                      child: addservicea(
                        text: 'Select Address',
                        label: 'Select Address',
                        controller: services3controller,
                        icon: Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: SizedBox(
                          width: 137,
                          height: 48,
                          child: addservicea(
                            text: 'Type',
                            label: 'Type',
                            controller: services4controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: SizedBox(
                          width: 137,
                          height: 48,
                          child: addservicea(
                            text: 'Status',
                            label: 'Status',
                            controller: services5controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: SizedBox(
                          width: 137,
                          height: 48,
                          child: addservicea(
                            text: 'Price',
                            label: 'Price',
                            controller: services6controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: SizedBox(
                          width: 137,
                          height: 48,
                          child: addservicea(
                            text: 'Discount',
                            label: 'Discount',
                            controller: services7controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: SizedBox(
                          width: 137,
                          height: 48,
                          child: addservicea(
                            text: 'Duration Hours',
                            label: 'Duration Hours',
                            controller: services8controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: SizedBox(
                          width: 137,
                          height: 48,
                          child: addservicea(
                            text: 'Duration Mint.',
                            label: 'Duration Mint.s',
                            controller: services9controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: AppColors.purple,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      servicetext(
                        text: 'Set As Feature',
                        color: AppColors.fullgrey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 335,
                height: 48,
                child: Bookbutton(text: 'Save', onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
