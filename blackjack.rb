# Create an empty deck of cards
deck = []

# Add cards
begin
  suits = ["spade", "club", "heart", "diamond"]
  faces_and_values = [ 
    {face: "A", value: 1}, {face: "2", value: 2}, {face: "3", value: 3},
    {face: "4", value: 4}, {face: "5", value: 5}, {face: "6", value: 6}, 
    {face: "7", value: 7}, {face: "8", value: 8}, {face: "9", value: 9}, 
    {face: "10", value: 10}, {face: "J", value: 10}, {face: "Q", value: 10},
    {face: "K", value: 10}
]

  suits.each do |s|
    faces_and_values.each do |pair|
      deck.push({suit: s, face: pair[:face], value: pair[:value]})
    end
  end
p deck

end



