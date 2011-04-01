class Wind {
  
  Utility utility;
  
  //current wind readings
  int windSpeed;
  int windDirection; 
  
  Wind() {
    utility = new Utility();
    this.windSpeed = 0;
    this.windDirection = 0;
  }

  void init() {
    this.createCompass();
    this.createCompassDirections();
    this.createCompassPointer();
  }
  
  void createCompass() {
    smooth();
    strokeWeight(utility.calculateHeight(8));
    noFill();
    stroke(utility.white);
    ellipse(
      utility.calculateWidth(164), 
      utility.calculateHeight(951),
      utility.calculateWidth(140),
      utility.calculateHeight(140)
    );

  }
  
  void createCompassDirections() {
    //36px at 1080p
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(36)
      )
    );
    textAlign(CENTER);
    fill(utility.darkRed);
    text(
      'N',
      utility.calculateWidth(164), 
      utility.calculateHeight(897)
    );
    text(
      'S',
      utility.calculateWidth(164), 
      utility.calculateHeight(1035)
    );
    text(
      'W',
      utility.calculateWidth(96), 
      utility.calculateHeight(967)
    );
    text(
      'E',
      utility.calculateWidth(234), 
      utility.calculateHeight(967)
    );
  }
  
  void createCompassPointer() {
    strokeWeight(utility.calculateHeight(4));
    stroke(utility.grey);
    fill(utility.lightRed);
    triangle(
      utility.calculateWidth(164),
      utility.calculateHeight(907), 
      utility.calculateWidth(150), 
      utility.calculateHeight(867), 
      utility.calculateWidth(178), 
      utility.calculateHeight(867)
    );
  }
  
  void setDirection() {
     
  }
  

}
