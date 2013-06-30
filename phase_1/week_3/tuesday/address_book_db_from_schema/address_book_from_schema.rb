require 'sqlite3'

$db = SQLite3::Database.new "address_contact.db"

module ContactGroupDB
  def self.setup

    $db.execute_batch(
      <<-SQL
      DROP TABLE IF EXISTS contacts;
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name VARCHAR(25) NOT NULL,
        last_name VARCHAR(25),
        address VARCHAR(50),
        company VARCHAR(40),
        phone_number VARCHAR(20),
        email VARCHAR(35) 
        );

      DROP TABLE IF EXISTS contacts_groups;      
      CREATE TABLE contacts_groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_id INTEGER NOT NULL,
        contact_id INTEGER NOT NULL,
        FOREIGN KEY(group_id) REFERENCES groups(id),
        FOREIGN KEY(contact_id) REFERENCES contacts(id)
        );

      DROP TABLE IF EXISTS groups;
      CREATE TABLE groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(20) NOT NULL
        );
    SQL
    )
  end

  def self.seed

    $db.execute_batch(
      <<-SQL
      INSERT INTO contacts 
      (first_name, last_name, phone_number, email)
      VALUES
      ('Brick','Thornton','4153688743', 'brick@devbootcamp.com'),
      ('Jared','Smith','3153878900', 'jared@icloud.com'),
      ('Brared','Smorton','4153632422', 'double@d.com');

      INSERT INTO groups
      (name)
      VALUES 
      ('Bros');

      INSERT INTO contacts_groups
      (group_id, contact_id)
      VALUES
      (1,1);
      SQL
      )
  end
end

ContactGroupDB.setup
ContactGroupDB.seed
