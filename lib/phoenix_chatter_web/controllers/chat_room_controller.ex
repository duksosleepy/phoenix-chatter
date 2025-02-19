defmodule PhoenixChatterWeb.ChatRoomController do
  use PhoenixChatterWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
