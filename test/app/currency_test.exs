defmodule App.CurrencyTest do
  use ExUnit.Case, async: true

  import App.CurrencyHelpers, only: [bypass_currency: 0]

  alias App.Currency

  describe "get_rates/0" do
    test "returns a response with currency rates" do
      Bypass.expect(bypass_currency(), fn conn ->
        Plug.Conn.resp(conn, 200, "")
      end)

      assert %Req.Response{status: 200} = Currency.get_rates()
    end
  end
end
