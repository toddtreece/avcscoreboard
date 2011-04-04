class Pressure {
  
  Utility utility;
  
  float current;
  
  Pressure() {
    utility = new Utility();
    this.current = 0.0;
  }
  
  void setPressure(float p) {
    this.current = p;
    String tempText = "Pressure: " + str(p) + " kPa";
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
      utility.calculateHeight(1020)
    );
  }
  
}
