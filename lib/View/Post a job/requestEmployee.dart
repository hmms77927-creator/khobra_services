import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Post%20a%20job/rewie_screen.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class Requestemployee extends StatefulWidget {
  const Requestemployee({super.key});

  @override
  State<Requestemployee> createState() => _RequestemployeeState();
}

class _RequestemployeeState extends State<Requestemployee> {
  List<bool> isChecked = [false, false, false, false, false];
  TextEditingController Searchcontroller = TextEditingController();
  List name = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Select Date',
          style: TextStyle(color: AppColors.pureblack),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: employee(controller: Searchcontroller),
          ),
          ListView.builder(
            itemCount: name.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: EmployeeCard(
                  text: 'Employer 1',
                  title: 'abc',
                  onPressed: () {},
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                    });
                  },
                  value: isChecked[index],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CustomContainerButton(
              text: 'Confirm Booking',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewScreen()),
                );
              },
              fontsize: 15,
              fontweight: .w600,
            ),
          ),
        ],
      ),
    );
  }
}
