defmodule App.Currency do
  def get_rates do
    url = base_url() <> "/rates?currency=USD"

    Req.get!(url)
  end

  ###

  defp base_url, do: Keyword.fetch!(env(), :base_url)
  defp env, do: Application.fetch_env!(:app, __MODULE__)
end
