defmodule ReactionWeb.ReplyControllerTest do
  use ReactionWeb.ConnCase

  alias Reaction.Cache

  @add_attrs %{
    type: "reaction",
    action: "add",
    content_id: "content-id-1",
    user_id: "user-id-1",
    reaction_type: "fire",   
  }

  @remove_attrs %{
    type: "reaction",
    action: "add",
    content_id: "content-id-1",
    user_id: "user-id-1",
    reaction_type: "fire",   
  }


  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "/reaction" do
    test "adds a fire reaction if action is add", %{conn: conn} do
      conn = post(conn, Routes.reply_path(conn, :create), reply: @add_attrs)
      
      # assert json_response(conn, 200)["data"] == []
    end
  end

end
