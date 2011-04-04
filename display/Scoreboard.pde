class Scoreboard {
  
  Weather weather;
  Clock clock;
  PImage bg;
  
  Scoreboard(int w, int h) {
    size(w,h);
    if(height == 1080) {
      this.bg = loadImage("bg.png");
    } else {
      this.bg = loadImage("bg_dev.png");
    }
    
    this.weather = new Weather();
    this.clock = new Clock();
  }
  
  void reDraw() {
    background(this.bg);
    this.weather.init();
    this.clock.update();
  }

}
