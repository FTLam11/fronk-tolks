defmodule Musica.System do
  def start_link do
    Supervisor.start_link(
      [
        Musica.Database,
        Musica.Cache,
      ],
      strategy: :one_for_one
    )
  end
end
