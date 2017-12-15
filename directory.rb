require 'date'
@students = [] # an empty array accessible to all methods

###################################
def get_valid_cohorts
  ["january","february","march","april","may","june","july","august","september","october","november","december"]
end

###################################
def get_cohort
  while true  
    valid_cohorts = get_valid_cohorts
    default_cohort = Date.today.strftime("%B").downcase 
    puts "Enter cohort (#{default_cohort })"
    cohort = gets.chomp
    
  
    if cohort == ""
      cohort = default_cohort
    end

    break if valid_cohorts.include?(cohort)
    puts "#{cohort} is not a valid cohort" 
  end

  return cohort.to_sym
end

###################################
def start_letter
  puts "Enter start letter"
  gets.chomp
end

###################################
def input_students_full
  # create an empty array
  attributes = ["hobbies","country of birth", "height"]
  # get the first name
  name = ""
  # while the name is not empty, repeat this code
  while true do

    # get another name from the user
    puts "Please enter the student's name"
    puts "To finish, just hit return twice"
    name = gets
    name = name.slice(0,name.length-1) # no idea if this was the function intended
    break if name == ""
    student_hash = {}
    student_hash [:name]=  name
    student_hash [:cohort] = get_cohort  
 
    attributes.each do |value|
      puts "Enter #{name}'s  #{value}"
      student_hash[value] = gets.chomp 
    end   
    # add the student hash to the array
    @students << student_hash
    puts "Now we have #{@students.count} students"
  end
end

###################################
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # puts @students[@students.count-1]
    # get another name from the user
    name = gets.chomp
  end
end

###################################
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

###################################
def print_print_students_list_full
  @students.map {|student| student[:cohort] }.uniq.each do |cohort|
    puts "#{cohort} cohort"
    @students.each do |student| 
      if student[:cohort] == cohort
        puts "#{student[:name]} #{student["hobbies"].to_s.center(20)} #{student["country of birth"].to_s.center(20)} #{student["height"].to_s.center(20)}"
      end
    end
  end
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
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
###################################
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
###################################
def process(selection)
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
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. do what the user has asked
    process(gets.chomp)
  end
end 
###################################
interactive_menu

