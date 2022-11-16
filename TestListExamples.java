import static org.junit.Assert.*;
import org.junit.*;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

class containsLetterX implements StringChecker {

  public boolean checkString(String s) {
    return s.contains("x") || s.contains("X");
  }

}

public class TestListExamples {
  
  @Test
    public void testFilter() {
      List<String> input1 = new ArrayList<String>(Arrays.asList("xylophone", "apples", "", "XxXx", "    x "));
      assertEquals(new ArrayList<String>(Arrays.asList("xylophone", "XxXx", "    x ")), ListExamples.filter(input1, new containsLetterX()));
    }

  @Test
    public void testMerge() {
      List<String> input1 = new ArrayList<String>(Arrays.asList("a", "c", "e"));
      List<String> input2 = new ArrayList<String>(Arrays.asList("b", "d", "f"));
      List<String> output = new ArrayList<String>(Arrays.asList("a", "b", "c", "d", "e", "f"));
      assertEquals(output, ListExamples.merge(input1, input2));
    }
}