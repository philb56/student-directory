#In the input_students method the cohort value is hard-coded. 
#  How can you ask for both the name and the cohort? 
# What if one of the values is empty? 
# Can you supply a default value? 
# The input will be given to you as a string? 
# How will you convert it to a symbol? 
# What if the user makes a typo?
require 'date'
def get_cohort
  valid_cohorts = ["january","february","march","april","may","june","july","august","september","october","november","december"]
  while true  
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
def start_letter
  puts "Enter start letter"
  gets.chomp
end
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
    name = gets.chomp
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

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print2(students)
#  first_letter =  start_letter()
 puts students
  students.each_with_index do |student,index| 
#    if first_letter == student[:name][0] || first_letter == ""
    if student[:name].length < 12
     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) #{student["hobbies"].to_s.center(20)} #{student["country of birth"].to_s.center(20)} #{student["height"].to_s.center(20)}"
    end
  end
end
def print(students)
  i = 0
  while i < students.count
     puts "#{i}. #{students[i][:name]} (#{students[i][:cohort]} cohort)" 
     i += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students2
print_header
print2(students)
print_footer(students)
