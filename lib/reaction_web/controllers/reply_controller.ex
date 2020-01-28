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


  # def content_count(conn, params) do
  #   {:ok, _} = Cache.start_link()
  #   # count = Cache.counter(reply_params["content_id"], reply_params["user_id"])
  #   render(conn, "count.json", reply: %{ content_id: reply_params["content_id"], count: count})
  # end
  # def index(conn, _params) do
  #   reactions = Posts.list_reactions()
  #   render(conn, "index.json", reactions: reactions)
  # end

  # def create(conn, %{"reply" => reply_params}) do
  #   with {:ok, %Reply{} = reply} <- Posts.create_reply(reply_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.reply_path(conn, :show, reply))
  #     |> render("show.json", reply: reply)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   reply = Posts.get_reply!(id)
  #   render(conn, "show.json", reply: reply)
  # end

  # def update(conn, %{"id" => id, "reply" => reply_params}) do
  #   reply = Posts.get_reply!(id)

  #   with {:ok, %Reply{} = reply} <- Posts.update_reply(reply, reply_params) do
  #     render(conn, "show.json", reply: reply)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   reply = Posts.get_reply!(id)

  #   with {:ok, %Reply{}} <- Posts.delete_reply(reply) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
