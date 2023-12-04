import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mctask/views/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_data_provider.dart';
import '../widgets/drawer.dart';
import '../widgets/profile_listtile.dart';
import 'developer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late Map<String, dynamic>? userData =
      Provider.of<UserDataProvider>(context).userData ?? {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: const Drawer(
          child: CustomDrawer(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 3),

            /// -- IMAGE
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: AssetImage('assets/images/user.png'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //------------email---------
            Text(
              '${userData!['email'] ?? 'nothin'}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            //-------button for editing profile-------
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 250, 240, 230),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),

            //------developers button------
            ProfileMenuWidget(
              title: "Developers",
              icon: Icons.person_2_outlined,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DevelopersScreen(),
                    ));
              },
            ),

            //-------address button--------
            ProfileMenuWidget(
              title: "Address",
              icon: (Icons.location_on),
              onPress: () {},
            ),

            //-------payment button-------
            ProfileMenuWidget(
              title: "Payment",
              icon: Icons.credit_card,
              onPress: () {},
            ),

            //-------about us button----
            ProfileMenuWidget(
              title: "About Us",
              icon: Icons.info_outline,
              onPress: () {},
            ),

            //-----reviews button-------
            ProfileMenuWidget(
              title: "Reviews",
              icon: Icons.star_border_outlined,
              onPress: () {},
            ),

            //--------log out button----------
            ProfileMenuWidget(
              title: "Logout",
              icon: Icons.logout_outlined,
              endIcon: false,
              onPress: _logout,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout() async {
    await _firebaseAuth.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_data');

    if (context.mounted) {
      Provider.of<UserDataProvider>(context, listen: false).clearUserData();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
        (route) => false,
      );
    }
  }
}
