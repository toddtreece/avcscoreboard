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
    // mysql stuff here
  }
  
  void printRow() {
    // processing stuff here
  }
  
}
