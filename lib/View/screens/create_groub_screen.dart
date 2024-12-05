import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/create_greoup_contoller.dart';
import '../../UI/color.dart';
import '../../l10n/app_localizations.dart';

class CreateGroubScreen extends GetView<CreateGroupController> {
  const CreateGroubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.createGroup,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 502),
                    padding:
                    EdgeInsets.symmetric(vertical: 40, horizontal: 100),
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Theme.of(context).canvasColor),
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primaryContainer
                      //Color(0x3F06235B),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.addMember,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextFormField(
                          controller: controller.searchContoller,
                          onChanged: (value){
                            controller.onSearchChanged(value);
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.search,
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.blue.shade600,
                            icon: IconButton(
                                onPressed: () {
                                  controller.search();
                                },
                                icon: Icon(Icons.search)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: Obx(() {
                            if (controller.isLoading.value) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (controller.searchResults.isEmpty) {
                              return Center(
                                child: Text(
                                  AppLocalizations.of(context)!.noResultsFound,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }

                            return ListView.builder(
                              itemCount: controller.searchResults.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade500,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "${controller.searchResults[index].username}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.person_add,
                                            color: Colors.white),
                                        onPressed: () => controller.sendInvite(
                                            controller.searchResults[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 502),
                      padding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 80),
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Theme.of(context).canvasColor),
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primaryContainer
                        //Color(0x3F06235B),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            AppLocalizations.of(context)!.group,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                                fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.groubNameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.groubvalidation ;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.entergroub,
                              prefixIcon: Icon(
                                Icons.group,
                                color: Colors.grey,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            AppLocalizations.of(context)!.description,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                                fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLines: 4,
                            controller: controller.groubDescrebtionCintroller,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.descriptionvalidation;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.enterdescriotion,
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.createGroup();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.11),
                                    ),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.create,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
