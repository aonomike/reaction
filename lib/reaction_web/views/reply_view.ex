defmodule ReactionWeb.ReplyView do
  use ReactionWeb, :view
  alias ReactionWeb.ReplyView

  def render("index.json", %{reactions: reactions}) do
    %{data: render_many(reactions, ReplyView, "reply.json")}
  end

  def render("show.json", %{reply: reply}) do
    %{data: render_one(reply, ReplyView, "reply.json")}
  end

  def render("reply.json", %{reply: reply}) do
    %{id: reply.id}
  end
end
