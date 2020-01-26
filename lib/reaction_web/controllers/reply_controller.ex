defmodule ReactionWeb.ReplyController do
  use ReactionWeb, :controller


  action_fallback ReactionWeb.FallbackController

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
