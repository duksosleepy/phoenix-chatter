defmodule PhoenixChatterWeb.UserVisitsHomepageTest do
  use PhoenixChatterWeb.FeatureCase, async: true

  test "user can visit homepage", %{session: session} do
    session
    |> visit("/")
    |> assert_has(Query.css(".title", text: "Welcome to Chatter!"))
  end
end
