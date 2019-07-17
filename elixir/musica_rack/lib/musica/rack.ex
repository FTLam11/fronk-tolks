defmodule Musica.Rack do
  defstruct name: "Untitled Rack", stack: []

  def new(name) do
    %Musica.Rack{name: name}
  end

  def add_disc(rack, disc = %Musica.Release{}) do
    new_stack = [disc | rack.stack]

    %Musica.Rack{rack | name: rack.name, stack: new_stack}
  end

  def collection(rack) do
    rack.stack
    |> Enum.map(fn release -> release.title end)
  end
end
