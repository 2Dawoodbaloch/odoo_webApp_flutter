class NavMenuItem {
  const NavMenuItem({required this.label, this.route});
  final String label;
  final String? route; 
}

class NavMenuSection {
  const NavMenuSection({this.title = "", required this.items});
  final String title;
  final List<NavMenuItem> items;
}

class NavMenuData {
  const NavMenuData({required this.label, this.sections = const [], this.route});
  final String label; // top-level nav label, e.g. "Accounting"
  final List<NavMenuSection> sections;
  final String? route; 
}