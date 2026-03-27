import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class BookServices extends StatefulWidget {
  const BookServices({super.key});

  @override
  State<BookServices> createState() => _BookServicesState();
}

class _BookServicesState extends State<BookServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Pending',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              'Check Status',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: .w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: headingcon(
                    text: 'Booking ID',
                    color: AppColors.fullgrey,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: head2cont(text: '#123', color: AppColors.purple),
                ),
              ],
            ),
            divicontainer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: head2cont(
                          text: 'Apartment Cleaning',
                          color: AppColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: subcontainer(
                                text: 'Date :',
                                color: AppColors.black,
                              ),
                            ),
                            subcontainer(
                              text: '26 Jan, 2022',
                              color: AppColors.fullgrey,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10,
                            ),
                            child: subcontainer(
                              text: 'Time :',
                              color: AppColors.black,
                            ),
                          ),
                          subcontainer(
                            text: '04:00 PM',
                            color: AppColors.fullgrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(AppImages.wiring),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: head2cont(text: 'About Customer', color: AppColors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: SizedBox(
                  width: 336,
                  height: 192,
                  child: Card(
                    color: AppColors.fieldcolor,
                    child: Row(
                      mainAxisAlignment: .start,
                      crossAxisAlignment: .start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 10),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.booking),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20,
                              ),
                              child: head2cont(
                                text: 'Rose Customer',
                                color: AppColors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Icon(
                                      Icons.email,
                                      color: AppColors.fullgrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: subcontainer(
                                      text: 'example@gmail.com',
                                      color: AppColors.fullgrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Icon(
                                      Icons.location_on,
                                      color: AppColors.fullgrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: subcontainer(
                                      text: '1901 Thornridge Cirav...',
                                      color: AppColors.fullgrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: headingcon(
                text: 'Payment Details',
                color: AppColors.black,
              ),
            ),
            Center(
              child: SizedBox(
                width: 335,
                height: 159,
                child: Card(
                  color: AppColors.fieldcolor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10),
                            child: subcontainer(
                              text: 'ID',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              top: 10,
                            ),
                            child: head2cont(
                              text: '#123',
                              color: AppColors.purple,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Method',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: 'Cash',
                              color: AppColors.fullgrey,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Status',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: 'Pending',
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Subtotal',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: 'Rs459',
                              color: AppColors.fullgrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: head2cont(text: 'Price Detail', color: AppColors.black),
            ),
            Center(
              child: SizedBox(
                width: 335,
                height: 246,
                child: Card(
                  color: AppColors.fieldcolor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10),
                            child: subcontainer(
                              text: 'Rate',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              top: 10,
                            ),
                            child: subcontainer(
                              text: '₹45.00',
                              color: AppColors.fullgrey,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Quantity',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: '*2',
                              color: AppColors.fullgrey,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Discount',
                              color: AppColors.black,
                            ),
                          ),
                          subcontainer(
                            text: ' (5% off)',
                            color: AppColors.green,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: '- Rs23.66',
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Coupon',
                              color: AppColors.black,
                            ),
                          ),
                          subcontainer(
                            text: ' (AB45789A)',
                            color: AppColors.purple,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: 'Rs459',
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: subcontainer(
                              text: 'Subtotal',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: subcontainer(
                              text: 'Rs459',
                              color: AppColors.fullgrey,
                            ),
                          ),
                        ],
                      ),
                      divicontainer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: head2cont(
                              text: 'Total Amount',
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: head2cont(
                              text: 'Rs1255',
                              color: AppColors.purple,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 5),
              child: Center(
                child: SizedBox(
                  width: 141,
                  height: 38,
                  child: Bookbutton(
                    text: 'Start',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 40,
                                    child: Divider(
                                      color: AppColors.dividercolor,
                                      thickness: 3,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: head2cont(
                                          text: 'Booking History',
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20.0,
                                        ),
                                        child: head2cont(
                                          text: 'ID : #123',
                                          color: AppColors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  divicontainer(),
                                  Bottomsheetcontainer(
                                    text: '1:17 PM',
                                    subtext: '6 Feb',
                                    title: 'New Booking',
                                    subtitle: 'New Booking Added by\n customer',
                                    color: AppColors.red,
                                  ),
                                  Bottomsheetcontainer(
                                    text: '1:21 PM',
                                    subtext: '6 Feb',
                                    title: 'Accept Booking',
                                    subtitle:
                                        'Status changed From\n pending to accept',
                                    color: AppColors.lightGreen,
                                  ),
                                  Bottomsheetcontainer(
                                    text: '1:22 PM',
                                    subtext: '6 Feb',
                                    title: 'Assigned Booking',
                                    subtitle:
                                        'Booking has assigned\n to Naomie Hackett',
                                    color: AppColors.red,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
