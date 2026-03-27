import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppbarText(text: 'Service Detail ', color: AppColors.white),
        centerTitle: true,
        automaticallyImplyActions: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: LeadButton(onPressed: () {}),
        ),
        backgroundColor: AppColors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 27.0, bottom: 25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    AppImages.history,
                    height: 131,
                    width: 144,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              DetailText(text: 'From', title: 'Disney John        '),
              DetailText(text: 'To', title: 'Fardeen Kashif       '),
              DetailText(text: 'Email ID', title: 'disneykashif@gmail.com   '),
              DetailText(text: 'Service ', title: 'Cleaning   '),
              DetailText(text: 'Category', title: 'None     '),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: DetailText(
                  text: 'TransactionID',
                  title: 'SK345680976       ',
                ),
              ),
              DetailText(text: 'Payment', title: '90/-       '),
              DetailText(text: 'Date', title: 'Nov 20, 2023   /   15:45    '),
              TextButtonDetail(text: 'Status', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
