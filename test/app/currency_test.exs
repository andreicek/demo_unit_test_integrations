defmodule App.CurrencyTest do
  use ExUnit.Case, async: true

  alias App.Currency

  describe "get_rates/0" do
    test "returns a response with currency rates" do
      assert %Req.Response{status: 200} = Currency.get_rates()
    end
  end
end
