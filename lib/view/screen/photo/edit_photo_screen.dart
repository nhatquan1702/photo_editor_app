import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor_app/view/screen/home/widget/chip_widget.dart';

class EditPhotoScreen extends StatefulWidget {
  const EditPhotoScreen({Key? key}) : super(key: key);

  @override
  State<EditPhotoScreen> createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  double _sliderValue = 0.34;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {},
        selectedIndex: 1,
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.info), label: ''),
          NavigationDestination(icon: Icon(CupertinoIcons.photo), label: ''),
          NavigationDestination(icon: Icon(CupertinoIcons.crop), label: ''),
        ],
      ),
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        centerTitle: true,
        title: Text(
          'Chỉnh sửa',
          style:
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.xmark,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(),
          color: theme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/a_1.jpeg'),
                        )),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: theme.backgroundColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Tương phản',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: theme.floatingActionButtonTheme
                                              .backgroundColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            (_sliderValue * 100)
                                                .toStringAsFixed(0),
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ChipWidget(
                    onTap: (){},
                    widget: const Icon(CupertinoIcons.brightness),
                    horizontalPadding: 8,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  ChipWidget(
                    onTap: (){},
                    widget: const Icon(
                      Icons.contrast,
                    ),
                    horizontalPadding: 8,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ChipWidget(
                    onTap: (){},
                    widget: const Icon(Icons.water_drop_outlined),
                    horizontalPadding: 8,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ChipWidget(
                    onTap: (){},
                    widget: const Icon(Icons.brightness_4),
                    horizontalPadding: 8,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ChipWidget(
                    onTap: (){},
                    widget: const Icon(Icons.adjust),
                    horizontalPadding: 8,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ChipWidget(
                    onTap: (){},
                    widget: const Icon(Icons.settings),
                    horizontalPadding: 8,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
