defmodule Musica.Release do
  defstruct title: "Untitled title", year: 2019, artist: "Untitled artist"

  def new(%{title: title, year: year, artist: artist}) do
    %Musica.Release{title: title, year: year, artist: artist}
  end
end
