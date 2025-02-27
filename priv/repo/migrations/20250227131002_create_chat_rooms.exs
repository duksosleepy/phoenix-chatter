defmodule PhoenixChatter.Repo.Migrations.CreateChatRooms do
  use Ecto.Migration

  def change do
    create table(:chat_rooms) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:chat_rooms, [:name])
  end
end
