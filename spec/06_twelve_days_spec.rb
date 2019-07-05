require 'spec_helper'

# Input: day number
# Loop through each day
# Ouput: verse for the requested day number


class XmasSongs
  def self.verse(day_number)
    if day_number == 1
      <<~LYRICS
        On the first day of Christmas
        my true love sent to me:
        A Partridge in a Pear Tree
      LYRICS
    else
      <<~LYRICS
        On the second day of Christmas
        my true love sent to me:
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS
    end
  end

  def self.ordinal_form(number)
    'first'
  end
end

describe XmasSongs do
  describe 'ordinal_form' do
    it 'gives the ordinal form for 1' do
      ordinal_number = XmasSongs.ordinal_form(1)

      expect(ordinal_number).to eq 'first'
    end
  end

  describe "verse" do
    it 'has lyrics for the first day' do
      verse_lyrics = XmasSongs.verse(1)

      lyrics = <<~LYRICS
        On the first day of Christmas
        my true love sent to me:
        A Partridge in a Pear Tree
      LYRICS

      expect(verse_lyrics).to eq lyrics
    end

    it 'has lyrics for the second day' do
      verse_lyrics = XmasSongs.verse(2)

      lyrics = <<~LYRICS
        On the second day of Christmas
        my true love sent to me:
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS

      expect(verse_lyrics).to eq lyrics
    end

    it 'has lyrics for the third day' do
      verse_lyrics = XmasSongs.verse(3)

      lyrics = <<~LYRICS
        On the third day of Christmas
        my true love sent to me:
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS

      expect(verse_lyrics).to eq lyrics
    end
  end
end
