defmodule PhoenixChatter.Repo.Migrations.DropChatRooms do
  use Ecto.Migration

  def change do
    drop_if_exists table(:chat_rooms)
    drop_if_exists index(:chat_rooms, [:name])
  end
end
