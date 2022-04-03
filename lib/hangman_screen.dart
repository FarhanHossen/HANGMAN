import 'dart:math';

import 'package:flutter/material.dart';

class HangmanScreen extends StatefulWidget {
  const HangmanScreen({ Key? key }) : super(key: key);

  @override
  State<HangmanScreen> createState() => _HangmanScreenState();
}

class _HangmanScreenState extends State<HangmanScreen> {
  Random random = Random();

  // Variables
  int countLetter = 0;
  int countWrongWord = 0;
  int hangmanCount = 0;
  int spaceCount = 0;
  static int winningDecider = 0;
  int score = 0;
  static int highScore = 0;


  //Data
  var hangman = ["H","A","N","G","M","A","N"];
  var types = ["Actor","Actress","Band","Bird","Continent","Country","Cricketer","Fish","Flower","Fruit","Footballer","Language","Movie","Ocean","Planet","Religion","River","Scientist","Series","Sport","Vehicle","Video Game","Wild Animal"];
  var actor = ["Aaron Paul","Adivi Sesh","Ajith Kumar","Akhil Akkineni","Akshay Kumar","Allu Arjun","Alvaro Morte","Arjun Sarja","Arun Vijay","Andrew Garfield","Ankush Hazra","Aayush Sharma","Chris Evans","Chris Hemsworth","Cillian Murphy","Dhanush","Dulquer Salmaan","Dwayne Johnson","Hrithik Roshan","Jackie Chan","Jaime Lorente","Jeet","Jeremy Renner","Johnny Depp","Kartik Aaryan","Leonardo Dicaprio","Mahesh Babu","Miguel Herran","Mohanlal","Nagarjuna","Naga Chaitanya","Nakuul Mehta","Nani","Nithin","NTR Jr","Pawan Kalyan","Pedro Gonzalez Alonso","Prabhas","Prince Narula","Ram Charan","Ram Kapoor","Ram pothineni","Rannvijay Singha","Robert Downey Jr.","Ryan Reynolds","Sai Dharam Tej","Saif Ali Khan","Shahid Kapoor","Shah Rukh Khan","Sushant Singh Rajput","Suriya","Tobey Maguire","Tom Cruise","Tom Holland","Thalapathy Vijay","Vidyut Jammwal","Vijay Deverakonda","Vikram Chatterjee","Vin Diesel","Yash"];
  var actress = ["Jacqueline Fernandez","Anushka Sharma","Shraddha Kapoor","Sara Ali Khan","Kajal Aggarwal","Kiara Advani","Kriti Sanon","Shruti haasan","Yami Gautam","Riya Sen","Asin Thottumkal","Amrita Rao","Rimi Sen","Shriya Saran","Daisy Shah","Sana Khaan","Sunny Leone","Nayantara","Nitya Menon","Rakul Preet Singh","Keerthi Suresh","Rashmika Mandana","Malvika Sharma","Kriti Kharbanda","Regina Cassandra","Catherine Tresa","Malvika Mohann","Ananya Pandey","Pragya Jaiswal","Anushka Sharma","Pooja Hegde","Amritha Aiyer","Scarlett Johansson","Elizabeth Olsen","Kate Winslet","Carol Danvers","Ashnoor Kaur","Paridhi Sharma","Hina Khan","Anupama Parameswaran","Jennifer Winget","Anna Hutchison","Kritika Kamra","Kanchi Singh","Hebah Patel","Divyanka Tripathi","Koushani Mukherjee","Mimi Chakraborty","Tanjin Tisha","Sabila Nur","Ishita Dutta","Urvashi Rautela","Mouni Roy","Shivangi Joshi","Sandipta Sen","Sakshi Tanwar","Sumona Chakravarti","Asha Negi","Sonia Balani","Itziar Ituno"];
  var band = ["Artcell","Shunno","Odd Signature","Warfaze","Bay Of Bengal","Shironamhin","Ashes","Moruvumi","Old School","Recall","Encore","Shohortoli","The Beatles","Pink Floyd","Linkin Park","Aurthohin","Nemesis","Arbovirus","Backstreet Boys","Green Day"];
  var bird = ["Pigeon","Peacock","Parrot","Sparrow","Woodpecker","Owl","Kingfisher","Crow","Kite","Eagle","Swan","Bat","Ostrich","Dove","Crane","Duck","Robin","Penguin","Hummingbird","Turkey","Flamingo","Gull","Rooster","Vulture","Hornbill","Nightingale","Mynah","Hen","Egyptian Vulture","Duckling","Cuckoo","Chick","Quail","Pewit","Wagtail","Weaver","Tailorbird","Swallow","Peregrine Falcon","Pelican","Stork","Skylark","Seagull","Sandpipe","Raven","Partridge","Osprey","Falcon","Kiwi","Lark","Heron","Hoopoe","Hawk Cuckoo","Great Egret","Goose","Eurasian Hobby","Eider","Drake","Cockatoo","Avocet","Chukar","Cock","Cygnet","Gander","Grebe","Canary","Cormorant","Partridge","Goldfinch","Goose","Hoatzin","Kestrel","Kingfisher","Macaw","Magpie","Peacock","Pheasant","Oriole","Raven","Doel"];
  var continent = ["Asia","Africa","Europe","North Amercia","South America","Australia","Antarctica"];
  var country = ["Afghanistan","Argentina","Australia","Austria","Algeria","Bangladesh","Belgium","Bhutan","Brazil","Bulgaria","Canada","Chile","China","Colombia","Cambodia","Costa Rica","Croatia","Cuba","Denmark","East Timor","Egypt","Finland","France","Germany","Ghana","Greece","Greenland","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Ivory Coast","Japan","Jordan","Kazakhstan","Kenya","North Korea","South Korea","Kuwait","Liberia","Libya","Luxembourg","Macau","Madagascar","Malaysia","Maldives","Mauritius","Mexico","Mongolia","Montserrat","Morocco","Myanmar","Namibia","Nepal","Netherlands","New Zealand","Nigeria","Norway","Oman","Pakistan","Panama","Peru","Philippines","Poland","Portugal","Qatar","Romania","Saudi Arabia","Yemen","Singapore","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Sweden","Switzerland","Syria","Tajikistan","Thailand","Turkey","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vatican City","Venezuela","Vietnam","Zimbabwe"];
  var cricketer = ["Donald Bradman","Sachin Tendulkar","Garfield Sobers","Imran Khan","Ian Botham","Shane Warne","Viv Richards","Brian Lara","Jaques Kallis","MS Dhoni","Wasim Akram","Virat Kohli","James Anderson","Alastair Cook","Muttiah Muralitharan","Kumar Sangakkara","Kapil Dev","Richard Hadlee","Adam Gilchrist","Chris Gayle","Glenn McGrath","Ricky Ponting","Steve Waugh","Rahul Dravid","Sunil Gavaskar","Shoaib Akhtar","Curtly Ambrose","Mahela Jayawardene","Dale Steyn","Allan Donald","AB de Villiers","David Warner","Yuvraj Singh","Hashim Amla","Phillip Hughes","Brendon McCullum","Sourav Ganguly","Glenn Maxwell","Jasprit Bumrah","Eoin Morgan","Dwayne Bravo","Suresh Raina","Ravindra Jadeja","Kieron Pollard","Matthew Hayden","Harbhajan Singh","Shane Watson","Brett Lee","Shahid Afridi","Ross Taylor","Mohammad Ashraful","Mashrafe Bin Mortaza","Shakib Al Hasan","Mustafizur Rahman","Mushfiqur Rahim","Tamim Iqbal","Taskin Ahmed","Soumya Sarkar","Mohammad Mahmudullah","Imrul Kayes"]; 
  var fish = ["Albacore Tuna","Alligator Gar","Baiji","Barracuda","Basking Shark","Blue Shark","Butterfly Fish","Carp","Catfish","Clownfish","Dragonfish","Drum Fish","Eel","Electric Eel","Flying Fish","Goldfish","Grass Carp","Great White Shark","Greenland Shark","Grey Reef Shark","Hagfish","Hammerhead Shark","Jellyfish","Koi Fish","Krill","Lake Sturgeon","Lionfish","Lungfish","Megalodon","Oyster Toadfish","Paddlefish","Piranha","Salmon","Skate Fish","Squirrelfish","Starfish","Tiger Shark","Lobster","Red Snapper","Ilish"]; 
  var flower = ["Wallflower","Water lily","Violet","Tulip","Tuberose","Sunflower","Star of Bethlehem","Rosemary","Rose","Quesnelia","Primrose","Persian Candytuft","Osmunda","Ophrys","Nightshade","Marshmallow","Marigold","Laurel","Jessamine","Ipomea","Hibiscus","Gilliflower","Dandelion","Dahlia","Bluebottle","Bellflower","Barberry","Angelica","Aster","Aspen"];
  var fruit = ["Apple","Acerola","Banana","Blackberry","Blueberry","Carambola","Cherry","Coconut","Date","Grapes","Jack Fruit","Lemon","Lychee","Mango","Olive","Mandarin","Orange","Papaya","Pear","Pineapple","Raspberry","Strawberry","Watermelon","Tamarind","Pummelo","Pomegranate","Dragonfruit","Mangosteen","Longan","Loquat"];
  var footballer = ["Cristiano Ronaldo","Lionel Messi","Neymar","Andres Iniesta","David Villa","Fernando Torres","Sergio Ramos","Luka Modric","Paul Pogba","Kylian Mbappe","Wayne Rooney","Xavi","Ronaldinho","Pele","Mesut Ozil","Thomas Muller","Toni Kroos","Gareth Bale","Marcelo Vieira","Manuel Neuer","David de Gea","Iker Casillas","Karim Benzema","Nani","Mohamed Salah"];
  var language = ["Arabic","French","Spanish","Portuguese","Italian","German","Chinese","Dutch","Bosnian","Turkish","Bengali","Urdu","Hindi","English","Russian","Japanese","Telugu","Marathi","Korean","Tamil"];
  var movie = ["Kabhi Khushi Kabhi Gum","Kal Ho Na Ho","Drishyam","Raid","Players","Main Hoon Na","R Rajkumar","Krish","Dhoom","Don","Master","Saaho","Bahubali","Radhe Shyam","Happy New Year","Fast And The Furious","Need For Speed","6 Undergrounds","Joker","Avengers","Death Race","Iron Fist","Iron Man","Captain America","Interstellar","Spider Man","Batman","Deadpool","Vivah","Captain Marvel"];
  var ocean = ["Arctic","Southern","Indian","Atlantic","Pacific"];
  var planet = ["Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune"];
  var religion = ["Christianity","Islam","Hinduism","Buddhism","Sikhism","Judaism"];
  var river = ["Yangtze","Mississippi","Yenisey","Yellow","Ob","Parana","Congo","Amur","Nile","Volga","Danube","Zambezi","Mekong","Hudson","St. Lawrence","Padma","Meghna","Jamuna","Bhairab","Karnaphuli"];
  var scientist = ["Hippoocrates","Aristotle","Archimedes","Galen","Leonardo Da Vinci","Nicolaus Copernicus","Galileo","Pascal","Newton","Edward Jenner"];
  var series = ["Money Hiest","Sacred Games","Game Of Thrones","Breaking Bad","Friends","Sex And The City","The Prisoner","Prison Break","The Walking Dead","THe Big Bang Theory","Vikings","Daredevil","Narcos","Marco Polo","Peaky Blinders","Marco Polo","Attack on Titan","One Piece","Naruto","That Time I Got Reincarnated as a Slime"];
  var sport = ["Football","Badminton","Cricket","Tennis","Table Tennis","Basketball","Baseball","Volleyball","Golf","Swimming","Boxing","Rugby","Pool","Darts","Bowling","Cycling","Karate","Archery","Chess","Cards"]; 
  var vehicle = ["Ambulance","Bulldozer","Express Train","Ferry","Hydroplane","Lorry","Motorboat","Pickup Truck","Rickshaw","Submarine","Boat","Launch","Ship","Speed Boat","Metro TRain"];  
  var videoGame = ["CALL OF DUTY","MODERN WARFARE","CLASH OF CLANS","FIFA","SNIPER ELITE","GRAND THEIR AUTO","CLASH ROYALE","ASPHALT","NEED FOR SPEED","FORTNITE","PUBG MOBILE","VALORANT","COUNTER STRIKE","SUBWAY SURF","TAKEN 5","POKEMON GO","MINI MILITIA","BOOM BEACH","GUNS OF BOOM","HILL CLIMB"];
  var wildAnimal = ["Walrus","Leopard","Chimpanzee","Raccoon","Kangaroo","Hippopotamus","Gorilla","Monkey","Giraffe","Elephant","Lion","Tiger","Fox","Zebra","Wolf"];
  var input = "";


  @override
  Widget build(BuildContext context) {

    // Type Choose
    var typeSelection = types[random.nextInt(23)];
    var choosenType;
    var choosenWord;
    switch (typeSelection) {
      case "Actor": 
        choosenType = actor;
        choosenWord = choosenType[random.nextInt(60)].toUpperCase();
        break; 
      case "Actress": 
        choosenType = actress;
        choosenWord = choosenType[random.nextInt(60)].toUpperCase();
        break;
      case "Band": 
        choosenType = band;
        choosenWord = choosenType[random.nextInt(20)].toUpperCase();
        break;
      case "Bird": 
        choosenType = bird;
        choosenWord = choosenType[random.nextInt(80)].toUpperCase();
        break;
      case "Continent": 
        choosenType = continent;
        choosenWord = choosenType[random.nextInt(7)].toUpperCase();
        break;
      case "Country": 
        choosenType = country;
        choosenWord = choosenType[random.nextInt(100)].toUpperCase();
        break;
      case "Cricketer": 
        choosenType = cricketer;
        choosenWord = choosenType[random.nextInt(60)].toUpperCase();
        break;
      case "Fish": 
        choosenType = fish;
        choosenWord = choosenType[random.nextInt(40)].toUpperCase();
        break;
      case "Flower": 
        choosenType = flower;
        choosenWord = choosenType[random.nextInt(30)].toUpperCase();
        break;
      case "Fruit": 
        choosenType = fruit;
        choosenWord = choosenType[random.nextInt(30)].toUpperCase();
        break;
      case "Footballer": 
        choosenType = footballer;
        choosenWord = choosenType[random.nextInt(25)].toUpperCase();
        break;
      case "Language": 
        choosenType = language;
        choosenWord = choosenType[random.nextInt(20)].toUpperCase();
        break;
      case "Movie": 
        choosenType = movie;
        choosenWord = choosenType[random.nextInt(30)].toUpperCase();
        break;
      case "Ocean": 
        choosenType = ocean;
        choosenWord = choosenType[random.nextInt(5)].toUpperCase();
        break;
      case "Planet": 
        choosenType = planet;
        choosenWord = choosenType[random.nextInt(8)].toUpperCase();
        break;  
      case "Religion": 
        choosenType = religion;
        choosenWord = choosenType[random.nextInt(6)].toUpperCase();
        break;
      case "River": 
        choosenType = river;
        choosenWord = choosenType[random.nextInt(20)].toUpperCase();
        break;
      case "Scientist": 
        choosenType = scientist;
        choosenWord = choosenType[random.nextInt(10)].toUpperCase();
        break;
      case "Series": 
        choosenType = series;
        choosenWord = choosenType[random.nextInt(20)].toUpperCase();
        break;
      case "Sport": 
        choosenType = sport;
        choosenWord = choosenType[random.nextInt(20)].toUpperCase();
        break;  
      case "Vehicle": 
        choosenType = vehicle;
        choosenWord = choosenType[random.nextInt(15)].toUpperCase();
        break; 
      case "Video Game": 
        choosenType = videoGame;
        choosenWord = choosenType[random.nextInt(20)].toUpperCase();
        break; 
      case "Wild Animal": 
        choosenType = wildAnimal;
        choosenWord = choosenType[random.nextInt(15)].toUpperCase();
        break;
      default:
    }

    //Word Choose
    List<String> word = choosenWord.split("");
    var wordArray = List.filled(word.length, choosenWord);
    var space = ' ';

    for (int i = 0; i < word.length ; i++) {
      if (word[i] == space){
        wordArray[i] =  "  " ;
        spaceCount++;
      }
      else {
        wordArray[i] = "_ ";
      }
    }

    // Taking Input And Others

    var newHangman = List.filled(hangman.length, choosenWord);

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text("             ℍ𝔸ℕ𝔾𝕄𝔸ℕ",
        style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20,),
          Text("           W O R D    T Y P E           ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.teal.shade900,),),
          const SizedBox(height: 20,),
          Text("$typeSelection",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
          //Only For Test
          const SizedBox(height: 20,),
          Text("$word",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
          //End Test

          // Printing Dash
          const SizedBox(height: 20,),
          Wrap(
            children: <Widget>[
              const TextField(
                keyboardType: TextInputType.text,
              ),
              for(int i = 0 ; i < word.length ; i++)
              Text(wordArray [i],textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),)])
      ]),
    );
  }
}