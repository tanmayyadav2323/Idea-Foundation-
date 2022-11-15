import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco/config/session_helper.dart';
import 'package:preco/ui/gallery_nav_screen.dart';
import 'package:preco/ui/program_info_page.dart';
import 'package:preco/ui/video_screen.dart';
import 'package:preco/ui/youtube_videos.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blocs/auth/auth_bloc.dart';
import '../login/login_cubit/login_cubit.dart';

class NavScreen extends StatefulWidget {
  static const routename = '/navscreen';

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routename),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (context, _, __) => NavScreen());
  }

  NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hey"),
                          Text(
                            SessionHelper.displayName.toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(AuthLogoutRequested(context: context));
                            context.read<LoginCubit>().logoutRequested();
                          },
                          icon: Icon(Icons.logout))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: imageSliders,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://umanganinitiativebyideafoundation.co.in/');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQttGoeemmgziEC7tPx9f62i3XS2DbZkcZVHw&usqp=CAU"),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryNavScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://static-s.aa-cdn.net/img/gp/20600004392163/JRiXMoJZE5lKvNmI6beVk73CYXouvFA1jceM5-16fLvEisZy4qsEbk8LZl4I7ONLyw=s300?v=1"),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.animaker.com/blog/wp-content/uploads/2014/03/beginners-guide-to-animated-video-making.jpg"),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await launch(
                              "https://ideafoundation.org.in/index.php/donate-now/");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/previews/004/327/955/original/donation-box-throwing-hearts-in-a-box-for-donations-donate-giving-money-and-love-concept-of-charity-give-and-share-your-love-with-people-humanitarian-volunteer-activity-vector.jpg"),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Core Programs",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      programWidget(
                          "We are working extensively to educate underprivileged children with a focus on improving their fundamental learning skills in Reading, Writing, Comprehension, Languages and Maths.  We run ‘Play & Learn Centers’ for 1st to 4th std. and ‘Study Centers’ for 5th to 7th std. in underprivileged urban, rural, tribal, and migrant communities. Through Activity Based Learning (ABL) using various educational aids, we want to ensure Holistic Development for marginalized children.",
                          "https://ideafoundation.org.in/wp-content/uploads/2021/08/WhatsApp-Image-2021-02-01-at-4.25.06-PM-1024x768.jpeg",
                          "utkarsh"),
                      programWidget(
                          "Many children are not able to continue education in high school. They are not getting proper career guidance and their families are not able to afford their education. Programme UDAAN was started to provide educational sponsorship to children, especially to girls who attended our study centres. We identify children in dire need and give them financial support to pay their school/college fees and provide books, required stationaries and uniforms. We also organize Life skill sessions, Career counselling, Spoken English classes, Personality development classes, Digital Literacy and Exposure visits for the sponsored children. Community youth clubs are formed in different localities to encourage leadership qualities among the youth as they become the role models and the changemakers in their communities. These clubs are equipped with WiFi enabled PCs, reference books where children can involve in self-learning, group learning and spend quality time.",
                          "https://ideafoundation.org.in/wp-content/uploads/2019/01/fe42f86d-317d-4ae2-ac76-591e53153659-700x394.jpg",
                          "uddan"),
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      programWidget(
                          "ASHAKIRAN is an attempt to empower underprivileged women with vocational skills which can help them make a living. These women could not complete formal education because of various reasons, but mainly because they get married at an early age. We conduct Tailoring courses, Beauty Care courses, Cooking and Catering classes and short-term classes like art and craft.  After completing these courses many women have started earning a decent supplementary income, some even started their own enterprises.",
                          "https://ideafoundation.org.in/wp-content/uploads/2019/01/Tailoring-Batch-Bhor-Indiranagar.jpg",
                          "ASHAKIRAN"),
                      programWidget(
                          "Through this program, we help women who have completed skilling programs to start earning. In the 6 days EDP training, various sessions on topics like entrepreneurial qualities, market demand, selecting a trade, making a business plan, branding, micro-finance, record and inventory management, Govt. laws are taught through interesting and innovative methods like skits, role play, presentations and case studies. To run a business, along with financial and business acumen, soft skills are also required. Hence the programme also includes sessions on Communication skills, digital literacy, inter-personal skills and consumer behaviour.",
                          "https://ideafoundation.org.in/wp-content/uploads/2022/04/EDP-group-Ativity-1024x684.jpg",
                          "UNNATI"),
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      programWidget(
                          "Our e-Sakshar program is an effort to complement government’s vision to transform one person from each household as digitally literate, so that each household is ready to interact with the digital world. We have been successful in teaching digital skills to thousands of our beneficiaries who can now manage online bank transactions, ticket booking and filling up school or college applications. Beneficiaries from our skilling programmes are also encouraged to complete the NDLM program as an added skill which they can use hands on.The objective is to make at least one member form every family computer literate and to help our beneficiaries make use of internet to ease their daily lives.",
                          "https://ideafoundation.org.in/wp-content/uploads/2019/01/6.jpg",
                          "eSakshar"),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '"IDEA’s vision is a just society where individuals have access to equal opportunity. Our mission is to create equal opportunities for the underprivileged sections of society for their all-round development."',
                    style: TextStyle(
                        fontSize: 25, color: Colors.black.withOpacity(0.4)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  programWidget(String info, String link, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PorgramInfoPage(
                    info: info,
                    link: link,
                    name: name,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(link),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.5),
            ),
            height: 150,
            width: 150,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            name.toUpperCase(),
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

final imglst = [
  'assets/images/db_image1.jpg',
  'assets/images/db_image2.jpg',
  'assets/images/db_image3.jpg',
  'assets/images/db_image4.jpg',
  'assets/images/db_image5.jpg',
];
final List<Widget> imageSliders = imglst
    .map((item) => GestureDetector(
          onTap: () {
            launch(
                'https://idea-foundation.danamojo.org/dm/?utm_campaign=qrcode');
          },
          child: Container(
            height: 500,
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, height: 1000),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'Donate Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
