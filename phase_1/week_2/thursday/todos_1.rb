require 'yaml'

class Task
  attr_accessor :done, :name
  def initialize(name)
    @name = name 
    @done = false
  end

  def mark_complete
    @done = true
  end

  def print(id)
    if @done
      puts "#{id}. [X]  #{@name}" 
    else
      puts "#{id}. [ ]  #{@name}" 
    end
  end

end


class List
  attr_accessor :task_list
  def initialize(task_list=[])
    @task_list = task_list
  end

  def save_to_file
    File.open('./task_list.yml','w') do |config|
      config.puts @task_list.to_yaml
    end
  end

  def load_file
    @task_list = YAML::load(File.open('./task_list.yml','r'))
  end

  def add_task(name)
    @task_list << Task.new(name)
    puts 'Appended "' + name + '" to your TODO list...'
  end 

  def get_task_by_id(id)
    @task_list[id-1]
  end

  def delete_task(id)
    @task_list.delete_at(id-1)
    puts 'Deleted "' + @task_list[id].name + '" from your TODO list...'
  end

  def complete_task(id)
    @task_list[id-1].mark_complete
    puts 'Marked "' + @task_list[id].name + '" in your TODO list to complete...'
  end

  def print_list
    @task_list.each_with_index {|task, index| task.print(index+1)}
  end

  def print_help
    puts "These are the available commands : "
    commands = ["help","list","add (description)","delete (task id)","complete (task id)"]
    puts commands
  end
end

list = List.new
list.load_file if File.exist?('./task_list.yml')


if ARGV.empty?
  puts "If you need help, type help for a list of commands... \nor yell 'ANNNE!! ANNEE!!!' loudly" 
else
  case ARGV[0] 
  when  "help" then list.print_help
  when  "add" then list.add_task(ARGV[1..-1].join(' '))
  when  "delete" then list.delete_task(ARGV[1].to_i)
  when  "complete" then list.complete_task(ARGV[1].to_i)
  when  "list" then list.print_list
  else puts "Unknown command, please try again or type 'help'."
  end
end
list.save_to_file

