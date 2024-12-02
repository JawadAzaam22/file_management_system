import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/setting_controller.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/custom_text.dart';

class SettingScreen extends GetView<SettingController> {
  SettingScreen({super.key});
 // SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  AppLocalizations.of(context)!.settingsScreen,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    controller.goToProfile();
                  },
                  child: Container(
                    width: 800,
                    margin: EdgeInsetsDirectional.only(end: 150),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border:
                            Border.all(color: Colors.grey.shade500, width: 1)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Center(
                              child: Container(
                                width: 180,
                                height: 180,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("images/profil.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.userModel.name.toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: controller.userModel.username.toString(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Container(
                                      width: 2,
                                      height: 20,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  CustomText(
                                    text: controller.userModel.email.toString(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
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
                      child: PopupMenuButton<String>(
                        onSelected: (String value) {
                          controller.changeLanguage(value);
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 22),
                            Icon(Icons.language,
                                color: Theme.of(context).iconTheme.color),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                alignment: Alignment.center,
                                text: AppLocalizations.of(context)!.language,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: "en",
                              child: Text("English"),
                            ),
                            PopupMenuItem<String>(
                              value: "ar",
                              child: Text("العربية"),
                            ),
                          ];
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
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
                      child: PopupMenuButton<bool>(
                        initialValue: controller.isDarkMode,
                        onSelected: (bool value) {
                          controller.isDarkMode = value;
                          if (value) {
                            AdaptiveTheme.of(context).setDark();
                          } else {
                            AdaptiveTheme.of(context).setLight();
                          }
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 22,
                            ),
                            Icon(Icons.light_mode_rounded,
                                color: Theme.of(context).iconTheme.color),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                alignment: Alignment.center,
                                text: AppLocalizations.of(context)!.theme,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<bool>(
                              value: true,
                              child: Text(AppLocalizations.of(context)!.dark),
                            ),
                            PopupMenuItem<bool>(
                              value: false,
                              child: Text(AppLocalizations.of(context)!.light),
                            ),
                          ];
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.goToAboutUs();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.11),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline_rounded,
                                  color: Theme.of(context).iconTheme.color),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: AppLocalizations.of(context)!.about,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
