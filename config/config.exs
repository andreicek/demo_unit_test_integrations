import Config

config :app, App.Currency, base_url: "https://smartaccount.hr/api"

import_config "#{Mix.env()}.exs"
