#WITHOUT PARAMS
class Rails
    def prog
        "Rails"
    end
end

x = Rails.new
puts x.prog

# WITH PARAMS
class Speaker
    def speak(sound)
        "Sound #{sound}"
    end
end

y = Speaker.new
puts y.speak(voice)

#WITH INITIALIZE
class Loader
    def initialize
        puts "Loading..."
    end
end