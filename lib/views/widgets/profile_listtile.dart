import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.purple.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(100),
          color: Colors.purple.withOpacity(0.3),
        ),
        child: Icon(
          icon,
          color: Colors.purple,
        ),
      ),
      title: Text(
        title,
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.purple.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.navigate_next_outlined,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
