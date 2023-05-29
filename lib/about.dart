import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final String url = 'https://sites.google.com/student.upnyk.ac.id/istian-cv/'; // Ganti dengan URL halaman web yang diinginkan

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('About'),),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 25,),
                //Nama Foto sebagai Profile
                Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Halo, Selamat Datang!',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Istian Muhammad",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('https://scontent.fjog3-1.fna.fbcdn.net/v/t1.18169-9/1517655_1381513455447665_297763382_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=00RALjZNnLQAX_82lnV&_nc_oc=AQlIZeLFSj0Gqszjxxqtqi3cW_N6zCSdBvYRaxE7Ly5bfdHewclFC2IdnLCp00bM_YE&_nc_ht=scontent.fjog3-1.fna&oh=00_AfAp0ylDzIpIABgMGGRa5nhy6fqIxawQK1OTlZFjm9YvTA&oe=649B8000'),
                                fit: BoxFit.contain
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                //detail user
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue[100],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage('https://scontent.fjog3-1.fna.fbcdn.net/v/t1.18169-9/1011232_1380873935511617_406166614_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Dctj_vxbD8QAX_4m41i&_nc_ht=scontent.fjog3-1.fna&oh=00_AfDwL3APGOPkdXcKjh4oDjPt_uCkchfEKIJ6Lf28Zrxnvw&oe=649BABBC'),
                                  fit: BoxFit.fitWidth
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )
                          ),
                        ),
                        SizedBox(width: 20),

                        //detail nim dll
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ) ,
                              'Istian Muhammad WS',
                            ),

                            SizedBox(height: 10),
                            Text('123190107 | TPM B'),

                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: _launchURL,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[700],
                                ),
                                child: Center(
                                  child: Container(
                                      child: Text(
                                        'Kenal lebih dekat!',
                                        style: TextStyle(color: Colors.white),
                                      )
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25),

              ],
            ),
          ) ,
        )
    );
  }

}
