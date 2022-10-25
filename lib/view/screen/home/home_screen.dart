import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/constant/theme/app_color.dart';
import 'package:photo_editor_app/view/component/widget/bottom_navigationbar.dart';
import 'package:photo_editor_app/view/screen/home/widget/chip_widget.dart';
import 'package:photo_editor_app/view/screen/home/widget/gridchild_widget.dart';
import 'package:photo_editor_app/view/screen/photo/edit_photo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 16,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/quan.jpg'),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'Quang Phạm',
          style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 400),
        middleColor: theme.scaffoldBackgroundColor,
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: AppColors.transparent,
        closedElevation: 5,
        openBuilder: (context, _) => const EditPhotoScreen(),
        closedBuilder: (context, openContainer) =>
            FloatingActionButton.extended(
          onPressed: () {
            openContainer();
          },
          icon: const Icon(Icons.camera_alt),
          label: const Text('Chụp ảnh'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.globe),
            title: const Text('Phổ biến'),
            activeColor: AppColors.primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.search),
            title: const Text('Tìm kiếm'),
            activeColor: AppColors.primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.settings),
            title: const Text('Cài đặt'),
            activeColor: AppColors.primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.person),
            title: const Text('Tài khoản'),
            activeColor: AppColors.primaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _buildThreePageViewChildren(),
      ),
    );
  }

  List<Widget> _buildThreePageViewChildren() {
    return <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Theme.of(context).backgroundColor,
          ),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Album của tôi',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
                    ChipWidget(
                      onTap: () {},
                      horizontalPadding: 0,
                      widget: Text(
                        'Xem tất cả',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 24,
                  children: const [
                    GridChild(
                      count: 132,
                      description: 'Gần đây',
                      imagePath: 'assets/a_1.jpeg',
                    ),
                    GridChild(
                      count: 42,
                      description: 'Ưa thích',
                      imagePath: 'assets/a_2.jpeg',
                    ),
                    GridChild(
                      count: 72,
                      description: 'Được chia sẻ',
                      imagePath: 'assets/a_3.jpeg',
                    ),
                    GridChild(
                      count: 21,
                      description: 'Khác',
                      imagePath: 'assets/a_4.jpeg',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Mọi người',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    ChipWidget(
                      onTap: (){
                        Navigator.pushNamed(
                          context,
                          AppRouteName.album,
                        );
                      },
                      horizontalPadding: 0,
                      widget: Text(
                        'Xem tất cả',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/p_${index + 1}.jpeg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          )),
      Container(),
      Container(),
      Container(),
    ];
  }
}
