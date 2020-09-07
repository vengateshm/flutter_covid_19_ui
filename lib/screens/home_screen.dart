import 'package:flutter/material.dart';
import 'package:flutter_app_covid19/constants/constants.dart';
import 'package:flutter_app_covid19/screens/detail_screen.dart';
import 'package:flutter_app_covid19/widgets/info_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: cPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                InfoCard(
                  title: 'Confirmed Cases',
                  effectedNum: 1062,
                  iconColor: Color(0xffff8c00),
                  onTap: () {},
                ),
                InfoCard(
                  title: 'Total Death',
                  effectedNum: 75,
                  iconColor: Color(0xffff2d55),
                  onTap: () {},
                ),
                InfoCard(
                  title: 'Total Recovered',
                  effectedNum: 689,
                  iconColor: Color(0xff50e3c2),
                  onTap: () {},
                ),
                InfoCard(
                  title: 'New Cases',
                  effectedNum: 52,
                  iconColor: Color(0xff5856d6),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen()));
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preventions',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPrevention(),
                  SizedBox(
                    height: 40,
                  ),
                  _buildHelpCard(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            // Left side padding is 40% of total width
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.4,
                top: 20.0,
                right: 20.0),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff60be93), Color(0xff1b8d59)]),
                borderRadius: BorderRadius.circular(20.0)),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Dial 999 for\nMedical Help!\n',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                        )),
                TextSpan(
                    text: 'If any symptoms appear',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    )),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
              top: 30,
              right: 10,
              child: SvgPicture.asset('assets/icons/virus.svg'))
        ],
      ),
    );
  }

  Row _buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionWidget(
          svgSrc: 'assets/icons/hand_wash.svg',
          title: 'Wash Hands',
        ),
        PreventionWidget(
          svgSrc: 'assets/icons/use_mask.svg',
          title: 'Use Masks',
        ),
        PreventionWidget(
          svgSrc: 'assets/icons/Clean_Disinfect.svg',
          title: 'Clean Disinfect',
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: cPrimaryColor.withOpacity(0.03),
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/search.svg'),
        ),
      ],
    );
  }
}

class PreventionWidget extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionWidget({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: cPrimaryColor),
        )
      ],
    );
  }
}
