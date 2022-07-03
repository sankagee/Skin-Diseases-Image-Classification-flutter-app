import 'package:flutter/material.dart';

// Main Function Start

// Main Function Ends

// First Stateless Widget with MaterialApp Start
class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}
// First Stateless Widget with MaterialApp Ends

// Main Stateful Widget Start
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // Title List Here
  var titleList = [
    "Atopic dermatitis",
    "Shingles",
    "Hives",
    "Sunburn",
    "Contact Dermatitis",
    "Rosacea",
    "Athlete's Foot "
  ];

  // Description List Here
  var descList = [
    "Atopic dermatitis is one of the most common forms of eczema seen in children."
        " The exact cause of atopic dermatitis is not known, but researchers believe it may involve genetics, "
        "the environment, and/or the immune system. \n \n Symptom :- The main symptom is a rash that typically appears on the arms and behind the knees, but can"
        " also appear anywhere.\n \n Treatment depends on severity :- treatment includes avoiding soap and other irritants. Certain creams or ointments also may provide relief from the itching.",
    "Shingles causes a painful rash that may appear as a stripe of blisters on the trunk of the body. Pain"
        " can persist even after the rash is gone (this is called postherpetic neuralgia). \n \n Symptom :- painful red blister rash in linear distribution, burning sensation, fatigue, or itching.oversensitivity or pins and needles",
    "Hives is a common skin rash triggered by many things including certain foods, medications, and stress.\n \n Symptoms :- include itchy, raised, red, or skin-colored welts on the skin's surface.Hives usually go away without treatment, but antihistamine medications are often helpful in improving symptoms.",
    "Repeated exposure increases the risk of other conditions such as wrinkles, dark spots, and skin cancer. \n \n Symptoms :- include red, painful, itchy skin that's hot to the touch. Skin may also blister.Treatment includes pain relievers and creams to relieve itching.",
    "The substance might irritate the skin or trigger an allergic reaction. Some common culprits include soap, cosmetics, fragrances, jewelry, and poison ivy.\n \n Symptom :- The main symptom is a red rash wherever the skin came into contact with the irritant.Avoiding the irritant or allergen should allow the rash to clear in two to four weeks. Creams or medications can help reduce itching.",
    "Rosacea most commonly affects middle-aged women with fair skin. It can be mistaken for acne or other skin conditions.\n \n Symptoms :- are facial redness with swollen red bumps and small visible blood vessels.Treatments such as antibiotics or anti-acne medications can control and reduce symptoms. Left untreated, it tends to worsen over time.",
    "Athlete's foot commonly occurs in people whose feet have become very sweaty while confined within tight-fitting shoes.\n \n Symptoms :- include a scaly rash that usually causes itching, stinging, and burning. People with athlete's foot can have moist, raw skin between their toes.Treatment involves topical antifungal medications."
  ];

  // Image Name List Here
  var imgList = [
    "assets/new/im1.jpg",
    "assets/new/im2.jpg",
    "assets/new/im3.jpg",
    "assets/new/im4.jpg",
    "assets/new/im5.jpg",
    "assets/new/im6.jpg",
    "assets/new/im7.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style:
                            TextStyle(fontSize: 15, color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(5),
            height: 520,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 12,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
