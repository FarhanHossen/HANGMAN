import 'dart:math';

//Data
var typesE = [
  "Actor",
  "Actress",
  "Bird",
  "Continent",
  "Country",
  "Language",
  "Ocean",
  "Planet",
  "Video Game"
];
var typesM = [
  "Actor",
  "Actress",
  "Band",
  "Bird",
  "Fruit",
  "Movie",
  "Religion",
  "Sport",
  "Vehicle",
  "Wild Animal",
  "Colour"
];
var typesH = [
  "Actor",
  "Actress",
  "Bird",
  "Cricketer",
  "Fish",
  "Flower",
  "Footballer",
  "River",
  "Scientist",
  "Series"
];
var actorE = [
  "Mahesh Babu",
  "Hrithik Roshan",
  "Jackie Chan",
  "Kartik Aaryan",
  "Yash",
  "Jeet",
  "Dhanush",
  "Mohanlal",
  "Nagarjuna",
  "Nani",
  "Nithin",
  "Prabhas",
  "Suriya",
  "Tom Cruise",
  "Rannvijay Singha",
  "Shahid Kapoor",
  "Akshay Kumar",
  "Allu Arjun"
];
var actorM = [
  "Thalapathy Vijay",
  "Vidyut Jammwal",
  "Tobey Maguire",
  "Ram pothineni",
  "Naga Chaitanya",
  "Johnny Depp",
  "Chris Evans",
  "Chris Hemsworth",
  "Ajith Kumar",
  "Akhil Akkineni",
  "Vikram Chatterjee",
  "Vin Diesel",
  "Tom Holland",
  "Nakuul Mehta",
  "NTR Jr",
  "Pawan Kalyan",
  "Prince Narula",
  "Ram Charan",
  "Ram Kapoor",
  "Arjun Sarja",
  "Arun Vijay",
  "Andrew Garfield",
  "Ankush Hazra",
  "Aayush Sharma",
];
var actorH = [
  "Aaron Paul",
  "Adivi Sesh",
  "Sushant Singh Rajput",
  "Shah Rukh Khan",
  "Saif Ali Khan",
  "Sai Dharam Tej",
  "Robert Downey Jr.",
  "Pedro Gonzalez Alonso",
  "Vijay Deverakonda",
  "Ryan Reynolds",
  "Miguel Herran",
  "Leonardo Dicaprio",
  "Jaime Lorente",
  "Jeremy Renner",
  "Cillian Murphy",
  "Dulquer Salmaan",
  "Dwayne Johnson",
  "Alvaro Morte",
];
var actressE = [
  "Mouni Roy",
  "Urvashi Rautela",
  "Sabila Nur",
  "Amrita Rao",
  "Rimi Sen",
  "Sana Khaan",
  "Sunny Leone",
  "Rakul Preet Singh",
  "Anushka Sharma",
  "Shraddha Kapoor",
  "Sara Ali Khan",
  "Kriti Sanon",
  "Shruti haasan",
  "Yami Gautam",
  "Riya Sen",
  "Ananya Pandey",
  "Anushka Sharma",
  "Pooja Hegde",
  "Paridhi Sharma",
  "Hina Khan",
  "Mimi Chakraborty",
  "Tanjin Tisha",
];
var actressM = [
  "Ishita Dutta",
  "Jacqueline Fernandez",
  "Kiara Advani",
  "Keerthi Suresh",
  "Rashmika Mandana",
  "Malvika Sharma",
  "Kajal Aggarwal",
  "Shriya Saran",
  "Daisy Shah",
  "Nayantara",
  "Nitya Menon",
  "Malvika Mohann",
  "Pragya Jaiswal",
  "Amritha Aiyer",
  "Kritika Kamra",
  "Kanchi Singh",
  "Hebah Patel",
  "Shivangi Joshi",
  "Sandipta Sen",
  "Sakshi Tanwar",
  "Sumona Chakravarti",
  "Asha Negi",
  "Sonia Balani",
];
var actressH = [
  "Itziar Ituno",
  "Asin Thottumkal",
  "Kriti Kharbanda",
  "Regina Cassandra",
  "Catherine Tresa",
  "Scarlett Johansson",
  "Elizabeth Olsen",
  "Kate Winslet",
  "Carol Danvers",
  "Ashnoor Kaur",
  "Anupama Parameswaran",
  "Jennifer Winget",
  "Anna Hutchison",
  "Divyanka Tripathi",
  "Koushani Mukherjee",
];
var bandM = [
  "Artcell",
  "Shunno",
  "Odd Signature",
  "Warfaze",
  "Bay Of Bengal",
  "Shironamhin",
  "Ashes",
  "Moruvumi",
  "Old School",
  "Recall",
  "Encore",
  "Shohortoli",
  "The Beatles",
  "Pink Floyd",
  "Linkin Park",
  "Aurthohin",
  "Nemesis",
  "Arbovirus",
  "Backstreet Boys",
  "Green Day"
];
var birdE = [
  "Pigeon",
  "Parrot",
  "Sparrow",
  "Woodpecker",
  "Owl",
  "Kingfisher",
  "Crow",
  "Kite",
  "Eagle",
  "Swan",
  "Bat",
  "Ostrich",
  "Dove",
  "Duck",
  "Penguin",
  "Hummingbird",
  "Turkey",
  "Flamingo",
  "Vulture",
  "Nightingale",
  "Mynah",
  "Hen",
  "Cuckoo",
  "Quail",
  "Wagtail",
  "Tailorbird",
  "Swallow",
  "Falcon",
  "Goose",
  "Cockatoo",
  "Cock",
  "Macaw",
  "Peacock",
  "Doel"
];
var birdM = [
  "Gull",
  "Rooster",
  "Robin",
  "Crane",
  "Hornbill",
  "Duckling",
  "Chick",
  "Pewit",
  "Weaver",
  "Pelican",
  "Stork",
  "Skylark",
  "Seagull",
  "Osprey",
  "Pheasant",
  "Oriole",
  "Raven",
  "Magpie",
  "Gander",
  "Grebe",
  "Canary",
  "Avocet",
  "Chukar",
  "Eider",
  "Drake",
  "Kiwi",
  "Lark",
  "Heron",
  "Hoopoe",
];
var birdH = [
  "Egyptian Vulture",
  "Peregrine Falcon",
  "Sandpipe",
  "Partridge",
  "Hawk Cuckoo",
  "Great Egret",
  "Eurasian Hobby",
  "Hoatzin",
  "Kestrel",
  "Cormorant",
  "Partridge",
  "Goldfinch",
  "Cygnet",
];
var continentE = [
  "Asia",
  "Africa",
  "Europe",
  "North America",
  "South America",
  "Australia",
  "Antarctica"
];
var countryE = [
  "Afghanistan",
  "Argentina",
  "Australia",
  "Austria",
  "Algeria",
  "Bangladesh",
  "Belgium",
  "Bhutan",
  "Brazil",
  "Bulgaria",
  "Canada",
  "Chile",
  "China",
  "Colombia",
  "Cambodia",
  "Costa Rica",
  "Croatia",
  "Cuba",
  "Denmark",
  "East Timor",
  "Egypt",
  "Finland",
  "France",
  "Germany",
  "Ghana",
  "Greece",
  "Greenland",
  "Honduras",
  "Hong Kong",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Ireland",
  "Israel",
  "Italy",
  "Ivory Coast",
  "Japan",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "North Korea",
  "South Korea",
  "Kuwait",
  "Liberia",
  "Libya",
  "Luxembourg",
  "Macau",
  "Madagascar",
  "Malaysia",
  "Maldives",
  "Mauritius",
  "Mexico",
  "Mongolia",
  "Montserrat",
  "Morocco",
  "Myanmar",
  "Namibia",
  "Nepal",
  "Netherlands",
  "New Zealand",
  "Nigeria",
  "Norway",
  "Oman",
  "Pakistan",
  "Panama",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Qatar",
  "Romania",
  "Saudi Arabia",
  "Yemen",
  "Singapore",
  "Somalia",
  "South Africa",
  "South Sudan",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Sweden",
  "Switzerland",
  "Syria",
  "Tajikistan",
  "Thailand",
  "Turkey",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States",
  "Uruguay",
  "Uzbekistan",
  "Vatican City",
  "Venezuela",
  "Vietnam",
  "Zimbabwe"
];
var cricketerH = [
  "Donald Bradman",
  "Sachin Tendulkar",
  "Garfield Sobers",
  "Imran Khan",
  "Ian Botham",
  "Shane Warne",
  "Viv Richards",
  "Brian Lara",
  "Jaques Kallis",
  "MS Dhoni",
  "Wasim Akram",
  "Virat Kohli",
  "James Anderson",
  "Alastair Cook",
  "Muttiah Muralitharan",
  "Kumar Sangakkara",
  "Kapil Dev",
  "Richard Hadlee",
  "Adam Gilchrist",
  "Chris Gayle",
  "Glenn McGrath",
  "Ricky Ponting",
  "Steve Waugh",
  "Rahul Dravid",
  "Sunil Gavaskar",
  "Shoaib Akhtar",
  "Curtly Ambrose",
  "Mahela Jayawardene",
  "Dale Steyn",
  "Allan Donald",
  "AB de Villiers",
  "David Warner",
  "Yuvraj Singh",
  "Hashim Amla",
  "Phillip Hughes",
  "Brendon McCullum",
  "Sourav Ganguly",
  "Glenn Maxwell",
  "Jasprit Bumrah",
  "Eoin Morgan",
  "Dwayne Bravo",
  "Suresh Raina",
  "Ravindra Jadeja",
  "Kieron Pollard",
  "Matthew Hayden",
  "Harbhajan Singh",
  "Shane Watson",
  "Brett Lee",
  "Shahid Afridi",
  "Ross Taylor",
  "Mohammad Ashraful",
  "Mashrafe Bin Mortaza",
  "Shakib Al Hasan",
  "Mustafizur Rahman",
  "Mushfiqur Rahim",
  "Tamim Iqbal",
  "Taskin Ahmed",
  "Soumya Sarkar",
  "Mohammad Mahmudullah",
  "Imrul Kayes"
];
var fishH = [
  "Albacore Tuna",
  "Alligator Gar",
  "Baiji",
  "Barracuda",
  "Basking Shark",
  "Blue Shark",
  "Butterfly Fish",
  "Carp",
  "Catfish",
  "Clownfish",
  "Dragonfish",
  "Drum Fish",
  "Eel",
  "Electric Eel",
  "Flying Fish",
  "Goldfish",
  "Grass Carp",
  "Great White Shark",
  "Greenland Shark",
  "Grey Reef Shark",
  "Hagfish",
  "Hammerhead Shark",
  "Jellyfish",
  "Koi Fish",
  "Krill",
  "Lake Sturgeon",
  "Lionfish",
  "Lungfish",
  "Megalodon",
  "Oyster Toadfish",
  "Paddlefish",
  "Piranha",
  "Salmon",
  "Skate Fish",
  "Squirrelfish",
  "Starfish",
  "Tiger Shark",
  "Lobster",
  "Red Snapper",
  "Ilish"
];
var flowerH = [
  "Wallflower",
  "Water lily",
  "Violet",
  "Tulip",
  "Tuberose",
  "Sunflower",
  "Star of Bethlehem",
  "Rosemary",
  "Rose",
  "Quesnelia",
  "Primrose",
  "Persian Candytuft",
  "Osmunda",
  "Ophrys",
  "Nightshade",
  "Marshmallow",
  "Marigold",
  "Laurel",
  "Jessamine",
  "Ipomea",
  "Hibiscus",
  "Gilliflower",
  "Dandelion",
  "Dahlia",
  "Bluebottle",
  "Bellflower",
  "Barberry",
  "Angelica",
  "Aster",
  "Aspen"
];
var fruitM = [
  "Apple",
  "Acerola",
  "Banana",
  "Blackberry",
  "Blueberry",
  "Carambola",
  "Cherry",
  "Coconut",
  "Date",
  "Grapes",
  "Jack Fruit",
  "Lemon",
  "Lychee",
  "Mango",
  "Olive",
  "Mandarin",
  "Orange",
  "Papaya",
  "Pear",
  "Pineapple",
  "Raspberry",
  "Strawberry",
  "Watermelon",
  "Tamarind",
  "Pummelo",
  "Pomegranate",
  "Dragonfruit",
  "Mangosteen",
  "Longan",
  "Loquat"
];
var footballerH = [
  "Cristiano Ronaldo",
  "Lionel Messi",
  "Neymar",
  "Andres Iniesta",
  "David Villa",
  "Fernando Torres",
  "Sergio Ramos",
  "Luka Modric",
  "Paul Pogba",
  "Kylian Mbappe",
  "Wayne Rooney",
  "Xavi",
  "Ronaldinho",
  "Pele",
  "Mesut Ozil",
  "Thomas Muller",
  "Toni Kroos",
  "Gareth Bale",
  "Marcelo Vieira",
  "Manuel Neuer",
  "David de Gea",
  "Iker Casillas",
  "Karim Benzema",
  "Nani",
  "Mohamed Salah"
];
var languageE = [
  "Arabic",
  "French",
  "Spanish",
  "Portuguese",
  "Italian",
  "German",
  "Chinese",
  "Dutch",
  "Bosnian",
  "Turkish",
  "Bengali",
  "Urdu",
  "Hindi",
  "English",
  "Russian",
  "Japanese",
  "Telugu",
  "Marathi",
  "Korean",
  "Tamil"
];
var movieM = [
  "Kabhi Khushi Kabhi Gum",
  "Kal Ho Na Ho",
  "Drishyam",
  "Raid",
  "Players",
  "Main Hoon Na",
  "R Rajkumar",
  "Krish",
  "Dhoom",
  "Don",
  "Master",
  "Saaho",
  "Bahubali",
  "Radhe Shyam",
  "Happy New Year",
  "Fast And The Furious",
  "Need For Speed",
  "6 Undergrounds",
  "Joker",
  "Avengers",
  "Death Race",
  "Iron Fist",
  "Iron Man",
  "Captain America",
  "Interstellar",
  "Spider Man",
  "Batman",
  "Deadpool",
  "Vivah",
  "Captain Marvel"
];
var oceanE = [
  "Arctic Ocean",
  "Southern Ocean",
  "Indian Ocean",
  "Atlantic Ocean",
  "Pacific Ocean"
];
var planetE = [
  "Mercury",
  "Venus",
  "Earth",
  "Mars",
  "Jupiter",
  "Saturn",
  "Uranus",
  "Neptune"
];
var religionM = [
  "Christianity",
  "Islam",
  "Hinduism",
  "Buddhism",
  "Sikhism",
  "Judaism"
];
var riverH = [
  "Yangtze",
  "Mississippi",
  "Yenisey",
  "Yellow",
  "Ob",
  "Parana",
  "Congo",
  "Amur",
  "Nile",
  "Volga",
  "Danube",
  "Zambezi",
  "Mekong",
  "Hudson",
  "St. Lawrence",
  "Padma",
  "Meghna",
  "Jamuna",
  "Bhairab",
  "Karnaphuli"
];
var scientistH = [
  "Hippoocrates",
  "Aristotle",
  "Archimedes",
  "Galen",
  "Leonardo Da Vinci",
  "Nicolaus Copernicus",
  "Galileo",
  "Pascal",
  "Newton",
  "Edward Jenner"
];
var seriesH = [
  "Money Hiest",
  "Sacred Games",
  "Game Of Thrones",
  "Breaking Bad",
  "Friends",
  "Sex And The City",
  "The Prisoner",
  "Prison Break",
  "The Walking Dead",
  "THe Big Bang Theory",
  "Vikings",
  "Daredevil",
  "Narcos",
  "Marco Polo",
  "Peaky Blinders",
  "Marco Polo",
  "Attack on Titan",
  "One Piece",
  "Naruto",
  "That Time I Got Reincarnated as a Slime"
];
var sportM = [
  "Football",
  "Badminton",
  "Cricket",
  "Tennis",
  "Table Tennis",
  "Basketball",
  "Baseball",
  "Volleyball",
  "Golf",
  "Swimming",
  "Boxing",
  "Rugby",
  "Pool",
  "Darts",
  "Bowling",
  "Cycling",
  "Karate",
  "Archery",
  "Chess",
  "Cards"
];
var vehicleM = [
  "Ambulance",
  "Bulldozer",
  "Express Train",
  "Ferry",
  "Hydroplane",
  "Lorry",
  "Motorboat",
  "Pickup Truck",
  "Rickshaw",
  "Submarine",
  "Boat",
  "Launch",
  "Ship",
  "Speed Boat",
  "Metro Train"
];
var videoGameE = [
  "CALL OF DUTY",
  "MODERN WARFARE",
  "CLASH OF CLANS",
  "FIFA",
  "SNIPER ELITE",
  "GRAND THEIR AUTO",
  "CLASH ROYALE",
  "ASPHALT",
  "NEED FOR SPEED",
  "FORTNITE",
  "PUBG MOBILE",
  "VALORANT",
  "COUNTER STRIKE",
  "SUBWAY SURF",
  "TAKEN 5",
  "POKEMON GO",
  "MINI MILITIA",
  "BOOM BEACH",
  "GUNS OF BOOM",
  "HILL CLIMB"
];
var wildAnimalM = [
  "Walrus",
  "Leopard",
  "Chimpanzee",
  "Raccoon",
  "Kangaroo",
  "Hippopotamus",
  "Gorilla",
  "Monkey",
  "Giraffe",
  "Elephant",
  "Lion",
  "Tiger",
  "Fox",
  "Zebra",
  "Wolf"
];
var colourM = [
  "Red",
  "Blue",
  "Green",
  "Orange",
  "White",
  "Black",
  "Yellow",
  "Purple",
  "Silver",
  "Brown",
  "Gray",
  "Pink",
  "Olive",
  "Maroon",
  "Violet",
  "Charcoal",
  "Magenta",
  "Bronze",
  "Cream",
  "Gold",
  "Tan",
  "Teal",
  "Mustard",
  "Navy Blue",
  "Coral",
  "Burgundy",
  "Lavender",
  "Mauve",
  "Peach",
  "Rust",
  "Indigo",
  "Ruby",
  "Clay",
  "Cyan",
  "Azure",
  "Beige",
  "Off White",
  "Turquoise",
  "Amber",
  "Mint"
];

//Choosing For Easy Level
List<String> chooseRandomWordEasy() {
  Random random = Random();

  //Type Choose
  String typeSelection = typesE[random.nextInt(9)];
  String choosenType = "Name Written In Logo";
  String choosenWord = "MASTERMIND";

  //Word Choose
  switch (typeSelection) {
    case "Actor":
      choosenType = "Actor";
      choosenWord = actorE[random.nextInt(18)].toUpperCase();
      break;
    case "Actress":
      choosenType = "Actress";
      choosenWord = actressE[random.nextInt(22)].toUpperCase();
      break;
    case "Bird":
      choosenType = "Bird";
      choosenWord = birdE[random.nextInt(34)].toUpperCase();
      break;
    case "Continent":
      choosenType = "Continent";
      choosenWord = continentE[random.nextInt(7)].toUpperCase();
      break;
    case "Country":
      choosenType = "Country";
      choosenWord = countryE[random.nextInt(100)].toUpperCase();
      break;
    case "Language":
      choosenType = "Language";
      choosenWord = languageE[random.nextInt(20)].toUpperCase();
      break;
    case "Ocean":
      choosenType = "Ocean";
      choosenWord = oceanE[random.nextInt(5)].toUpperCase();
      break;
    case "Planet":
      choosenType = "Planet";
      choosenWord = planetE[random.nextInt(8)].toUpperCase();
      break;
    case "Video Game":
      choosenType = "Video Game";
      choosenWord = videoGameE[random.nextInt(20)].toUpperCase();
      break;
    default:
  }
  return [choosenType, choosenWord];
}

//Choosing For Medium Level
List<String> chooseRandomWordMedium() {
  Random random = Random();

  //Type Choose
  String typeSelection = typesM[random.nextInt(11)];
  String choosenType = "Name Written In Logo";
  String choosenWord = "MASTERMIND";

  //Word Choose
  switch (typeSelection) {
    case "Actor":
      choosenType = "Actor";
      choosenWord = actorM[random.nextInt(24)].toUpperCase();
      break;
    case "Actress":
      choosenType = "Actress";
      choosenWord = actressM[random.nextInt(23)].toUpperCase();
      break;
    case "Band":
      choosenType = "Band";
      choosenWord = bandM[random.nextInt(20)].toUpperCase();
      break;
    case "Bird":
      choosenType = "Bird";
      choosenWord = birdM[random.nextInt(29)].toUpperCase();
      break;
    case "Fruit":
      choosenType = "Fruit";
      choosenWord = fruitM[random.nextInt(30)].toUpperCase();
      break;
    case "Movie":
      choosenType = "Movie";
      choosenWord = movieM[random.nextInt(30)].toUpperCase();
      break;
    case "Religion":
      choosenType = "Religion";
      choosenWord = religionM[random.nextInt(6)].toUpperCase();
      break;
    case "Sport":
      choosenType = "Sport";
      choosenWord = sportM[random.nextInt(20)].toUpperCase();
      break;
    case "Vehicle":
      choosenType = "Vehicle";
      choosenWord = vehicleM[random.nextInt(15)].toUpperCase();
      break;
    case "Wild Animal":
      choosenType = "Wild Animal";
      choosenWord = wildAnimalM[random.nextInt(15)].toUpperCase();
      break;
    case "Colour":
      choosenType = "Colour";
      choosenWord = colourM[random.nextInt(40)].toUpperCase();
      break;
    default:
  }
  return [choosenType, choosenWord];
}

//Choosing For Hard Level
List<String> chooseRandomWordHard() {
  Random random = Random();

  //Type Choose
  String typeSelection = typesH[random.nextInt(10)];
  String choosenType = "Name Written In Logo";
  String choosenWord = "MASTERMIND";

  //Word Choose
  switch (typeSelection) {
    case "Actor":
      choosenType = "Actor";
      choosenWord = actorH[random.nextInt(18)].toUpperCase();
      break;
    case "Actress":
      choosenType = "Actress";
      choosenWord = actressH[random.nextInt(15)].toUpperCase();
      break;
    case "Bird":
      choosenType = "Bird";
      choosenWord = birdH[random.nextInt(13)].toUpperCase();
      break;
    case "Cricketer":
      choosenType = "Cricketer";
      choosenWord = cricketerH[random.nextInt(60)].toUpperCase();
      break;
    case "Fish":
      choosenType = "Fish";
      choosenWord = fishH[random.nextInt(40)].toUpperCase();
      break;
    case "Flower":
      choosenType = "Flower";
      choosenWord = flowerH[random.nextInt(30)].toUpperCase();
      break;
    case "Footballer":
      choosenType = "Footballer";
      choosenWord = footballerH[random.nextInt(25)].toUpperCase();
      break;
    case "River":
      choosenType = "River";
      choosenWord = riverH[random.nextInt(20)].toUpperCase();
      break;
    case "Scientist":
      choosenType = "Scientist";
      choosenWord = scientistH[random.nextInt(10)].toUpperCase();
      break;
    case "Series":
      choosenType = "Series";
      choosenWord = seriesH[random.nextInt(20)].toUpperCase();
      break;
    default:
  }
  return [choosenType, choosenWord];
}
