class Clock {
  
  Utility utility;
  
  Clock() {
    utility = new Utility();
  }
  
  void update() {
    String tempText = this.addLeadingZero(hour());
    tempText += ":" + this.addLeadingZero(minute());
    tempText += ":" + this.addLeadingZero(second());
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(110)
      )
    );
    textAlign(RIGHT);
    fill(utility.white);
    text(
      tempText,
      utility.calculateWidth(1840), 
      utility.calculateHeight(990)
    );
  }
  
  String addLeadingZero(int number) {
    String temp;
    if(number < 10) {
      temp = "0";
    } else {
      temp = "";
    }
    temp += number;
    return temp;
  }
  
}
