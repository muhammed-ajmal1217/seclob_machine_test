import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seclob_task/controller/api_provider.dart';
import 'package:seclob_task/view/photos.dart';
import 'package:seclob_task/view/videos.dart';
import 'package:seclob_task/view/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).fetchData();
  }

  final followStyle = GoogleFonts.poppins(fontWeight: FontWeight.w500,color:Color(0xff1E3167),fontSize:20);
  final followTextStyle = TextStyle(color: Color(0xff1E3167).withOpacity(0.6));
  var gradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xff044770).withOpacity(0.2),
        Color(0xffD6EEE1).withOpacity(0.28),
      ]);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: gradient),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.share,
                          color: Color(0xff1E3167),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: gradient),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz_outlined,
                          color: Color(0xff1E3167),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Consumer<ApiProvider>(builder: (context, value, child) {
                      print(
                          '${value.datas!.map((e) => e.profilePic).toList()}');
                      final profile =
                          value.datas!.map((e) => e.profilePic).toList();
                      return profile.length == 0
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/user_1144760.png',
                                    fit: BoxFit.cover,
                                  )),
                            )
                          : SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    '${profile[0]}',
                                    fit: BoxFit.cover,
                                  )),
                            );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: SizedBox(
                        height: size.height * 0.070,
                        width: size.width * 0.53,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '50',
                                  style: followStyle,
                                ),
                                Text('Post',style: followTextStyle,)
                              ],
                            ),
                            Column(
                              children: [
                                Text('564',
                                    style:followStyle
                                        ),
                                Text('Followers',style:followTextStyle ,)
                              ],
                            ),
                            Column(
                              children: [
                                Text('564',
                                    style:
                                        followStyle),
                                Text('Following',style: followTextStyle,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Consumer<ApiProvider>(builder: (context, value, child) {
                  final name = value.datas!.map((e) => e.firstName).toList();
                  return name.isEmpty
                      ? const Text('')
                      : Text(
                          '${name[0]}',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,fontSize:18,color:Color(0xff1E3167)),
                        );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Photographer',
                  style: GoogleFonts.montserrat(color:Color(0xff1E3167),fontSize:13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '🌟You are beautiful, and\nIm here to capture it🌟',
                  style: GoogleFonts.montserrat(color:Color(0xff1E3167)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    height: size.height * 0.075,
                    width: size.width * 0.37,
                    onTap: () {},
                    name: "Edit Profile",
                    color: const Color(0xff184AC0),
                  ),
                  CustomButton(
                    height: size.height * 0.075,
                    width: size.width * 0.37,
                    onTap: () {},
                    name: "Wallet",
                    color: const Color(0xff28426B),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                        height: size.height * 0.065,
                        width: size.width * 0.13,
                        decoration: BoxDecoration(
                            color: const Color(0xff184AC0).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
               TabBar(
                labelStyle: GoogleFonts.montserrat(fontWeight:FontWeight.w600,color:Color(0xffA7ACD0)),
                indicatorColor: Color(0xffA7ACD0),
                labelColor: Color(0xffA7ACD0),
                tabs: [
                Tab(
                  text: 'Photos',
                ),
                Tab(
                  text: 'Videos',
                )
              ]),
              const Expanded(
                  child: TabBarView(children: [PhotosScreen(), VideoScreen()]))
            ],
          ),
        ),
      ),
    );
  }
}
