# test/support/feature_case.ex
defmodule PhoenixChatterWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL
      alias PhoenixChatterWeb.Router.Helpers, as: Routes

      @endpoint PhoenixChatterWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PhoenixChatter.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PhoenixChatter.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(PhoenixChatter.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
