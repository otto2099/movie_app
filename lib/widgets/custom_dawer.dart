import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('OH'),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: Text(
                'OH',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          ItemMenu(
            icon: Icons.home_outlined,
            name: 'Home',
            ontap: () {},
          ),
          ItemMenu(icon: Icons.settings, name: 'Settings', ontap: () {}),
          const Divider(),
          ItemMenu(
            icon: Icons.exit_to_app,
            name: 'Cerrar sesión',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function? ontap;
  const ItemMenu({
    Key? key,
    required this.icon,
    required this.name,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => ontap!(),
    );
  }
}
