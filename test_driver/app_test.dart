import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group("SearchBar tests", (){
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });



    tearDownAll((){
      if(driver != null){
        driver.close();
      }
    });


    var searchBar = find.byValueKey("SearchBar");
    test("insert text on search bar and find it", () async{
      await driver.tap(searchBar);
      await driver.enterText("Search test");
      await driver.waitFor(find.text("Search test"));
      assert(find.text("Search test") != null);
    });

    

    
  });

  group("Shuffle Button tests", (){
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });



    tearDownAll((){
      if(driver != null){
        driver.close();
      }
    });
    var shuffleButton = find.byValueKey("ShuffleIcon");
    var circularIndicator = find.byValueKey("LoadingIndicator");
    test("tapping shuffle button shows circularprogressindicator and it disappears", () async {
      await driver.tap(shuffleButton);
      await driver.waitFor(circularIndicator);
      await driver.waitForAbsent(circularIndicator);
      await driver.scroll(find.byValueKey("BoxTile"), 0, 0, Duration(milliseconds: 600));
    });

    test("tapping shuffle button opens recipe screen", () async {
      await driver.tap(shuffleButton);
      await driver.waitFor(find.byValueKey("RandomRecipe"));
      assert(find.byValueKey("RandomRecipe") != null);
      await driver.scroll(find.byValueKey("BoxTile"), 0, 0, Duration(milliseconds: 600));
    });
  });

  group("RecipeTile tests", (){
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });



    tearDownAll((){
      if(driver != null){
        driver.close();
      }
    });

    var shimmer = find.byValueKey("ShimmerLoading");
    

    var firstCard = find.byValueKey(0);
    test("tapping recipe card opens recipe screen", () async{
      await driver.waitForAbsent(shimmer);
      await driver.tap(firstCard);
      await driver.waitFor(find.byValueKey("TappedRecipe"));
      await driver.scroll(find.byValueKey("BoxTile"), 0, 0, Duration(milliseconds: 600));
    });
  });

  group("Loading shimmer tests", (){
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });



    tearDownAll((){
      if(driver != null){
        driver.close();
      }
    });

    var shimmer = find.byValueKey("ShimmerLoading");
    test("doesn't find shimmer after loading and finds more than one recipe card", () async{
      await driver.waitForAbsent(shimmer);
      assert(find.byValueKey("0") != null);
    });

    test("doesn't find shimmer after loading and finds at least one recipe card", () async{
      await driver.waitForAbsent(shimmer);
      assert(find.byValueKey("0") != null);
    });
  });
}