require 'date'
#let's put all students into an array
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]

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
def input_students2
  # create an empty array
  students = []
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
    students << student_hash
    puts "Now we have #{students.count} students"
  end
  # return the array of students
  students
end

###################################
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # puts students[students.count-1]
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

###################################
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

###################################
def print3(students)
  students.map {|student| student[:cohort] }.uniq.each do |cohort|
    puts "#{cohort} cohort"
    students.each do |student| 
      if student[:cohort] == cohort
        puts "#{student[:name]} #{student["hobbies"].to_s.center(20)} #{student["country of birth"].to_s.center(20)} #{student["height"].to_s.center(20)}"
      end
    end
  end
end
###################################
def print2(students)
#  first_letter =  start_letter()
  students.each_with_index do |student,index| 
#    if first_letter == student[:name][0] || first_letter == ""
    if student[:name].length < 12
     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) #{student["hobbies"].to_s.center(20)} #{student["country of birth"].to_s.center(20)} #{student["height"].to_s.center(20)}"
    end
  end
end
###################################
def print(students)
  i = 0
  while i < students.count
     puts "#{i}. #{students[i][:name]} (#{students[i][:cohort]} cohort)" 
     i += 1
  end
end
###################################
def print_footer(students)
  s = students.count != 1 ? "s" : ""
  puts "Overall, we have #{students.count} great student#{s}" 
end
###################################
def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print3(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end 
###################################
#nothing happens until we call the methods
#students = input_students2
#print_header
#print3(students)
#print_footer(students)

interactive_menu

