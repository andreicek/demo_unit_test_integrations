defmodule App.Currency do
  defmodule BaseUrl do
    @callback get_base_url() :: binary()
  end

  defmodule ProdBaseUrl do
    @behaviour BaseUrl

    @impl BaseUrl
    def get_base_url, do: "https://smartaccount.hr/api"
  end

  def get_rates do
    url = base_url() <> "/rates?currency=USD"

    Req.get!(url)
  end

  ###

  defp base_url, do: Keyword.fetch!(env(), :base_url).get_base_url()
  defp env, do: Application.fetch_env!(:app, __MODULE__)
end
