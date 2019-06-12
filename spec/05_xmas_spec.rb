require 'spec_helper'

module XmasSongs
  class TwelveDays
    def self.lyrics
    end

    def self.verse(number)
      if number == 1
        "On the first day of Christmas my true love sent to me:\n" +
          "A Partridge in a Pear Tree"
      else
        "On the second day of Christmas my true love sent to me:\n" +
          "2 Turtle Doves\n" +
          "and a Partridge in a Pear Tree"
      end
    end
  end
end

describe XmasSongs::TwelveDays do
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

  xit "has lyrics" do
    <<~COMPLETE_SONG
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
  end
end

