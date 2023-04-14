import 'package:flutter/material.dart';
import 'package:health_market/interfaces/interface_pages.dart';
import 'package:health_market/pages/main/pages/descriptions_page.dart';
import 'package:health_market/pages/main/widgets/bottom_buner.dart';
import 'package:health_market/pages/main/widgets/bunner_consultation.dart';
import 'package:health_market/pages/main/widgets/custom_tab_bar.dart';
import 'package:health_market/pages/main/widgets/like.dart';
import 'package:health_market/pages/main/widgets/photo_carusel.dart';
import 'package:health_market/pages/main/widgets/similar_product.dart';
import 'package:health_market/theme/theme.dart';
import 'package:health_market/widgets/bunners.dart';
import 'package:health_market/widgets/buttons.dart';

import '../../generated/assets.gen.dart';
import '../../theme/my_theme_extension.dart';

const List<Widget> _views = [
  DescriptionsPage(),
  Text('Content of Tab Two'),
  Text('Content of Tab Three'),
  Text('Content of Tab Three'),
];

class MainWidget extends StatefulWidget implements InterfacesPages {
  const MainWidget();

  @override
  State<MainWidget> createState() => _MainWidgetState();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return AppBar(
      leading: InkWell(
          onTap: () {},
          child: Center(
            child: Assets.icons.arrow.svg(
              width: 13,
              height: 27,
              fit: BoxFit.fill,
            ),
          )),
      actions: [
        Assets.icons.like.svg(),
        const SizedBox(
          width: 16,
        ),
      ],
      elevation: 0,
      title: Center(
        child: Text(
          'Концентрат мозговая активность с аминокислото',
          style: ext.t2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  bool isHasLike = false;
  bool isHasDisLike = false;
  int likes = 5;
  int disLikes = 1;

  late TabController _tabController;

  bool isInBag = false;
  int quantityInCart = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(0);
  }

  void increment() {
    if (quantityInCart == 0) {
      isInBag = true;
    }
    quantityInCart++;
    setState(() {});
  }

  void decrement() {
    quantityInCart--;
    if (quantityInCart == 0) {
      isInBag = false;
    }
    setState(() {});
  }

  void setInBag(bool isInside) {
    isInBag = isInside;
    setState(() {});
  }

  void setLike(bool like) {
    if (like == true) {
      if (isHasLike) {
        likes--;
        isHasLike = false;
      } else {
        likes++;
        isHasLike = true;
        if (isHasDisLike) {
          disLikes--;
        }
        isHasDisLike = false;
      }
    } else {
      if (isHasDisLike) {
        disLikes--;
        isHasDisLike = false;
      } else {
        disLikes++;
        isHasDisLike = true;
        if (isHasLike) {
          likes--;
        }
        isHasLike = false;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final ext = Theme.of(context).extension<MyThemeExtension>()!;
    final paddingBottom = mediaQuery.height * 0.06;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppStyle.padding,
            right: AppStyle.padding,
            bottom: paddingBottom,
          ),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PhotoCarusel(
                aspectRatio: 16 / 9,
                images: [
                  'assets/image.png',
                  'assets/image.png',
                  'assets/image.png',
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Bunner(
                    color: MyColors.yellow,
                    edgeInsets: AppStyle.edgeInsetsForSmallButton,
                    title: 'скидка',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Bunner(
                    color: MyColors.bunnerLightBlueColor,
                    edgeInsets: AppStyle.edgeInsetsForSmallButton,
                    title: '-16%',
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  LikeWidget(
                    onTap: () => setLike(true),
                    color: isHasLike
                        ? MyColors.primaryColor
                        : MyColors.mainTextColor,
                    text: '$likes',
                  ),
                  const SizedBox(width: 10),
                  DisLikeWidget(
                    onTap: () => setLike(false),
                    color: isHasDisLike
                        ? MyColors.primaryColor
                        : MyColors.mainTextColor,
                    text: '$disLikes',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Артикул: МТ-00000934',
                style: ext.t5,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Концентрат мозговая активность с аминокислотой, l-теанином алтайские традиции, 60 капсул',
                style: ext.t2,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Bunner(
                      color: MyColors.bunnerLightBlueColor,
                      edgeInsets: AppStyle.edgeInsetsForMediumButton,
                      title: 'Бесплатная доставка при заказе от 2500 ₽',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Bunner(
                      color: MyColors.bunnerLightBlueColor,
                      edgeInsets: AppStyle.edgeInsetsForMediumButton,
                      title: 'Гарантия качества на весь ассортимент',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomTabBar(
                  tabController: _tabController,
                  tabNames: const [
                    'Описание',
                    'Состав',
                    'Производитель',
                    'Отзывы(17)',
                  ],
                  callback: () {
                    setState(() {});
                  }),
              const SizedBox(height: 15),
              IndexedStack(
                index: _tabController.index,
                children: _views,
              ),
              const SizedBox(height: 30),
              BunnerConsultation(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Похожие товары',
                    style: ext.h1,
                  ),
                  SmallButton(onPressed: () {}, title: 'Все'),
                ],
              ),
              const SizedBox(height: 15),
              WidgetsCarusel(
                widgets: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Expanded(
                        child: SimilarProduct(
                          currentPrice: '150',
                          discount: '50',
                          image: 'assets/images/cookies.png',
                          oldPrice: '200',
                          text:
                              'Протеиновое печенье Солёная карамель без сахара Sporty Protein  Light,',
                        ),
                      ),
                      Expanded(
                        child: SimilarProduct(
                          currentPrice: '150',
                          discount: '50',
                          image: 'assets/images/bootle.png',
                          oldPrice: '200',
                          text:
                              'Протеиновое печенье Солёная карамель без сахара Sporty Protein  Light,',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: SimilarProduct(
                          currentPrice: '150',
                          discount: '50',
                          image: 'assets/images/cookies.png',
                          oldPrice: '200',
                          text:
                              'Протеиновое печенье Солёная карамель без сахара Sporty Protein  Light,',
                        ),
                      ),
                      Expanded(
                        child: SimilarProduct(
                          currentPrice: '150',
                          discount: '50',
                          image: 'assets/images/bootle.png',
                          oldPrice: '200',
                          text:
                              'Протеиновое печенье Солёная карамель без сахара Sporty Protein  Light,',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: SimilarProduct(
                          currentPrice: '150',
                          discount: '50',
                          image: 'assets/images/cookies.png',
                          oldPrice: '200',
                          text:
                              'Протеиновое печенье Солёная карамель без сахара Sporty Protein  Light,',
                        ),
                      ),
                      Expanded(
                        child: SimilarProduct(
                          currentPrice: '150',
                          discount: '50',
                          image: 'assets/images/bootle.png',
                          oldPrice: '200',
                          text:
                              'Протеиновое печенье Солёная карамель без сахара Sporty Protein  Light,',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: paddingBottom),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: paddingBottom,
            width: mediaQuery.width,
            child: BottomBuner(
              onInBag: increment,
              isLowPrice: true,
              isShowPrice: true,
              oldPrice: '150',
              counter: quantityInCart,
              isInBag: isInBag,
              decrement: decrement,
            ),
          ),
        ),
      ],
    );
  }
}
