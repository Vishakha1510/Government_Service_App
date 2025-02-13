import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:government_service_app/screens/bookmark_screen.dart';
import 'package:provider/provider.dart';
import '../providers/connection_provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Map<String, dynamic>> allServices = [
    {
      "title": "Aadhaar",
      "logo":
          "https://upload.wikimedia.org/wikipedia/hi/thumb/c/cf/Aadhaar_Logo.svg/1200px-Aadhaar_Logo.svg.png",
      "url": "https://uidai.gov.in/",
    },
    {
      "title": "Parivahan",
      "logo":
          "https://c.ndtvimg.com/2021-12/d8kk2gj8_car_625x300_27_December_21.jpg",
      "url": "https://parivahan.gov.in/parivahan/en",
    },
    {
      "title": "DigiLocker",
      "logo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/DigiLocker.svg/2560px-DigiLocker.svg.png",
      "url": "https://www.digilocker.gov.in/",
    },
    {
      "title": "Passport Seva",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbjzR-IOOxDV9K32yNxRKyly378PmovfqJeA&s",
      "url": "https://www.passportindia.gov.in/",
    },
    {
      "title": "PM Kisan",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD2egnjREv0XKBVBBjsBiTzhVthg4IHXBoqA&s",
      "url": "https://pmkisan.gov.in/",
    },
    {
      "title": "eCourt India",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUlT6vmwdLZAy6HpKPiE-dL-fG8tcnFQj-CQ&s",
      "url": "https://ecourts.gov.in/",
    },
    {
      "title": "GST India",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXqGxIUdZv5ZLx9xmPJVTAAG3iIRWnSkbk7A&s",
      "url": "https://www.gst.gov.in/",
    },
    {
      "title": "National Voter Services",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4ZhvqKcmbfNGYLqDP6wqy7SqvangPYMDP5A&s",
      "url": "https://www.nvsp.in/",
    },
    {
      "title": "Railway Reservation",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnNYrYwPXW5ptMjr14l9vjX-8kkpZxtYBF4w&s",
      "url": "https://www.irctc.co.in/",
    },
    {
      "title": "UMANG",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3yH3mFakcx2gj9gOJVNvSDOkjE90pi6MjgQ&s",
      "url": "https://web.umang.gov.in/",
    },
    {
      "title": "Ayushman Bharat",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdI6azx67qNlU-FTOCZk9Yx2ZEW7V5hARZiQ&s",
      "url": "https://abdm.gov.in/",
    },
    {
      "title": "National Scholarship",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuOlw8wduZm54ejTeM14Jtvn0Fab95VLEvbw&s",
      "url": "https://scholarships.gov.in/",
    },
    {
      "title": "Swachh Bharat",
      "logo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPoj3olOSRY0mRx727DByLyLpRG4DpfG9spg&s",
      "url": "https://swachhbharatmission.ddws.gov.in/",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade400,
          title: Text(
            "Govt. Service App",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          actions: [
            // IconButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const BookmarkListScreen(),
            //         ),
            //       );
            //     },
            //     icon: Icon(
            //       Icons.bookmark,
            //       color: Colors.white,
            //       size: 30,
            //     ))
            PopupMenuButton(
              onSelected: (value) {
                if (value == 'Bookmark') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookmarkListScreen(),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 'Bookmark',
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Bookmark'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: (Provider.of<Internetprovider>(context).connectivityResult !=
                ConnectivityResult.none)
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: allServices.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('detail_page',
                            arguments: allServices[i]);
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              allServices[i]['logo'],
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${allServices[i]['title']}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: Text(
                "NO INTERNET CONNECTION",
                style: TextStyle(fontSize: 18),
              )));
  }
}
