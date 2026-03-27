import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class EarningList extends StatefulWidget {
  const EarningList({super.key});

  @override
  State<EarningList> createState() => _EarningListState();
}

class _EarningListState extends State<EarningList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Earning List',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: .w500,
          ),
        ),
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
              child: EarningContainer(
                text:
                    'Sed ut perspiciatis unde omnis iste\n natus error sit voluptatem accusantium',
                subtext: 'Amount',
                title: 'Rs1258',
                subtitle: 'Date',
                description: '02 Dec, 2022',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: EarningContainer(
                text:
                    'Sed ut perspiciatis unde omnis iste\n natus error sit voluptatem accusantium',
                subtext: 'Amount',
                title: 'Rs1258',
                subtitle: 'Date',
                description: '02 Dec, 2022',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: EarningContainer(
                text:
                    'Sed ut perspiciatis unde omnis iste\n natus error sit voluptatem accusantium\n doloremque laudantium, totam rem.',
                subtext: 'Amount',
                title: 'Rs1258',
                subtitle: 'Date',
                description: '02 Dec, 2022',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: EarningContainer(
                text:
                    'Sed ut perspiciatis unde omnis iste\n natus error sit voluptatem accusantium\n doloremque laudantium, totam rem.',
                subtext: 'Amount',
                title: 'Rs1258',
                subtitle: 'Date',
                description: '02 Dec, 2022',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
