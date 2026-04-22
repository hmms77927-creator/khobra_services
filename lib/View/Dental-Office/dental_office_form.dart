import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Dental-Office/dental_office_fillup.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class DentalOfficeForm extends StatefulWidget {
  const DentalOfficeForm({super.key});

  @override
  State<DentalOfficeForm> createState() => _DentalOfficeFormState();
}

class _DentalOfficeFormState extends State<DentalOfficeForm> {
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
            fontWeight: .w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: LeadButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: .topLeft,
              child: Container(
                width: 72,
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
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Align(
                alignment: .topLeft,
                child: FillForm(text: 'First Name', color: AppColors.pureblack),
              ),
            ),
            AppTextfield(
              hintText: 'Enter your First Name',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Align(
                alignment: .topLeft,
                child: FillForm(text: 'Last Name ', color: AppColors.pureblack),
              ),
            ),
            AppTextfield(
              hintText: 'Enter your last name',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Align(
                alignment: .topLeft,
                child: FillForm(text: 'Phone No', color: AppColors.pureblack),
              ),
            ),
            AppTextfield(
              hintText: 'Enter your phone ',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Align(
                alignment: .topLeft,
                child: FillForm(text: 'Address', color: AppColors.pureblack),
              ),
            ),
            AppTextfield(
              hintText: 'Enter your address',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0, right: 20, left: 200),
              child: ArrowButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DentalOfficeFillup()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
