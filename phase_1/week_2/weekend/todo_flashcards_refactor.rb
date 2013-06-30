# original gist : https://gist.github.com/dbc-challenges/f9bf2e3be521b302c412

# Three gists I looked at :
# https://gist.github.com/Tambling/e8e78444a795dc1974bc
# https://gist.github.com/seaseng/9c9cb43fe914e50134f9
# https://gist.github.com/laumontemayor/7df8177d580146a189c4

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

  def add(name)
    @task_list << Task.new(name.join(' '))
    puts 'Appended "' + name.join(' ') + '" to your TODO list...'
  end 

  def get_task_by_id(id)
    @task_list[id.first.to_i-1]
  end

  def delete(id)
    @task_list.delete_at(id.first.to_i-1)
    puts 'Deleted "' + @task_list[id.first.to_i-1].name + '" from your TODO list...'
  end

  def complete(id)
    @task_list[id.first.to_i - 1].mark_complete
    puts 'Marked "' + @task_list[id.first.to_i-1].name + '" in your TODO list to complete...'
  end

  def list(_unused)
    @task_list.each_with_index {|task, index| task.print(index+1)}
  end

  def help
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
	list.send(ARGV[0],ARGV[1..-1])
end
list.save_to_file

# Using self.send I deleted over ten lines of code. One tradeoff was having
# to add things like argument.first.to_i in the methods because of the way 
# that I was sending in the arguments. This helps with OO by reducing the
# need for driver code and placing that responsibilities on the objects.










