import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../widgets/custom_category_card.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  final Stream<QuerySnapshot> notesStream = FirebaseFirestore.instance
      .collection('categories')
      .orderBy('id')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: notesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            );
          }

          return ListView(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 8,
              bottom: 8,
            ),
            clipBehavior: Clip.none,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return CustomCategoryCard(
                categoryName: data['category'],
                image: data['image'],
                onTap: () {},
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
