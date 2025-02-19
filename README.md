# Manual Setup
1. Install `Elixir/OTP` from https://elixir-lang.org/install.html#windows

2. Install/Upgrade package

```bash
mix local.hex
mix archive.install hex phx_new
```


# Testing
1. For Selenium: Install [Selenium Manager](https://github.com/SeleniumHQ/selenium_manager_artifacts), [Selenium Server](https://github.com/SeleniumHQ/selenium/releases/), [Geckodriver](https://github.com/mozilla/geckodriver/releases)

2. For Chromium: Install Chrome and [Chromedriver](https://googlechromelabs.github.io/chrome-for-testing) ( Working only in linux :D )

# Run project
To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
