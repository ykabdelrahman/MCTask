import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/user_data_provider.dart';
import '../screens/botttom_nav_screen.dart';
import '../screens/developer.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late Map<String, dynamic>? userData =
      Provider.of<UserDataProvider>(context).userData ?? {};
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
          accountName: Text(
            '${userData!['username'] ?? 'nothin'}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            '${userData!['email'] ?? 'nothin'}',
          ),
          currentAccountPicture: SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                image: AssetImage('assets/images/user.png'),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavBar(),
              ),
              (route) => false,
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.category_outlined,
          ),
          title: const Text('Categories'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
          ),
          title: const Text('Developers'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DevelopersScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
          ),
          title: const Text('About us'),
          onTap: () {},
        ),
      ],
    );
  }
}
