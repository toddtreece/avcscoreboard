class Scoreboard {
  
  Weather weather;
  View view;
  Clock clock;
  PApplet main;
  
  
  Scoreboard(PApplet p, int w, int h) {
    this.main = p;
    size(w,h); 
    this.clock = new Clock();
    this.view = new View(this.main);
    this.weather = new Weather(this.main);
  }
  
  void reDraw() {
    this.view.refresh();
    this.clock.update();
    this.weather.init();
  }

}
