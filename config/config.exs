import Config

config :app, App.Currency, base_url: App.Currency.ProdBaseUrl

import_config "#{Mix.env()}.exs"
