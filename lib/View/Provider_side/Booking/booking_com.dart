import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class BookingCom extends StatefulWidget {
  const BookingCom({super.key});

  @override
  State<BookingCom> createState() => _BookingComState();
}

class _BookingComState extends State<BookingCom> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Booking',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.purple,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bookfield(
              controller: searchcontroller,
              text: 'Completed',
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomBookcontainer(
                text: 'House Cleaning',
                subtext: '4517 Washington Ave. Manchester,\n Kentucky 39495',
                title: '28 Febuary, 2022 at 8:30 AM',
                subtitle: 'Anna Littlical',
                onPressed: () {},
                onTap: () {},
                // image: AppImages.building,
                description: 'Completed',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomBookcontainer(
                text: 'House Cleaning',
                subtext: '4517 Washington Ave. Manchester, Kentucky\n 39495',
                title: '28 Febuary, 2022 at 8:30 AM',
                subtitle: 'Anna Littlical',
                onPressed: () {},
                onTap: () {},
                // image: AppImages.wiring_3,
                description: 'Completed',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomBookcontainer(
                text: 'Electronic Device fixing',
                subtext: '4517 Washington Ave. Manchester, Kentucky\n 39495',
                title: '28 Febuary, 2022 at 8:30 AM',
                subtitle: 'Wiley Waites',
                onPressed: () {},
                onTap: () {},
                // image: AppImages.wiring_4,
                description: 'Completed',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
