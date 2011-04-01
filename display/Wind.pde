class Wind {
  
  //current wind readings
  int windSpeed;
  int windDirection; 
  
  Wind() {
    this.windSpeed = 0;
    this.windDirection = 0;
  }

  void init() {
    //36px at 1080p
    textFont(
      createFont(
        "Arial-Black", 
        round(height * 0.0334)
      )
    );
    textAlign(CENTER);
    this.createCompass();
  }
  
  void createCompass() {
    smooth();
    strokeWeight(round(height * 0.00625) * 2);
    noFill();
    stroke(#FFFFFF);
    ellipse(
      round(width * 0.085417), 
      round(height * 0.8806),
      round(width * 0.072917),
      round(height * 0.1297)
    );
    fill(0);
    text(
      'N',
      round(width * 0.085417), 
      round(height * 0.8306)
    );
    text(
      'S',
      round(width * 0.085417), 
      round(height * 0.9584)
    );
    text(
      'W',
      round(width * 0.05), 
      round(height * 0.8953)
    );
    text(
      'E',
      round(width * 0.121875), 
      round(height * 0.8953)
    );
  }
  
}
