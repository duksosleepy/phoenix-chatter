defmodule PhoenixChatterWeb.Room.ShowLive do
  @moduledoc """
  A LiveView for creating and joining chat rooms.
  """

  use PhoenixChatterWeb, :live_view

  alias PhoenixChatter.Organizer

  @impl true
  def render(assigns) do
    ~H"""
    <h1>{@room.title}</h1>
    """
  end

  @impl true
  def mount(%{"slug" => slug}, _session, socket) do
    case Organizer.get_room(slug) do
      nil ->
        {:ok,
         socket
         |> put_flash(:error, "That room does not exist.")
         |> push_navigate(to: ~p"/room/new")}

      room ->
        {:ok,
         socket
         |> assign(:room, room)}
    end
  end
end
