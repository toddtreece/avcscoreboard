class Humidity {
  
  Utility utility;
  
  float current;
  
  Humidity() {
    utility = new Utility();
    this.current = 0.0;
  }
  
  void setHumidity(float h) {
    this.current = h;
    String tempText = "Humidity: " + str(h) + "%";
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
      utility.calculateHeight(970)
    );
  }
  
}
