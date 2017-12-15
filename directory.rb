###################################
@students = [] # an empty array accessible to all methods
def add_students(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
###################################
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name,:november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

###################################
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

###################################
def print_students_list
  i = 0
  while i < @students.count
     puts "#{i}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)" 
     i += 1
  end
end
###################################
def print_footer
  s = @students.count != 1 ? "s" : ""
  puts "Overall, we have #{@students.count} great student#{s}" 
end
##################################
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end
###################################
def show_students
  print_header
  print_students_list
  print_footer
end
###################################
def get_filename(action)
  puts "Enter the filename to be " + action  
  gets.chomp
end
###################################
def save_students
  # open the file for writing
  filename = get_filename("saved") 
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "#{filename} successfully saved"
end
###################################
def load_students(filename = get_filename("loaded") )
# filename = filename.empty? 
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name,cohort)
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end
###################################
def try_load_students
  filename = ARGV.first.nil? ? "students.csv" : ARGV.first
  if File.exists?(filename)
     load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
###################################
def process_menu_selection(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
###################################
def interactive_menu
  try_load_students
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. do what the user has asked
    process_menu_selection(STDIN.gets.chomp)
  end
end 
###################################
interactive_menu

