require 'spec_helper'

module Ordinalable
  ORDINAL_FORM = {
    1 => :first,
    2 => :second,
    3 => :third,
    4 => :fourth,
    5 => :fifth,
    6 => :sixth,
    7 => :seventh,
    8 => :eighth,
    9 => :ninth,
    10 => :tenth,
    11 => :eleventh,
    12 => :twelfth,
  }

  refine Integer do
    def to_o
      ORDINAL_FORM[self]
    end
  end
end

module XmasSongs
  class TwelveDays
    using Ordinalable

    DAY_TO_GIFTS = {
      1 => "A Partridge in a Pear Tree",
      2 => "2 Turtle Doves",
      3 => "3 French Hens",
      4 => "4 Calling Birds",
      5 => "5 Golden Rings",
      6 => "6 Geese a Laying",
      7 => "7 Swans a Swimming",
      8 => "8 Maids a Milking",
      9 => "9 Ladies Dancing",
      10 => "10 Lords a Leaping",
      11 => "11 Pipers Piping",
      12 => "12 Drummers Drumming"
    }

    class << self
      def lyrics
        1.upto(12).map { |num| verse(num) }.join("\n\n")
      end

      def verse(number)
        "On the #{number.to_o} day of Christmas my true love sent to me:\n" +
          gifts_for_day(number)
      end

      private

      def gifts_for_day(number)
        number.downto(1).map do |day_number|
          if number != 1 && day_number == 1
            "and #{DAY_TO_GIFTS[day_number].dup.tap { |str| str[0] = str[0].downcase }}"
          else
            DAY_TO_GIFTS[day_number]
          end
        end.join("\n")
      end
    end
  end
end

describe XmasSongs::TwelveDays do
  describe ".verse" do
    it "has a verse for the first day of Xmas" do
      verse = <<~LYRICS.chomp
        On the first day of Christmas my true love sent to me:
        A Partridge in a Pear Tree
      LYRICS

      song = XmasSongs::TwelveDays.verse(1)

      expect(song).to eq(verse)
    end

    it "has a verse for the second day of Xmas" do
      verse = <<~LYRICS.chomp
        On the second day of Christmas my true love sent to me:
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS

      song = XmasSongs::TwelveDays.verse(2)

      expect(song).to eq(verse)
    end

    it "has a verse for the third day of Xmas" do
      verse = <<~LYRICS.chomp
        On the third day of Christmas my true love sent to me:
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree
      LYRICS

      song = XmasSongs::TwelveDays.verse(3)

      expect(song).to eq(verse)
    end
  end

  describe ".song" do
    it "has lyrics" do
      full_lyrics = <<~COMPLETE_SONG.chomp
        On the first day of Christmas my true love sent to me:
        A Partridge in a Pear Tree

        On the second day of Christmas my true love sent to me:
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the third day of Christmas my true love sent to me:
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the fourth day of Christmas my true love sent to me:
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the fifth day of Christmas my true love sent to me:
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the sixth day of Christmas my true love sent to me:
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the seventh day of Christmas my true love sent to me:
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the eighth day of Christmas my true love sent to me:
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the ninth day of Christmas my true love sent to me:
        9 Ladies Dancing
        8 Maids a Milking
        7 Swans a Swimming
        6 Geese a Laying
        5 Golden Rings
        4 Calling Birds
        3 French Hens
        2 Turtle Doves
        and a Partridge in a Pear Tree

        On the tenth day of Christmas my true love sent to me:
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

        On the eleventh day of Christmas my true love sent to me:
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

        On the twelfth day of Christmas my true love sent to me:
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
      COMPLETE_SONG

      song = XmasSongs::TwelveDays.lyrics

      expect(song).to eq(full_lyrics)
    end
  end
end
