class AddSqlCalculateBonusFunction < ActiveRecord::Migration
  def self.up

    execute <<-SQL
      CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateBonusTime`(time TIME, landlot TINYINT, landbox TINYINT, takeoff TINYINT, ring TINYINT) RETURNS time
        BEGIN
          DECLARE secs INT;
          DECLARE current INT;
          
          SET secs = TIME_TO_SEC(time);
          SET current = secs;

          IF landlot = 1 THEN SET secs = current - 10;
          END IF;
              
              SET current = secs;

          IF landbox = 1 THEN SET secs = current - 30;
          END IF;
          
          SET current = secs;

          IF takeoff = 1 THEN SET secs = current - 30;
          END IF;
          
          SET current = secs;
        
          IF ring = 1 THEN SET secs = current - 30;
          END IF;

          RETURN SEC_TO_TIME(secs);
        END;
    SQL
    
  end

  def self.down
    execute "DROP FUNCTION CalculateBonusTime;"
  end
end
