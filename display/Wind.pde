class Wind {
  
  //current wind readings
  int windSpeed;
  int windDirection; 
  
  Wind() {
    this.windSpeed = 0;
    this.windDirection = 0;
  }

  void init() {
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
  }
  
}
