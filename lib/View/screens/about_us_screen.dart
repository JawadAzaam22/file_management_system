import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(40),
                constraints: BoxConstraints(),
                child:  Text(
                  AppLocalizations.of(context)!.aboutScreen,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 60,right: 60),
                child: Container(
                  padding: EdgeInsets.all(30),

                  constraints: BoxConstraints(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Theme.of(context).dividerColor,width: 2),
                      shape: BoxShape.rectangle
                  ),
                  child:  Text(
                    "Our application is designed to streamline file management and enhance collaboration among users. With a user-friendly interface, it allows you to easily upload, organize, and share your files with friends and colleagues. Whether you're working on a group project or simply need a secure place to store your documents, our app provides the tools you need to stay productive. Key features include real-time collaboration, customizable folders, and robust security measures to protect your data. Join us in revolutionizing the way you manage and share files—experience seamless connectivity and efficiency at your fingertips!",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
