class Team {
  
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  Team(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.mysql = new MySQL(this.main, utility.db_host, utility.db_database, utility.db_user, utility.db_pass);
  }
  
  void getTeam(int id) {
    this.drawLabel();
  }
  
  void drawLabel() {
    String labelText;
    labelText = "TEAM INFO";
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(115)
      )
    );
    textAlign(CENTER);
    fill(utility.white);
    pushMatrix();
    translate(
      utility.calculateWidth(1710),
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
  
  void printRow() {
    // processing stuff here
  }
  
}
