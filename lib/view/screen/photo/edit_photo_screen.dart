import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';
import 'package:photo_editor_app/view/component/widget/chip_widget_square.dart';

class EditPhotoScreen extends StatefulWidget {
  const EditPhotoScreen({Key? key}) : super(key: key);

  @override
  State<EditPhotoScreen> createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  late PhotoItemModel photo;
  double _sliderValue = 0.34;

  @override
  void didChangeDependencies() {
    photo = ModalRoute.of(context)?.settings.arguments as PhotoItemModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.backgroundColor,
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
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(photo.src.portrait),
                      ),
                    ),
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
                  CustomSquareButton(
                    onTap: () {},
                    icon: CupertinoIcons.brightness,
                    context: context,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  CustomSquareButton(
                    onTap: () {},
                    icon: Icons.contrast,
                    context: context,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomSquareButton(
                    onTap: () {},
                    icon: Icons.water_drop_outlined,
                    context: context,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomSquareButton(
                    onTap: () {},
                    icon: Icons.brightness_4,
                    context: context,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomSquareButton(
                    onTap: () {},
                    icon: Icons.adjust,
                    context: context,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomSquareButton(
                    onTap: () {},
                    icon: Icons.settings,
                    context: context,
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
