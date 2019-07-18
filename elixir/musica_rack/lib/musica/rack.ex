defmodule Musica.Rack do
  defstruct stack: []

  def new do
    %Musica.Rack{}
  end

  def add_disc(rack, disc = %Musica.Release{}) do
    new_stack = [disc | rack.stack]

    %Musica.Rack{rack | stack: new_stack}
  end

  def collection(rack) do
    rack.stack
    |> Enum.map(fn release -> release.title end)
  end
end
