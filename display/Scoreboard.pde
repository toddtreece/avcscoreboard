class Scoreboard {
  
  Weather weather;
  PImage bg;
  
  Scoreboard(int w, int h) {
    size(w,h);
    if(height == 1080) {
      this.bg = loadImage("bg.png");
    } else {
      this.bg = loadImage("bg_dev.png");
    }
    background(this.bg);
    this.weather = new Weather();
    this.weather.init();
  }
  
}