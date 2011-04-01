class Wind {
  
  Utility utility;
  
  //compass coordinates & size
  int compassX = 164;
  int compassY = 951;
  int compassRadius = 140;
  
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
    
    this.dirX_1 = utility.calculateWidth(164);
    this.dirY_1 = utility.calculateHeight(907);
    this.dirX_2 = utility.calculateWidth(150);
    this.dirY_2 = utility.calculateHeight(867); 
    this.dirX_3 = utility.calculateWidth(178);
    this.dirY_3 = utility.calculateHeight(867);
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
      utility.calculateWidth(this.compassX), 
      utility.calculateHeight(this.compassY),
      utility.calculateWidth(this.compassRadius),
      utility.calculateHeight(this.compassRadius)
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
  
  void setDirection(int degree) {
    float rads = radians(degree);
    strokeWeight(utility.calculateHeight(4));
    stroke(utility.grey);
    fill(utility.lightRed);
    pushMatrix();
      rotate(rads);
      triangle(
        this.calculateDirectionX(rads, this.dirX_1),
        this.calculateDirectionY(rads, this.dirY_1), 
        this.calculateDirectionX(rads, this.dirX_2), 
        this.calculateDirectionY(rads, this.dirY_2), 
        this.calculateDirectionX(rads, this.dirX_3), 
        this.calculateDirectionY(rads, this.dirY_3)
      );
    popMatrix();
  }
  
  int calculateDirectionX(float rads, i) {
    return (int)(x + this.compassRadius * cos(rads));
  }
  
  int calculateDirectionY(float rads, int y) {
    return (int)(y + this.compassRadius * sin(rads));
  }

}
