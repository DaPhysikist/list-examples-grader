import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.*;

class LongString implements StringChecker {
  public boolean checkString(String s) { return s.length() > 4; }
}


public class TestListExamples {
  // Write your grading tests here!
  @Test
public void testFilter(){
  //Creates a list of Strings
  List<String> aList = new ArrayList<String>();
  //Creates an array of strings to be added to a list
  String[] anArrayOfStrings = {"The", "He", "Hello", "Welcome"};
  //adds our array to the list
  aList.addAll(Arrays.asList(anArrayOfStrings));
  List<String> result = ListExamples.filter(aList, new LongString());
  String[] whatWeWant = {"Hello", "Welcome"};
  assertArrayEquals(whatWeWant, result.toArray());
}

@Test
public void testMerge(){
  List<String> list1 = new ArrayList<String>();
  list1.add("apple");
  list1.add("orange");
  list1.add("why");
  List<String> list2 = new ArrayList<String>();
  list2.add("ball");
  list2.add("cat");
  list2.add("zebra");
  assertEquals(new ArrayList<>(){{ add("apple"); add("ball"); add("cat"); add("orange"); add("why"); add("zebra"); }}, ListExamples.merge(list1, list2));
}
}
