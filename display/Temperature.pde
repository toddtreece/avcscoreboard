class Temperature {
  
  Utility utility;
  
  float current;
  
  Temperature() {
    utility = new Utility();
    this.current = 0.0;
  }
  
  void setTemperature(float temp) {
    this.current = temp;
    String tempText = "Temperature: " + str(temp) + "ºF";
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(50)
      )
    );
    textAlign(LEFT);
    fill(utility.white);
    text(
      tempText,
      utility.calculateWidth(270), 
      utility.calculateHeight(920)
    );
  }
  
}
