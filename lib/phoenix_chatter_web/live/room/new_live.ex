defmodule PhoenixChatterWeb.Room.NewLive do
  @moduledoc """
  LiveView for creating new chat rooms.
  """
  use PhoenixChatterWeb, :live_view
  alias PhoenixChatter.Repo
  alias PhoenixChatter.Room
  import PhoenixChatterWeb.CoreComponents

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-2xl mx-auto">
      <.header class="mb-8">
        Create a New Room
        <:subtitle>Set up a space for your conversations</:subtitle>
        
        <:actions>
          <.link
            navigate={~p"/rooms"}
            class="text-sm font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
          >
            <.icon name="hero-arrow-left-solid" class="h-3 w-3 mr-1" /> Back to rooms
          </.link>
        </:actions>
      </.header>
      
      <.simple_form :let={f} for={@changeset} phx-change="validate" phx-submit="save">
        <.input field={f[:title]} label="Room Title" placeholder="Enter a descriptive title" required />
        <.input
          field={f[:slug]}
          label="Room Slug (used in URL, e.g., /room/your-room-name)"
          placeholder="room-identifier"
          required
          phx-debounce="blur"
        />
        <:actions>
          <.link
            navigate={~p"/rooms"}
            class="text-sm font-semibold leading-6 text-zinc-900 hover:text-zinc-700 mr-3"
          >
            Cancel
          </.link>
          
          <.button phx-disable-with="Creating...">
            Create Room
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> put_changeset()}
  end

  @impl true
  def handle_event("validate", %{"room" => room_params}, socket) do
    {:noreply, socket |> put_changeset(room_params)}
  end

  @impl true
  def handle_event("save", %{"room" => room_params}, socket) do
    changeset = Room.changeset(%Room{}, room_params)

    case Repo.insert(changeset) do
      {:ok, room} ->
        {:noreply,
         socket
         |> put_flash(:info, "Room \"#{room.title}\" created successfully")
         |> push_navigate(to: ~p"/room/#{room.slug}")}

      {:error, changeset} ->
        error_message = get_error_message(changeset)

        {:noreply,
         socket
         |> assign(:changeset, changeset)
         |> put_flash(:error, error_message)}
    end
  end

  defp put_changeset(socket, params \\ %{}) do
    socket
    |> assign(:changeset, Room.changeset(%Room{}, params))
  end

  defp get_error_message(changeset) do
    cond do
      Keyword.has_key?(changeset.errors, :slug) ->
        "The room slug is invalid or already taken."

      Keyword.has_key?(changeset.errors, :title) ->
        "Please provide a valid room title."

      true ->
        "Could not create the room. Please check your input."
    end
  end
end
