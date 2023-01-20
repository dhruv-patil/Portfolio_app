import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio1/home.dart';
import 'package:portfolio1/projects.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Soho'),
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/project': (context) => MyProject(),
      '/': (context) => MyHome(),
      '/about': (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _makingPhoneCall() async {
    var call = Uri.parse("tel:7400336252");
    if (await canLaunchUrl(call)) {
      await launchUrl(call);
    } else {
      throw 'Could not launch $call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assests/pic1.png',
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.55),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hello I am',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Dhruv Patil',
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Software Developer',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: _makingPhoneCall,
                      child: Text('Hire me'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white, // Background Color
                      ),
                    ),
                    width: 120,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async {
                            final uri = Uri.parse('https://instagram.com/dhruv_patil_music?igshid=YmMyMTA2M2Y=');

                             await canLaunchUrl(uri)? await launchUrl(uri) :  print ("get good url");
                          },
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            final uri = Uri.parse('https://www.linkedin.com/in/dhruv-patil-a2558215b/');

                            await canLaunchUrl(uri)? await launchUrl(uri) :  print ("get good url");
                          },
                          icon: Icon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            final uri = Uri.parse('https://github.com/dhruv-patil');

                            await canLaunchUrl(uri)? await launchUrl(uri) :  print ("get good url");
                          },
                          icon: Icon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                          )),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       FontAwesomeIcons.twitter,
                      //       color: Colors.white,
                      //     )),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       FontAwesomeIcons.facebook,
                      //       color: Colors.white,
                      //     ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
