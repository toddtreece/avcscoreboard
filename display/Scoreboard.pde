class Scoreboard {
  
  Weather weather;
  View view;
  Clock clock;
  PImage bg;
  PApplet main;
  
  
  Scoreboard(PApplet p, int w, int h) {
    this.main = p;
    size(w,h);
    if(height == 1080) {
      this.bg = loadImage("bg.png");
    } else {
      this.bg = loadImage("bg_dev.png");
    }
    
    this.clock = new Clock();
    this.view = new View(this.main);
    this.weather = new Weather(this.main);
  }
  
  void reDraw() {
    background(this.bg);
    this.clock.update();
    this.weather.init();
    this.view.refresh();
  }

}
