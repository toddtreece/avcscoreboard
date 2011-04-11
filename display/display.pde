import fullscreen.*;
import processing.serial.*;
import de.bezier.data.sql.*;

Scoreboard scoreboard;
SoftFullScreen fs;

void setup() {
  scoreboard = new Scoreboard(this, 1920, 1080);
  fs = new SoftFullScreen(this);
  fs.enter();
}

void draw() {
  scoreboard.reDraw();
}
