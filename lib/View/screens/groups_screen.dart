import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/custom_text.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.groupsScreen,
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  subtitle: Text(AppLocalizations.of(context)!.welcomeSentence,
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10,left: 40,right: 40),
                child: Text(
                  AppLocalizations.of(context)!.yourGroups,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.extent(
                maxCrossAxisExtent: 150,
                padding: const EdgeInsets.only(top: 10,right: 60,left: 60,bottom: 10),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(10, (index) {
                  return Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: index == 0
                        ? const Icon(
                            Icons.add,
                          )
                        : CustomText(
                            text: 'Item $index',
                            alignment: Alignment.center,
                          ),
                  );
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10,left: 40,right: 40),
                child: Text(
                  AppLocalizations.of(context)!.memberOf,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.extent(
                maxCrossAxisExtent: 150,
                padding: const EdgeInsets.only(top: 10,right: 60,left: 60,bottom: 10),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(5, (index) {
                  return Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: CustomText(
                      text: 'Item $index',
                      alignment: Alignment.center,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
