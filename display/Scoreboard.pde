class Scoreboard {
  
  Weather weather;
  Clock clock;
  PImage bg;
  PApplet main;
  Standings standings;
  
  Scoreboard(PApplet p, int w, int h) {
    this.main = p;
    size(w,h);
    if(height == 1080) {
      this.bg = loadImage("bg.png");
    } else {
      this.bg = loadImage("bg_dev.png");
    }
    
    this.clock = new Clock();
    this.standings = new Standings(this.main);
    this.weather = new Weather(this.main);
  }
  
  void reDraw() {
    background(this.bg);
    this.clock.update();
    this.weather.init();
  }

}
