import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sidebarx/sidebarx.dart';



import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;
  //final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Theme.of(context).colorScheme.primaryContainer,
        textStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle:  TextStyle(
          color:Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30, right: 10),
        selectedItemTextPadding: const EdgeInsets.only(left: 30, right: 10),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFF1A649A).withOpacity(0.6),
          ),
          gradient: AppTheme.backgroundGradient(context),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      footerDivider: Divider(color: Colors.white.withOpacity(0.3), height: 1),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset('images/logooo.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
            icon: Icons.groups_outlined,
            label: AppLocalizations.of(context)!.groups,
            onTap: () => _controller.changCurrentScreen(0)),
        SidebarXItem(
            icon: Icons.insert_invitation_outlined,
            label: AppLocalizations.of(context)!.invitation,
            onTap: () => _controller.changCurrentScreen(1)),
        SidebarXItem(
          icon: Icons.notifications,
          label: AppLocalizations.of(context)!.notifications,
          onTap: () => _controller.changCurrentScreen(2),
        ),
        SidebarXItem(
            icon: Icons.settings,
            label: AppLocalizations.of(context)!.settings,
            onTap: () => _controller.changCurrentScreen(3)),
      ],
    );
  }
}
