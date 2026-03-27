import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Provider_side/Booking/book_services.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  TextEditingController searchcontroller = TextEditingController();
  int selectedIndex = 0;
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
              text: 'Pending',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookServices()),
                );
              },
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
                image: AppImages.building,
                description: 'Start',
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
                image: AppImages.wiring_3,
                description: 'Start',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomBookcontainer(
                text: 'Electronic Device fixing',
                subtext: '4517 Washington Ave. Manchester, Kentucky\n 39495',
                title: '28 Febuary, 2022 at 8:30 AM',
                subtitle: 'Wiley Waites',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: AppColors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20,
                              ),
                              child: Container(
                                width: 298,
                                height: 58,
                                color: AppColors.purple,
                                child: Row(
                                  children: [
                                    head2cont(
                                      text: 'Assign Driver',
                                      color: AppColors.white,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.clear,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: AssignButton(
                                text: 'John Doe ',
                                subtitle: 'Member since 2023',
                                image: AppImages.assign_1,
                                isSelected: selectedIndex == 1,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                              ),
                            ),
                            divicontainer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: AssignButton(
                                text: 'Fardeen Kashif ',
                                subtitle: 'Member since 2024',
                                image: AppImages.assign_2,
                                isSelected: selectedIndex == 1,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                              ),
                            ),
                            divicontainer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: AssignButton(
                                text: 'Elon Joe',
                                subtitle: 'Member since 2024',
                                image: AppImages.assign_3,
                                isSelected: selectedIndex == 1,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                              ),
                            ),
                            divicontainer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: AssignButton(
                                text: 'William kelesh',
                                subtitle: 'Member since 2025',
                                image: AppImages.assign_1,
                                isSelected: selectedIndex == 1,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                onTap: () {},
                image: AppImages.wiring_4,
                description: 'Start',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
