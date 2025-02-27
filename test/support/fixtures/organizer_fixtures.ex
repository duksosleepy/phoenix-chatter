defmodule PhoenixChatter.OrganizerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixChatter.Organizer` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        slug: "some slug",
        title: "some title"
      })
      |> PhoenixChatter.Organizer.create_room()

    room
  end
end
