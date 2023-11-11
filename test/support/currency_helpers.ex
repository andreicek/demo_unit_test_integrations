Mox.defmock(App.Currency.TestBaseUrl, for: App.Currency.BaseUrl)

defmodule App.CurrencyHelpers do
  def bypass_response(fixture_name) do
    fixture = File.read!("test/support/fixtures/request_recordings/#{fixture_name}.json")

    Bypass.expect(bypass_currency(), fn conn ->
      conn
      |> Plug.Conn.put_resp_content_type("application/json")
      |> Plug.Conn.resp(200, fixture)
    end)
  end

  ###

  defp bypass_currency() do
    bypass = Bypass.open()
    url = "http://localhost:#{bypass.port}"
    Mox.expect(App.Currency.TestBaseUrl, :get_base_url, fn -> url end)
    bypass
  end
end
