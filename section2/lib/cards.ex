defmodule Cards do
	@moduledoc """
	  Provides methods for creating and handling a deck of cards
	"""


	@doc """
	  Returns a list of strings representing a deck of cards
	"""
	def create_deck do
		values = ["Ace", "King", "Queen", "Five", "Four"]
		suits = ["Spades", "Diamonds", "Hearts", "Clubs" ]

		for suit <- suits, value <- values do
			"#{value} of #{suit}"
		end 

	end

	@doc """
	  Returns shuffled deck

	  ## Examples
			iex> deck = Cards.create_deck
			iex> shuffle(deck)

	"""
	def shuffle(deck) do
		Enum.shuffle(deck)
	end

	def contains?(deck, card) do
		Enum.member?(deck, card)
	end

	def deal(deck, hand_size) do
		Enum.split(deck, hand_size)
	end

	def load(filename) do
		case File.read(filename) do
			{:ok, binary} -> :erlang.binary_to_term binary
			{:error, reason} -> "Error loading file. Reason: #{reason}"
		end
	end

	def generate_hand(hand_size) do
		Cards.create_deck
		|> Cards.shuffle
		|> Cards.deal(hand_size)
	end


end
