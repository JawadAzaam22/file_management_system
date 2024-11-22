import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/setting_controller.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  SettingController settingController = Get.put(SettingController());
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
                  child: Center(
                    child: CustomText(
                      text: AppLocalizations.of(context)!.settingsScreen,
                     // alignment: Alignment.topCenter,
                      fontWeight: FontWeight.bold,
                      fontsize: 60,
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  settingController.goToProfile();
                },
                child: Container(
                  height: 250,
                  width: 1100,
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
                      // Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: "deemh alaisame",
                              fontsize: 30,
                              //alignment: Alignment.topLeft,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "deemh",
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
                                  text: "deemhalaisame@gmail.com",
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
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    // Container(
                    //   height: 40,
                    //   width: 200,
                    //   child: ElevatedButton(
                    //       onPressed: () {
                    //         settingController.changeLanguage("ar");
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Theme.of(context).primaryColor,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(7.11),
                    //         ),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Icon(Icons.language,
                    //               color: Theme.of(context).iconTheme.color),
                    //           CustomText(
                    //             alignment: Alignment.center,
                    //             text: Intl.message("language"),
                    //           ),
                    //         ],
                    //       )),
                    // ),
                    Container(
                      height: 40,
                      width: 200,
                      child: PopupMenuButton<String>(
                        onSelected: (String value) {
                          settingController.changeLanguage(value);
                        },
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.11),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.language,
                                  color: Theme.of(context).iconTheme.color),
                              CustomText(
                                alignment: Alignment.center,
                                text: AppLocalizations.of(context)!.language,
                              ),
                            ],
                          ),
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
                      color: Theme.of(context).primaryColor,
                      child: PopupMenuButton<bool>(
                        initialValue: settingController.isDarkMode,
                        onSelected: (bool value) {
                          settingController.isDarkMode = value;
                          if (value) {
                            AdaptiveTheme.of(context).setDark();
                          } else {
                            AdaptiveTheme.of(context).setLight();
                          }
                        },
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.11),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.light_mode_rounded,
                                  color: Theme.of(context).iconTheme.color),
                              CustomText(
                                alignment: Alignment.center,
                                text: AppLocalizations.of(context)!.theme,
                              ),
                            ],
                          ),
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
                    // Container(
                    //   height: 40,
                    //   width: 200,
                    //   child: ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Theme.of(context).primaryColor,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(7.11),
                    //         ),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Icon(Icons.info_outline_rounded,
                    //               color: Theme.of(context).iconTheme.color),
                    //           CustomText(
                    //             text: Intl.message("about"),
                    //             alignment: Alignment.center,
                    //           ),
                    //         ],
                    //       )),
                    // ),

                  ],
                )),
          ],
        ),
      ),
    );
  }
}
