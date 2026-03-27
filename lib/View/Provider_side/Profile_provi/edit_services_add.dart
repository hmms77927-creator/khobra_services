import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class EditServicesAdd extends StatefulWidget {
  const EditServicesAdd({super.key});
  @override
  State<EditServicesAdd> createState() => _EditServicesAddState();
}
class _EditServicesAddState extends State<EditServicesAdd> {
  bool card1 = true;
  bool card2 = false;
  bool card3 = true;
  TextEditingController addressController = TextEditingController();
  void showAddServiceDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      const Text(
                        "Edit Service Address",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: bookfield(
                    controller: addressController,
                    text: 'United State',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 295,
                    height: 51,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.purple,
                                      borderRadius: BorderRadius.circular(70),
                                    ),
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColors.white,
                                      size: 50,
                                    ),
                                  ),
                                  ProviderProfile(
                                    text: 'Delete Address',
                                    subtext:
                                        'Are you sure you want to delete                                                                    \n this address',
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: SizedBox(
                                          height: 51,
                                          width: 100,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      5,
                                                    ),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 16,
                                                fontWeight: .w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                          left: 10,
                                        ),
                                        child: SizedBox(
                                          height: 51,
                                          width: 100,
                                          child: Bookbutton(
                                            text: 'Delete',
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: const Text(
          "Services Address",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: showAddServiceDialog,
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          AddServicescard(
            text: 'Birmingham, Alabama',
            title: 'Edit',
            subtitle: 'Delete',
            value: card1,
            onChanged: (val) {
              setState(() {
                card1 = val;
              });
            },
          ),
          AddServicescard(
            text: 'New York, NY',
            title: 'Edit',
            subtitle: 'Delete',
            value: card2,
            onChanged: (val) {
              setState(() {
                card2 = val;
              });
            },
          ),
          AddServicescard(
            text: 'Los Angeles, CA',
            title: 'Edit',
            subtitle: 'Delete',
            value: card3,
            onChanged: (val) {
              setState(() {
                card3 = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
