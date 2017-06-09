fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# => "fiiiissshhhhhh"
def sluggish_octopus(fish)
  longest_fish = nil
  fish.each do |fish1|
    longest_fish = fish1 if longest_fish.nil?
    longest_fish = fish1 if longest_fish.length < fish1.length
  end
  longest_fish
end

def donimnant_octopus

end

def clever_octopus

end

def dancing_octopus

end

p sluggish_octopus(fish)
