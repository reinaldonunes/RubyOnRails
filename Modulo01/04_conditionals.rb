#IF
x = 2

if x <= 2
    puts "Number"
end

#IF ELSE

if x <= 2
    puts "Number"
else
    puts "Big Number"
end

#UNLESS
unless x > 2
    puts "Big Number"
else
    puts "Normal number"
end

#Ternary
x = "m" ? puts "Male" : puts "Female"

#CASE
x = 3
case x
    when 1
        puts "One"
    when 2
        puts "Two"
    when 3
        puts "Three"
end

#EACH
x.each do |y|
    puts y
end

#WHILE
while x < 3
    puts "Number" + x
end