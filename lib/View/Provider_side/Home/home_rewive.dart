import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeRewive extends StatefulWidget {
  final String serviceId;
  final String serviceName;
  final String image;

  const HomeRewive({
    super.key,
    required this.serviceId,
    required this.serviceName,
    required this.image,
  });

  @override
  State<HomeRewive> createState() => _HomeRewiveState();
}

class _HomeRewiveState extends State<HomeRewive> {
  final TextEditingController controller = TextEditingController();
  int selectedRating = 0;

  /// ⭐ RATING BAR (INPUT)
  Widget buildRatingBar() {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              selectedRating = index + 1;
            });
          },
          icon: Icon(
            index < selectedRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 28,
          ),
        );
      }),
    );
  }

  void addReview() {
    if (controller.text.trim().isEmpty || selectedRating == 0) return;

    FirebaseFirestore.instance.collection("reviews").add({
      "serviceId": widget.serviceId.toString(),
      "userName": widget.serviceName,
      "userEmail": widget.serviceName,
      "userImage": widget.image,
      "serviceName": widget.serviceName,
      "rating": selectedRating,
      "review": controller.text.trim(),
      "createdAt": DateTime.now(),
    });

    controller.clear();
    setState(() => selectedRating = 0);
    FocusScope.of(context).unfocus();
  }

  Widget buildStars(int rating) {
    return Row(
      children: List.generate(5, (i) {
        return Icon(
          i < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 18,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.serviceName)),

      body: Column(
        children: [

          /// ⭐ RATING INPUT UI (NEW ADDED)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [

                /// ⭐ STAR BAR
                buildRatingBar(),

                const SizedBox(height: 10),

                /// COMMENT BOX
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "Write review...",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: addReview,
                    )
                  ],
                ),
              ],
            ),
          ),

          const Divider(),

          /// REVIEWS LIST
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("reviews")
                  .where("serviceId",
                  isEqualTo: widget.serviceId.toString())
                  .snapshots(),

              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return const Center(child: Text("No Reviews"));
                }

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data =
                    docs[index].data() as Map<String, dynamic>;

                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                          )
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// USER INFO
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                data["userImage"] != ""
                                    ? NetworkImage(
                                    data["userImage"])
                                    : null,
                                child: data["userImage"] == ""
                                    ? const Icon(Icons.person)
                                    : null,
                              ),

                              const SizedBox(width: 10),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(data["userName"] ?? ""),
                                  Text(
                                    data["userEmail"] ?? "",
                                    style: const TextStyle(
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),

                          const Divider(),

                          /// SERVICE NAME
                          Text(
                            "Service: ${data["serviceName"] ?? ""}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 5),

                          /// ⭐ DISPLAY STARS
                          buildStars(data["rating"] ?? 0),

                          const SizedBox(height: 5),

                          /// REVIEW TEXT
                          Text(data["review"] ?? ""),
                        ],
                      ),
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