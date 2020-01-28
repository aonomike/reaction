defmodule ReactionWeb.ReplyController do
  use ReactionWeb, :controller

  alias Reaction.Cache


  # action_fallback ReactionWeb.FallbackController

  def create(conn,  %{"reply" => reply_params}) do
    case reply_params do
      %{"action"=> "add"} ->  
        {:ok, _} = Cache.start_link()
        Cache.add(reply_params["content_id"], reply_params["user_id"])
        render(conn, "show.json", reply: %{ content_id: reply_params["content_id"]})

      %{"action"=> "remove"}
      {:ok, _} = Cache.start_link()
      Cache.remove(reply_params["content_id"], reply_params["user_id"])
      render(conn, "show.json", reply: %{ content_id: reply_params["content_id"]})
    end
  end
end
