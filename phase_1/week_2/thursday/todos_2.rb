require 'yaml'

class Task
  attr_accessor :done, :name, :tags
  def initialize(name)
    @name = name 
    @done = false
    @tags = []
  end

  def mark_complete
    @done = true
  end

  def add_tag(tag)
    @tags << tag if has_tag?(tag)
  end

  def print_tags
    tags.each {|tag| print "[#{tag}] "} 
    puts
  end

  def has_tag?(tag)
    @tags.include?(tag)
  end

  def done?
    @done
  end

  def print_task(id)
    if @done
      print "#{id}. [X]  #{@name} "
      @tags.empty? ? puts : print_tags
    else
      print "#{id}. [ ]  #{@name} " 
      @tags.empty? ? puts : print_tags
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

  def add_tags(index, tags)
    tags.each {|tag| @task_list[index].add_tag(tag)}
    puts 'Tagging task "' + @task_list[index].name + '" with tags: ' + tags.join(', ')
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

  def delete_task(index)
    @task_list.delete_at(index)
    puts 'Deleted "' + @task_list[index].name + '" from your TODO list...'
  end

  def complete_task(index)
    @task_list[index].mark_complete
    puts 'Marked "' + @task_list[index].name + '" in your TODO list to complete...'
  end

  def print_list()
    @task_list.each_with_index {|task, index| task.print_task(index+1)}
  end

  def print_list_by(tag)
    if tag == "outstanding" || tag == "completed"
      compile_completion_list(tag)
    else
      print_list(@task_list.select {|task| task.has_tag?(tag) })
    end
  end

  def print_help
    puts "These are the available commands : "
    commands = ["help","list","add (description)","delete (task id)","complete (task id)"]
    puts commands
  end


  private
  def compile_completion_list(tag)
    if tag == "outstanding"
      resulting_list = @task_list.select {|task| !task.done?} 
    else
      resulting_list = @task_list.select {|task| task.done?}
    end
    resulting_list = get_ids(resulting_list)
    print_list_with_ids(resulting_list)

  end

  def get_ids(list)
    list_with_ids = []
    list.each_index do |index|
      list_with_ids[index] = [list[index], @task_list.find_index(list[index]) + 1]
    end
    list_with_ids
  end

  def print_list_with_ids(list)
    list.each do |task, id|
      task.print_task(id)
    end
  end
end

list = List.new
list.load_file if File.exist?('./task_list.yml')


if ARGV.empty?
  puts "If you need help, type help for a list of commands... \n or yell 'ANNNE!! ANNEE!!!' loudly" 
else
  if ARGV[0].include?(":")
    case_check, argument = ARGV[0].split(/:/)
    case case_check
    when  "help" then list.print_help
    when  "add" then list.add_task(ARGV[1..-1].join(' '))
    when  "delete" then list.delete_task(ARGV[1].to_i - 1)
    when  "complete" then list.complete_task(ARGV[1].to_i - 1)
    when  "list" then list.print_list_by(argument)
    else puts "Unknown command, please try again or type 'help'."
    end
  else
    case ARGV[0]
    when  "help" then list.print_help
    when  "add" then list.add_task(ARGV[1..-1].join(' '))
    when  "delete" then list.delete_task(ARGV[1].to_i - 1)
    when  "complete" then list.complete_task(ARGV[1].to_i - 1)
    when  "tag" then list.add_tags(ARGV[1].to_i - 1,ARGV[2..-1])
    when  "list" then list.print_list
    else puts "Unknown command, please try again or type 'help'."
    end
  end

end
list.save_to_file

