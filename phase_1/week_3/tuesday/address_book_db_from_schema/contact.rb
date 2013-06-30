require './address_book_from_schema'
require 'sqlite3'


class Contact
  attr_accessor :id, :first_name, :last_name, :address, :company, :phone_number, :email
  def initialize(args) 
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @address = args[:address]
    @company = args[:company]
    @phone_number = args[:phone_number]
    @email = args[:email]
  end

  def save 
    if @id.nil?
      $db.execute(
        <<-SQL
        INSERT INTO contacts 
        (first_name, last_name, address, company, phone_number, email)
        VALUES
        ('#{@first_name}','#{@last_name}','#{@address}', '#{@company}' , '#{@phone_number}', '#{@email}');
        SQL
        )
    else
      $db.execute(
        <<-SQL
        UPDATE contacts 
        SET first_name = '#{@first_name}', last_name = '#{@last_name}', address = '#{@address}', 
        company = '#{@company}', phone_number = '#{@phone_number}', email = '#{@email}'
        WHERE id = '#{@id}';
        SQL
        )
    end
    @id = $db.last_insert_row_id unless @id
  end

  def delete
    return if @id.nil?
    $db.execute_batch(
      <<-SQL 
      DELETE FROM contacts
      WHERE id = '#{id}';

      DELETE FROM contacts_groups
      WHERE contact_id = '#{id}';

      SQL
      )
    Group.delete_contact(@id)
  end

end

class Group
  @@groups = []
  attr_accessor :id, :name, :members
  def initialize(name) 
    @name = name
    @members = []
    @@groups << self
  end

  def self.delete_contact(contact_id)
    @@groups.each do |group|
      group.members.each_with_index do |contact, index|
        group.members.delete_at(index) if contact.id = contact_id
      end
    end
  end

  def add_group_member(contact)
    @members << contact unless @members.include?(contact)
  end

  def save 
    if @id.nil?
      $db.execute(
        <<-SQL
        INSERT INTO groups 
        (name)
        VALUES
        ('#{@name}');
        SQL
        )
    else
      $db.execute(
        <<-SQL
        UPDATE groups 
        SET name = '#{@name}'
        WHERE id = '#{@id}';
        SQL
        )
    end
    @id = $db.last_insert_row_id unless @id
    save_group_members unless @members.empty?
  end

  def delete
    $db.execute_batch(
      <<-SQL 
      DELETE FROM groups
      WHERE id = '#{id}';

      DELETE FROM contacts_groups
      WHERE group_id = '#{id}';

      SQL
      )
  end

  private
  def save_group_members

    @members.each do |contact|
      contact.save if contact.id.nil?
      next if $db.execute("SELECT * FROM contacts_groups WHERE contact_id = '#{contact.id}' AND group_id = '#{@id}'").size > 0
      $db.execute(
        <<-SQL
        INSERT INTO contacts_groups
        (group_id, contact_id)
        VALUES
        ('#{@id}','#{contact.id}'); 
        SQL
        )
    end
  end

end


contact = Contact.new({first_name: "David",last_name: "Hanson",company: "37signals"})
puts contact.id
contact.save
puts contact.id

contact.first_name = "Bob"
contact.save
puts "whole table"
$db.execute("SELECT * FROM contacts WHERE id = 4;").each {|x| p x}

contact2 = Contact.new({first_name: "Winning",last_name:"TigersBlood",company:"CrazyTrain"})

group = Group.new('Brothers')
group.add_group_member(contact)
group.save
puts 
puts
$db.execute("SELECT * FROM groups WHERE id = 4;").each {|x| p x}
$db.execute("SELECT * FROM contacts_groups WHERE id = 4;").each {|x| p x}

group.add_group_member(contact2)
group.save
puts
puts
puts $db.execute("SELECT * FROM contacts WHERE id = 4;").each {|x| p x}
puts $db.execute("SELECT * FROM groups WHERE id = 4;").each {|x| p x}
puts $db.execute("SELECT * FROM contacts_groups WHERE id = 4;").each {|x| p x}

p group.members
contact2.delete
p group.members

