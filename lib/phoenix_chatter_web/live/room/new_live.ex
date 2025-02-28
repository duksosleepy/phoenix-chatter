defmodule PhoenixChatterWeb.Room.NewLive do
  use PhoenixChatterWeb, :live_view

  alias PhoenixChatter.Repo
  alias PhoenixChatter.Room
  import PhoenixChatterWeb.CoreComponents

  @impl true
  def render(assigns) do
    ~H"""
    <h1>Create a New Room</h1>

    <.form for={@changeset} phx-change="validate" phx-submit="save">
      <.input field={@changeset[:title]} placeholder="Title" />
      <.input field={@changeset[:slug]} placeholder="room-slug" />
      <.button type="submit">Save</.button>
    </.form>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> put_changeset()}
  end

  @impl true
  def handle_event("validate", %{"room" => room_params}, socket) do
    {:noreply,
     socket
     |> put_changeset(room_params)}
  end

  def handle_event("save", _, %{assigns: %{changeset: changeset}} = socket) do
    case Repo.insert(changeset) do
      {:ok, room} ->
        {:noreply,
         socket
         |> push_navigate(to: ~p"/rooms/#{room.slug}")}

      {:error, changeset} ->
        {:noreply,
         socket
         |> assign(:changeset, changeset)
         |> put_flash(:error, "Could not save the room.")}
    end
  end

  defp put_changeset(socket, params \\ %{}) do
    socket
    |> assign(:changeset, Room.changeset(%Room{}, params))
  end
end
