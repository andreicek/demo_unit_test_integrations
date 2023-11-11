Mox.defmock(App.Currency.TestBaseUrl, for: App.Currency.BaseUrl)

defmodule App.CurrencyHelpers do
  def bypass_currency() do
    bypass = Bypass.open()
    url = "http://localhost:#{bypass.port}"
    Mox.expect(App.Currency.TestBaseUrl, :get_base_url, fn -> url end)
    bypass
  end
end
