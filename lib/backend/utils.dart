import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';

import 'const.dart';
import 'models/cargo.dart';

typedef void NotifyCargoValid(int nwfID, bool valid);
typedef void OnTextChange(String text);
typedef bool ValidateText(String text);
typedef void NotifyValid(bool valid);
typedef void IntCallBack();
typedef void IntCallBackIntPara(int i);
typedef void StringCallBack(String x);
typedef void DateCallBack(DateTime dateTime);
typedef void NWFSCallBack(int key, Cargo value);
typedef void UnitChangeCB(var i);
class Util {
  static String getTruncated(String s, int max) {
    if (s.length <= max) {
      return s;
    }
    return s.substring(0, max - 3) + '...';
  }

  static int getDaysInYear(int year) {
    final isLeap = Jiffy({'year': year}).isLeapYear;
    if (isLeap) {
      return 366;
    } else {
      return 365;
    }
  }

  static Color getValidColor(bool isValid){
     if (isValid) {
      return Const.nonfocusedBoderColors;
    }
    return Const.nonfocusedErrorBoderColor;
  }

  static int idx = 0;
  ///Given a string try to parse into double. If fail make toast with error.
  static double parsedouble(String s) {

    if(s.isEmpty){s = '0';}

    try {
      return double.parse(s);
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw Exception('${s} could not be parsed as a double');
    }
  }

  static int getUniqueIdx() {
    idx++;
    return idx - 1;
  }

  static int parseint(s) {
    if(s.isEmpty){s = '0';}
    try {
      return int.parse(s);
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw Exception('${s} could not be parsed as an int');
    }
  }

  static String fixed(double x) => x.toStringAsFixed(2);
}


class Distance {
  double numOfBases;
  String name;
  Distance(this.name, this.numOfBases);
}

class Unit {
  List<Distance> list = [];
  static final units = ['Length', 'Mass', 'Area', 'Time', 'Volume', 'Speed'];
  int unit;
  Unit(this.unit) {
    // list.add(Distance('',));
    //if distance 'x',1 then that unit is the base multiplier
    switch (unit) {
      case 0:
        list.add(Distance('32nds Inch', 0.00079375));
        list.add(Distance('Milimeter', 0.001));
        list.add(Distance('16nths Inch', 0.0015875));
        list.add(Distance('Centimeter', 0.01));
        list.add(Distance('Inch', 0.0254));
        list.add(Distance('Foot', 0.3048));
        list.add(Distance('Yard', 0.9144));
        list.add(Distance('Meter', 1));
        list.add(Distance('Kiliometer', 1000));
        list.add(Distance('Mile', 1609.344));
        list.add(Distance('Nautical Mile', 1852));
        break;
      case 1:
        list.add(Distance('Microgram', 0.000000001));
        list.add(Distance('Miligram', 0.000001));
        list.add(Distance('Gram', 0.001));
        list.add(Distance('Ounce', 0.0283495));
        list.add(Distance('Pound', 0.453592));
        list.add(Distance('Kilogram', 1));
        list.add(Distance('Stone', 6.35029));
        list.add(Distance('US Ton', 907.185));
        list.add(Distance('Metric Ton', 1000));
        list.add(Distance('Imperial Ton', 1016.05));
        break;
      case 2:
        list.add(Distance('Inch^2', 0.00064516));
        list.add(Distance('Foot^2', 0.092903));
        list.add(Distance('Yard^2', 0.092903));
        list.add(Distance('Meter^2', 1));
        list.add(Distance('Acre', 4046.86));
        list.add(Distance('Hectare', 10000));
        list.add(Distance('Kilometer^2', 1000000));
        list.add(Distance('Mile^2', 2589988.1103360000998));
        break;
      case 3:
        list.add(Distance('Nanosecond', 0.000000000000011574));
        list.add(Distance('Microsecond', 0.000000000011574));
        list.add(Distance('Milisecond', 0.000000011574));
        list.add(Distance('Second', 0.000011574));
        list.add(Distance('Minute', 0.000694444));
        list.add(Distance('Hour', 0.0416667));
        list.add(Distance('Day', 1));
        list.add(Distance('Week', 7));
        list.add(Distance('Month', 30.4167243334));
        list.add(Distance('Year', 365));
        list.add(Distance('Decade', 3650));
        list.add(Distance('Century', 36500));
        break;
      case 4:
        list.add(Distance('Mililiter', 0.001));
        list.add(Distance('US Teaspoon', 0.00492892));
        list.add(Distance('US Tablespoon', 0.0147868));
        list.add(Distance('Inch^3', 0.0163871));
        list.add(Distance('US Fluid Ounce', 0.0295735));
        list.add(Distance('US Cup', 0.24));
        list.add(Distance('US Pint', 0.473176));
        list.add(Distance('US Quart', 0.946353));
        list.add(Distance('Liter', 1));
        list.add(Distance('US Gallon', 3.78541));
        list.add(Distance('Foot^3', 28.3168));
        list.add(Distance('Meter^3', 1000));
        break;
      case 5:
        list.add(Distance('Kilometer/Hr', 1));
        list.add(Distance('Foot/Sec', 1.09728));
        list.add(Distance('Miles/Hr', 1.60934));
        list.add(Distance('Knot', 1.852));
        list.add(Distance('Meter/Sec', 3.6));
        break;
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx = RegExp(r"^\d*\.?\d*");
    String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}
///allows 'decimal,nums,+,-,e' to not lock exponents 
class DecimalTextInputFormatter2 extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    //final regEx = RegExp(r'[0-9.+-e]+$');
    final regEx = RegExp(r'[0-9.+e-]+$');
    String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}

class LoadingMessage {
  static String getText() {
    final r = Random();
    return _text[r.nextInt(_text.length - 1)];
  }

  static const _text = [
    'Reticulating splines...',
    'Generating witty dialog...',
    'Swapping time and space...',
    'Spinning violently around the y-axis...',
    'Tokenizing real life...',
    'Bending the spoon...',
    'Filtering morale...',
    'Don\'t think of purple hippos...',
    'We need a new fuse...',
    'Have a good day.',
    'Upgrading Windows, your PC will restart several times. Sit back and relax.',
    '640K ought to be enough for anybody',
    'The architects are still drafting',
    'The bits are breeding',
    'We\'re building the buildings as fast as we can',
    'Would you prefer chicken, steak, or tofu?',
    '(Pay no attention to the man behind the curtain)',
    '...and enjoy the elevator music...',
    'Please wait while the little elves draw your map',
    'Don\'t worry - a few bits tried to escape, but we caught them',
    'Would you like fries with that?',
    'Checking the gravitational constant in your locale...',
    'Go ahead -- hold your breath!',
    '...at least you\'re not on hold...',
    'Hum something loud while others stare',
    'You\'re not in Kansas any more',
    'The server is powered by a lemon and two electrodes.',
    'Please wait while a larger software vendor in Seattle takes over the world',
    'We\'re testing your patience',
    'As if you had any other choice',
    'Follow the white rabbit',
    'Why don\'t you order a sandwich?',
    'While the satellite moves into position',
    'keep calm and npm install',
    'The bits are flowing slowly today',
    'Dig on the \'X\' for buried treasure... ARRR!',
    'It\'s still faster than you could draw it',
    'The last time I tried this the monkey didn\'t survive. Let\'s hope it works better this time.',
    'I should have had a V8 this morning.',
    'My other loading screen is much faster.',
    'Testing on Timmy... We\'re going to need another Timmy.',
    'Reconfoobling energymotron...',
    '(Insert quarter)',
    'Are we there yet?',
    'Have you lost weight?',
    'Just count to 10',
    'Why so serious?',
    'It\'s not you. It\'s me.',
    'Counting backwards from Infinity',
    'Don\'t panic...',
    'Embiggening Prototypes',
    'Do not run! We are your friends!',
    'Do you come here often?',
    'Warning: Don\'t set yourself on fire.',
    'We\'re making you a cookie.',
    'Creating time-loop inversion field',
    'Spinning the wheel of fortune...',
    'Loading the enchanted bunny...',
    'Computing chance of success',
    'I\'m sorry Dave, I can\'t do that.',
    'Looking for exact change',
    'All your web browser are belong to us',
    'All I really need is a kilobit.',
    'I feel like im supposed to be loading something. . .',
    'What do you call 8 Hobbits? A Hobbyte.',
    'Should have used a compiled language...',
    'Is this Windows?',
    'Adjusting flux capacitor...',
    'Please wait until the sloth starts moving.',
    'Don\'t break your screen yet!',
    'I swear it\'s almost done.',
    'Let\'s take a mindfulness minute...',
    'Unicorns are at the end of this road, I promise.',
    'Listening for the sound of one hand clapping...',
    'Keeping all the 1\'s and removing all the 0\'s...',
    'Putting the icing on the cake. The cake is not a lie...',
    'Cleaning off the cobwebs...',
    'Making sure all the i\'s have dots...',
    'We are not liable for any broken screens as a result of waiting.',
    'We need more dilithium crystals',
    'Where did all the internets go',
    'Connecting Neurotoxin Storage Tank...',
    'Granting wishes...',
    'Time flies when you’re having fun.',
    'Get some coffee and come back in ten minutes..',
    'Spinning the hamster…',
    '99 bottles of beer on the wall..',
    'Stay awhile and listen..',
    'Be careful not to step in the git-gui',
    'You edhall not pass! yet..',
    'Load it and they will come',
    'Convincing AI not to turn evil..',
    'There is no spoon. Because we are not done loading it',
    'Your left thumb points to the right and your right thumb points to the left.',
    'How did you get here?',
    'Wait, do you smell something burning?',
    'Computing the secret to life, the universe, and everything.',
    'When nothing is going right, go left!!...',
    'I love my job only when I\'m on vacation...',
    'i\'m not lazy, I\'m just relaxed!!',
    'Never steal. The government hates competition....',
    'Why are they called apartments if they are all stuck together?',
    'Life is Short – Talk Fast!!!!',
    'Optimism – is a lack of information.....',
    'Save water and shower together',
    'Whenever I find the key to success, someone changes the lock.',
    'Sometimes I think war is God’s way of teaching us geography.',
    'I’ve got problem for your solution…..',
    'Where there’s a will, there’s a relative.',
    'User: the word computer professionals use when they mean !!idiot!!',
    'Adults are just kids with money.',
    'I think I am, therefore, I am. I think.',
    'A kiss is like a fight, with mouths.',
    'You don’t pay taxes—they take taxes.',
    'Coffee, Chocolate, Men. The richer the better!',
    'I am free of all prejudices. I hate everyone equally.',
    'git happens',
    'May the forks be with you',
    'A commit a day keeps the mobs away',
    'This is not a joke, it\'s a commit.',
    'Constructing additional pylons...',
    'Roping some seaturtles...',
    'Locating Jebediah Kerman...',
    'We are not liable for any broken screens as a result of waiting.',
    'Hello IT, have you tried turning it off and on again?',
    'If you type Google into Google you can break the internet',
    'Well, this is embarrassing.',
    'What is the airspeed velocity of an unladen swallow?',
    'Hello, IT... Have you tried forcing an unexpected reboot?',
    'They just toss us away like yesterday\'s jam.',
    'They\'re fairly regular, the beatings, yes. I\'d say we\'re on a bi-weekly beating.',
    'The Elders of the Internet would never stand for it.',
    'Space is invisible mind dust, and stars are but wishes.',
    'Didn\'t know paint dried so quickly.',
    'Everything sounds the same',
    'I\'m going to walk the dog',
    'I didn\'t choose the engineering life. The engineering life chose me.',
    'Dividing by zero...',
    'Spawn more Overlord!',
    'If I’m not back in five minutes, just wait longer.',
    'Some days, you just can’t get rid of a bug!',
    'We’re going to need a bigger boat.',
    'Chuck Norris never git push. The repo pulls before.',
    'Web developers do it with <style>',
    'I need to git pull --my-life-together',
    'Java developers never RIP. They just get Garbage Collected.',
    'Cracking military-grade encryption...',
    'Simulating traveling salesman...',
    'Proving P=NP...',
    'Entangling superstrings...',
    'Twiddling thumbs...',
    'Searching for plot device...',
    'Trying to sort in O(n)...',
    'Laughing at your pictures-i mean, loading...',
    'Sending data to NS-i mean, our servers.',
    'Looking for sense of humour, please hold on.',
    'Please wait while the intern refills his coffee.',
    'A different error message? Finally, some progress!',
    'Hold on while we wrap up our git together...sorry',
    'Please hold on as we reheat our coffee',
    'Kindly hold on as we convert this bug to a feature...',
    'Kindly hold on as our intern quits vim...',
    'Winter is coming...',
    'Installing dependencies',
    'Switching to the latest JS framework...',
    'Distracted by cat gifs',
    'Finding someone to hold my beer',
    'BRB, working on my side project',
    '@todo Insert witty loading message',
    'Let\'s hope it\'s worth the wait',
    'Aw, snap! Not..',
    'Ordering 1s and 0s...',
    'Updating dependencies...',
    'Whatever you do, don\'t look behind you...',
    'Please wait... Consulting the manual...',
    'It is dark. You\'re likely to be eaten by a grue.',
    'Loading funny message...',
    'It\'s 10:00pm. Do you know where your children are?',
    'Waiting Daenerys say all her titles...',
    'Feel free to spin in your chair',
    'What the what?',
    'format C: ...',
    'Forget you saw that password I just typed into the IM ...',
    'What\'s under there?',
    'Your computer has a virus, its name is Windows!',
    'Go ahead, hold your breath and do an ironman plank till loading complete',
    'Bored of slow loading spinner, buy more RAM!',
    'Help, I\'m trapped in a loader!',
    'What is the difference btwn a hippo and a zippo? One is really heavy, the other is a little lighter',
    'Please wait, while we purge the Decepticons for you. Yes, You can thanks us later!',
    'Chuck Norris once urinated in a semi truck\'s gas tank as a joke....that truck is now known as Optimus Prime.',
    'Chuck Norris doesn’t wear a watch. HE decides what time it is.',
    'Mining some bitcoins...',
    'Downloading more RAM..',
    'Updating to Windows Vista...',
    'Deleting System32 folder',
    'Hiding all ;\'s in your code',
    'Alt-F4 speeds things up.',
    'Initializing the initializer...',
    'When was the last time you dusted around here?',
    'Optimizing the optimizer...',
    'Last call for the data bus! All aboard!',
    'Running swag sticker detection...',
    'When nothing is going right, go left!',
    'Never let a computer know you\'re in a hurry.',
    'A computer will do what you tell it to do, but that may be much different from what you had in mind.',
    'Some things man was never meant to know. For everything else, there\'s Google.',
    'Unix is user-friendly. It\'s just very selective about who its friends are.',
    'Shovelling coal into the server',
    'Pushing pixels...',
    'How about this weather, eh?',
    'Building a wall...',
    'Everything in this universe is either a potato or not a potato',
    'The severity of your issue is always lower than you expected.',
    'Updating Updater...',
    'Downloading Downloader...',
    'Debugging Debugger...',
    'Reading Terms and Conditions for you.',
    'Digested cookies being baked again.',
    'Live long and prosper.',
    'There is no cow level, but there\'s a goat one!',
    'Deleting all your hidden porn...',
    'Running with scissors...',
    'Definitely not a virus...',
    'You may call me Steve.',
    'You seem like a nice person...',
    'Coffee at my place, tommorow at 10A.M. - don\'t be late!',
    'Work, work...',
    'Patience! This is difficult, you know...',
    'Discovering new ways of making you wait...',
    'Your time is very important to us. Please wait while we ignore you...',
    'Time flies like an arrow; fruit flies like a banana',
    'Two men walked into a bar; the third ducked...',
    'Sooooo... Have you seen my vacation photos yet?',
    'Sorry we are busy catching em\' all, we\'re done soon',
    'TODO: Insert elevator music',
    'Still faster than Windows update',
    'Composer hack: Waiting for reqs to be fetched is less frustrating if you add -vvv to your command.',
  ];
}
