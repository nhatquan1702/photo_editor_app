import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/widget/bottom_navigationbar.dart';
import 'package:photo_editor_app/view/home/widget/chip_widget.dart';
import 'package:photo_editor_app/view/home/widget/gridchild_widget.dart';
import 'package:photo_editor_app/view/photo/edit_photo_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('assets/p_3.jpeg'),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'Hello William',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 400),
        middleColor: Theme.of(context).scaffoldBackgroundColor,
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Colors.transparent,
        closedElevation: 5,
        openBuilder: (context, _) => const EditPhotoView(),
        closedBuilder: (context, openContainer) =>
            FloatingActionButton.extended(
          onPressed: () {
            openContainer();
          },
          icon: const Icon(Icons.camera_alt),
          label: const Text('Take a photo'),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   onDestinationSelected: (int index) {
      //     _pageController.animateToPage(
      //       index,
      //       duration: const Duration(milliseconds: 200),
      //       curve: Curves.easeInOut,
      //     );
      //   },
      //   selectedIndex: _currentIndex,
      //   destinations: const [
      //     NavigationDestination(icon: Icon(CupertinoIcons.globe), label: ''),
      //     NavigationDestination(icon: Icon(CupertinoIcons.search), label: ''),
      //     NavigationDestination(
      //         icon: Icon(CupertinoIcons.settings_solid), label: '')
      //   ],
      // ),
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
            title: const Text('Popular'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.search),
            title: const Text('Search'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.settings),
            title: const Text('Setting'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.person),
            title: const Text('Account'),
            activeColor: Colors.blue,
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
                      'My Albums',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
                    ChipWidget(
                      label: Text(
                        'See All',
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
                      description: 'Vacation',
                      imagePath: 'assets/a_1.jpeg',
                    ),
                    GridChild(
                      count: 42,
                      description: 'Building',
                      imagePath: 'assets/a_2.jpeg',
                    ),
                    GridChild(
                      count: 72,
                      description: 'Vacation',
                      imagePath: 'assets/a_3.jpeg',
                    ),
                    GridChild(
                      count: 21,
                      description: 'Geometric',
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
                      'People',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    ChipWidget(
                        label: Text(
                      'See All',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ))
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
      Container(color: Colors.purpleAccent),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ];
  }
}
