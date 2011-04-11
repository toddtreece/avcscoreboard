import fullscreen.*;
import processing.serial.*;
import de.bezier.data.sql.*;

Scoreboard scoreboard;
SoftFullScreen fs;

void setup() {
  scoreboard = new Scoreboard(this, 1920/2, 1080/2);
  fs = new SoftFullScreen(this);
  //fs.enter();
}

void draw() {
  scoreboard.reDraw();
}
