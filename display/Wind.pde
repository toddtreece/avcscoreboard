class Wind {
  
  Utility utility;
  
  //compass coordinates & size
  int compassX;
  int compassY;
  int compassDiameter;
  
  //direction arrow coordinates
  int dirX_1;
  int dirY_1;
  int dirX_2;
  int dirY_2;
  int dirX_3;
  int dirY_3;
  
  //current wind readings
  int windSpeed;
  int windDirection; 
  
  Wind() {
    utility = new Utility();
    this.windSpeed = 0;
    this.windDirection = 0;
    
    this.compassX = utility.calculateWidth(164);
    this.compassY = utility.calculateHeight(951);
    this.compassDiameter = utility.calculateHeight(140);
    
    this.dirX_1 = utility.calculateWidth(-20);
    this.dirY_1 = utility.calculateHeight(0);
    this.dirX_2 = utility.calculateWidth(20);
    this.dirY_2 = utility.calculateHeight(-14); 
    this.dirX_3 = utility.calculateWidth(20);
    this.dirY_3 = utility.calculateHeight(14);
  }

  void init() {
    this.createCompass();
    this.createCompassDirections();
  }
  
  void createCompass() {
    smooth();
    strokeWeight(utility.calculateHeight(8));
    noFill();
    stroke(utility.white);
    ellipse(
      this.compassX, 
      this.compassY,
      this.compassDiameter,
      this.compassDiameter
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
  
  void setDirection(float degree) {
    float rads = radians(degree-90);
    strokeWeight(utility.calculateHeight(4));
    stroke(utility.grey);
    fill(utility.lightRed);
    int x  = (int)(this.compassX + (this.compassDiameter/2) * cos(rads));
    int y = (int)(this.compassY + (this.compassDiameter/2) * sin(rads));
    pushMatrix();
      translate(
        x,
        y
      );
      rotate(rads);
      triangle(
        dirX_1,
        dirY_1,
        dirX_2,
        dirY_2,
        dirX_3,
        dirY_3
      );
    popMatrix();
  }

}
