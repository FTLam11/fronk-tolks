require 'spec_helper'

class XmasSongs
  def self.lyrics
    1.upto(12).map { |day_number| verse(day_number) }.join("\n")
  end

  def self.verse(day_number)
    <<~LYRICS
      On the #{ordinal_form(day_number)} day of Christmas
      my true love sent to me:
      #{gifts(day_number)}
    LYRICS
  end

  def self.gifts(day_number)
    if day_number == 1
      'A Partridge in a Pear Tree'
    else
      [
        '12 Drummers Drumming',
        '11 Pipers Piping',
        '10 Lords a Leaping',
        '9 Ladies Dancing',
        '8 Maids a Milking',
        '7 Swans a Swimming',
        '6 Geese a Laying',
        '5 Golden Rings',
        '4 Calling Birds',
        '3 French Hens',
        '2 Turtle Doves',
        'and a Partridge in a Pear Tree'
      ][(12 - day_number)..-1].join("\n")
    end
  end

  def self.ordinal_form(number)
    dictionary = {
      1 => 'first',
      2 => 'second',
      3 => 'third',
      4 => 'fourth',
      5 => 'fifth',
      6 => 'sixth',
      7 => 'seventh',
      8 => 'eighth',
      9 => 'ninth',
      10 => 'tenth',
      11 => 'eleventh',
      12 => 'twelfth',
    }

    dictionary[number]
  end
end

describe XmasSongs do
  describe 'ordinal_form' do
    it 'gives the ordinal form for the numbers 1-12' do
      dictionary = {
        1 => 'first',
        2 => 'second',
        3 => 'third',
        4 => 'fourth',
        5 => 'fifth',
        6 => 'sixth',
        7 => 'seventh',
        8 => 'eighth',
        9 => 'ninth',
        10 => 'tenth',
        11 => 'eleventh',
        12 => 'twelfth',
      }

      (1..12).each do |number|
        ordinal_number = XmasSongs.ordinal_form(number)

        expect(ordinal_number).to eq dictionary[number]
      end
    end

    it 'returns nil for any number outside of 1-12' do
      ordinal_number = XmasSongs.ordinal_form(0)

      expect(ordinal_number).to eq nil
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

    it 'has lyrics for the twelfth day' do
      verse_lyrics = XmasSongs.verse(12)

      lyrics = <<~LYRICS
        On the twelfth day of Christmas
        my true love sent to me:
        12 Drummers Drumming
        11 Pipers Piping
        10 Lords a Leaping
        9 Ladies Dancing
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS

      expect(verse_lyrics).to eq lyrics
    end
  end

  describe 'lyrics' do
    it 'gives the full lyrics for Twelve Days of Xmas' do

      full_song = XmasSongs.lyrics

      lyrics = <<~LYRICS
        On the first day of Christmas
        my true love sent to me:
        A Partridge in a Pear Tree

        On the second day of Christmas
        my true love sent to me:
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the third day of Christmas
        my true love sent to me:
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the fourth day of Christmas
        my true love sent to me:
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the fifth day of Christmas
        my true love sent to me:
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the sixth day of Christmas
        my true love sent to me:
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the seventh day of Christmas
        my true love sent to me:
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the eighth day of Christmas
        my true love sent to me:
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the ninth day of Christmas
        my true love sent to me:
        9 Ladies Dancing
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the tenth day of Christmas
        my true love sent to me:
        10 Lords a Leaping
        9 Ladies Dancing
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the eleventh day of Christmas
        my true love sent to me:
        11 Pipers Piping
        10 Lords a Leaping
        9 Ladies Dancing
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the twelfth day of Christmas
        my true love sent to me:
        12 Drummers Drumming
        11 Pipers Piping
        10 Lords a Leaping
        9 Ladies Dancing
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS

      expect(full_song).to eq lyrics
    end
  end
end
