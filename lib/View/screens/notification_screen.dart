import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                child: Text(
                  AppLocalizations.of(context)!.notificationScreen,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsetsDirectional.only(start: 10,end: 100),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(7.11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ]),

                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: 10)
            ],
          ),
        ),
      ),
    );
  }
}
