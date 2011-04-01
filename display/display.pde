import fullscreen.*;

SoftFullScreen fs; 
Scoreboard scoreboard;

void setup() {
  scoreboard = new Scoreboard(1920, 1080);
  fs = new SoftFullScreen(this);
  fs.enter();
}

void draw() {
  scoreboard.reDraw();
  scoreboard.weather.wind.setDirection(90);
}
