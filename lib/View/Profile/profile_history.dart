import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class ProfileHistory extends StatefulWidget {
  const ProfileHistory({super.key});

  @override
  State<ProfileHistory> createState() => _ProfileHistoryState();
}

class _ProfileHistoryState extends State<ProfileHistory> {
  List pages = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppbarText(text: 'History ', color: AppColors.white),
        centerTitle: true,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.purple,
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: pages.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Historycard(
                text: 'Service Name ',
                title: 'Employee :  Disney John ',
                onPressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
