defmodule App.CurrencyTest do
  use ExUnit.Case, async: true

  alias App.Currency

  describe "get_rates/0" do
    setup do
      bypass = Bypass.open()
      {:ok, bypass: bypass}
    end

    test "returns a response with currency rates", %{bypass: bypass} do
      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 200, "")
      end)

      assert %Req.Response{status: 200} = Currency.get_rates()
    end
  end
end
