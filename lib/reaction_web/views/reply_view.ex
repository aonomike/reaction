defmodule ReactionWeb.ReplyView do
  use ReactionWeb, :view
  alias ReactionWeb.ReplyView

  def render("index.json", %{reactions: reactions}) do
    %{data: render_many(reactions, ReplyView, "reply.json")}
  end

  def render("show.json", %{reply: reply}) do
    %{ content_id: reply.content_id }
  end

  def render("reply.json", %{reply: reply}) do
    %{id: reply.id}
  end

  def render("count.json", %{reply: reply}) do
    %{ content_id: reply.content_id, count: reply.id}
  end
end
