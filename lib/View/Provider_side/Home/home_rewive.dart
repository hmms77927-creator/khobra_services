// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
//
// class HomeRewive extends StatefulWidget {
//   const HomeRewive({super.key});
//
//   @override
//   State<HomeRewive> createState() => _HomeRewiveState();
// }
//
// class _HomeRewiveState extends State<HomeRewive> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.purple,
//         leadingWidth: 200,
//         leading: TextButton.icon(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
//           label: Text(
//             'Review On Services',
//             style: TextStyle(
//               color: AppColors.white,
//               fontSize: 16,
//               fontWeight: .w600,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: head2cont(
//                 text: 'Customer Review By Service Name',
//                 color: AppColors.black,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: customerReviewcard(
//                 image: AppImages.review_1,
//                 text: 'Donna Bins',
//                 subtext: '@DONNABINS',
//                 title: 'Service Name : Painting',
//                 subtitle:
//                     'Amet minim mollit non deserunt\nullamco est sit aliqua dolor do amet. ',
//                 onPressed: () {},
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: customerReviewcard(
//                 image: AppImages.review_2,
//                 text: 'Donna Bins',
//                 subtext: '@DONNABINS',
//                 title: 'Service Name : Painting',
//                 subtitle:
//                     'Amet minim mollit non deserunt\nullamco est sit aliqua dolor do amet. ',
//                 onPressed: () {},
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: customerReviewcard(
//                 image: AppImages.review_3,
//                 text: 'Donna Bins',
//                 subtext: '@DONNABINS',
//                 title: 'Service Name : Painting',
//                 subtitle:
//                     'Amet minim mollit non deserunt\nullamco est sit aliqua dolor do amet. ',
//                 onPressed: () {},
//               ),
//             ),
//           ],
//     ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRewive extends StatelessWidget {
  final String serviceId;
  final String serviceName;
  final String image;

  HomeRewive({
    super.key,
    required this.serviceId,
    required this.serviceName,
    required this.image,
  });

  final TextEditingController controller = TextEditingController();

  /// 🔥 ADD REVIEW
  void addReview() {
    if (controller.text.isEmpty) return;

    FirebaseFirestore.instance.collection("reviews").add({
      "serviceId": serviceId.toString(),
      "userName": serviceName,
      "userImage": image,
      "review": controller.text,
      "createdAt": FieldValue.serverTimestamp(),
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(serviceName)),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Write review...",
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: addReview,
                )
              ],
            ),
          ),

          const Divider(),

          /// 🔥 REAL TIME REVIEWS (FIXED)
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("reviews")
                  .where("serviceId", isEqualTo: serviceId.toString())
                  .snapshots(),   // ❗ orderBy REMOVE for safety

              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No Reviews Yet"));
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          data["userImage"] ?? "",
                        ),
                      ),
                      title: Text(data["userName"] ?? ""),
                      subtitle: Text(data["review"] ?? ""),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}