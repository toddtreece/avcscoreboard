import fullscreen.*;

SoftFullScreen fs; 
Scoreboard scoreboard;

void setup() {
  scoreboard = new Scoreboard(1920/2, 1080/2);
  fs = new SoftFullScreen(this);
  //fs.enter();
}

void draw() {
  scoreboard.reDraw();
  scoreboard.weather.wind.setDirection(270);
  scoreboard.weather.wind.setSpeed(0);
  scoreboard.weather.temperature.setTemperature(90.0);
  scoreboard.weather.humidity.setHumidity(33.3);
  scoreboard.weather.pressure.setPressure(101.4);
}
