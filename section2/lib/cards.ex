defmodule Cards do

	def create_deck do
		values = ["Ace", "King", "Queen", "Five", "Four"]
		suits = ["Spades", "Diamonds", "Hearts", "Clubs" ]

		for suit <- suits, value <- values do
			"#{value} of #{suit}"
		end 

	end

	def shuffle(deck) do
		Enum.shuffle(deck)
	end

	def contains?(deck, card) do
		Enum.member?(deck, card)
	end

	def deal(deck, hand) do
		Enum.split(deck, hand)
	end

	def load(filename) do
		{status, binary} = File.read(filename)
		case File.read(filename) do
			{:ok, binary} -> :erlang.binary_to_term binary
			{:error, _reason} -> "That file does not exist #{_reason}"
		end
	end


end
