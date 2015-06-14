require 'Pry'


player_hand = {cards: [], total: 0, name: "Player"}
dealer_hand = {cards: [], total: 0, name: "Dealer"}

# Add cards to deck
def make_deck
  new_deck = []
  suits = ["spades", "clubs", "hearts", "diamonds"]
  faces_and_values = [ 
    {face: "A", value: 11}, {face: "2", value: 2}, {face: "3", value: 3},
    {face: "4", value: 4}, {face: "5", value: 5}, {face: "6", value: 6}, 
    {face: "7", value: 7}, {face: "8", value: 8}, {face: "9", value: 9}, 
    {face: "10", value: 10}, {face: "J", value: 10}, {face: "Q", value: 10},
    {face: "K", value: 10}
]

  suits.each do |s|
    faces_and_values.each do |pair|
      new_deck.push({suit: s, face: pair[:face], value: pair[:value]})
    end
  end

  new_deck.shuffle! # Returns a new shuffled deck
end

def draw_table(player_hand, dealer_hand)
  system "clear"
  puts "--------Dealer--------\n\n"
  dealer_hand[:cards].each do |card|
    print "#{card[:face]}\s\s"
  end
  print "\s\s\sTotal => #{dealer_hand[:total]}"
  puts "\n"

  puts "--------Player--------\n\n"
  player_hand[:cards].each do |card|
    print "#{card[:face]}\s\s"
  end
  print "\s\s\sTotal => #{player_hand[:total]}"
  puts "\n"

end

# Creates a new shuffled deck
deck = make_deck


def deal_card(deck, hand)
  if deck.length > 0
    hand[:cards] << deck.shift
    new_card = hand[:cards].last
    puts "#{hand[:name]} draws a #{new_card[:face]} of #{new_card[:suit]}"
    hand[:total] += new_card[:value]
    # If hand is going to bust becuase it contains an ace
    #  hand total is reduced by 10 (ace is counted as 1)
    if hand[:total] > 21 
      hand[:cards].each do |card|
        if card[:face] == "A"
        hand[:total] -= 10
        end
      end
    end

  else
    deck = make_deck
    deal_player_card(hand)
  end
end

def bust(hand)
  if true #hand[:total] > 21
    puts "#{hand[:name]} busts!"
     return true
  end
end

def initial_deal(deck, player_hand, dealer_hand)
  2.times do
    deal_card(deck, player_hand)
    deal_card(deck, dealer_hand)
  end
  draw_table(player_hand, dealer_hand)
end

def ask_to_draw(deck, player_hand)
  begin
    puts "Do you want to draw a card? (Y/N)"
    input = gets.chomp.downcase
  end until input == "y" || input == "n"

  if input == "y"
    deal_card(deck, player_hand)
  else
    puts "Pass to dealer"
  end

end

initial_deal(deck, player_hand, dealer_hand)

end_game = false

# binding.pry

begin
  ask_to_draw(deck, player_hand)
  draw_table(player_hand, dealer_hand)

end until bust(player_hand)






