defmodule Reaction.Repo do
  use Ecto.Repo,
    otp_app: :reaction,
    adapter: Ecto.Adapters.Postgres
end
