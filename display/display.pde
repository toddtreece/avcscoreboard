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
  scoreboard.weather.wind.setDirection(0);

}
