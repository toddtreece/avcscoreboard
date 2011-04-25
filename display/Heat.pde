class Heat {
  
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  Heat(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.mysql = new MySQL(this.main, utility.db_host, utility.db_database, utility.db_user, utility.db_pass);
  }
  
  void drawLabel() {
    String labelText;
    labelText = "UP NEXT";
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(150)
      )
    );
    textAlign(CENTER);
    fill(utility.white);
    pushMatrix();
    translate(
      utility.calculateWidth(1690),
      utility.calculateHeight(475)
    );
    rotate(radians(90));
    text(
      labelText,
      0, 
      0
    );
    popMatrix();
  }

  void getHeat(int id) {
    this.drawLabel();
    if(this.mysql.connect()) {
      String query = "";
      query += "SELECT h.id as heat_id, b.id as bot_id, b.pass, b.name, t.city, t.state ";
      query += "FROM bots b ";
      query += "JOIN heats h ON h.id = b.heats_id ";
      query += "JOIN teams t ON t.id = b.teams_id ";
      query += "WHERE h.id = " + id + " ";
      query += "ORDER BY b.name ASC ";
      this.mysql.query(query);
      int x = 140;
      int y = 250;
      while (this.mysql.next()) {
        y = this.printRow(x,y);
      }
    }
  }
  
  int printRow(int x, int y) {
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(75)
      )
    );
    textAlign(LEFT);
    fill(utility.white);
    String tempText;
    tempText = this.mysql.getString("name");
    text(
      tempText,
      utility.calculateWidth(x), 
      utility.calculateHeight(y)
    );
    float nameWidth = textWidth(tempText);
    tempText = this.mysql.getString("city") + ", " + this.mysql.getString("state");
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(38)
      )
    );
    text(
      tempText,
      utility.calculateWidth(x),
      utility.calculateHeight(y+42)
    );
    float cityWidth = textWidth(tempText);
    if(this.mysql.getInt("pass") == 1) {
      stroke(utility.darkRed);
      strokeWeight(utility.calculateHeight(20));
      line(
        utility.calculateWidth(x),
        (utility.calculateHeight(y) - utility.calculateHeight(25)),
        (utility.calculateWidth(x) + nameWidth),
        (utility.calculateHeight(y) - utility.calculateHeight(25))
      );
      strokeWeight(utility.calculateHeight(10));
      line(
        utility.calculateWidth(x),
        (utility.calculateHeight(y+32)),
        (utility.calculateWidth(x) + cityWidth),
        (utility.calculateHeight(y+32))
      ); 
    }
    y += 125;
    
    return y;
  }
  
}
