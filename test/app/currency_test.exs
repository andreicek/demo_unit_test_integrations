defmodule App.CurrencyTest do
  use ExUnit.Case, async: true

  import App.CurrencyHelpers, only: [bypass_response: 1]

  alias App.Currency

  describe "get_rates/0" do
    test "returns a response with currency rates" do
      bypass_response("currency_response")

      assert %Req.Response{status: 200} = Currency.get_rates()
    end
  end
end
