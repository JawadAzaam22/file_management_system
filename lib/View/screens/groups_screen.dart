
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/custom_text.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          Center(
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(10, (index) {
            return Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: index == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: 'new group',
                          alignment: Alignment.center,
                          maxLines: 3,
                        )
                      ],
                    )
                  : CustomText(
                      text: 'Item $index',
                      alignment: Alignment.center,
                    ),
            );
          }),
        ),
      ),
    );
  }
}
