defmodule Elixtagram.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixtagram,
       version: "0.3.0",
       elixir: ">= 1.2.3",
       build_embedded: Mix.env == :prod,
       start_permanent: Mix.env == :prod,
       description: description,
       package: package,
       test_coverage: [tool: ExCoveralls],
       deps: deps,
       docs: [extras: ["README.md"], main: "readme"]
    ]
  end

  def application do
    [applications: app_list(Mix.env)]
  end

  defp app_list(_), do: app_list
  defp app_list, do: [:logger, :httpoison, :oauth2]

  defp deps do
    [
      {:httpoison, "~> 0.9"},
      {:poison, "~> 1.0"},
      {:oauth2, "~> 0.7"},
      {:exvcr, "~> 0.8", only: [:dev, :test]},
      {:ex_doc, "~> 0.13", only: [:dev, :docs]},
      {:excoveralls, "~> 0.5", only: [:dev, :test]},
      {:inch_ex, "~> 0.5", only: [:dev, :docs]},
      {:credo, "~> 0.4", only: :dev}
    ]
  end

  defp description do
    """
    Instagram client library for Elixir.
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      keywords: ["Elixir", "Instagram", "REST", "HTTP"],
      maintainers: ["Zen Savona"],
      links: %{"GitHub" => "https://github.com/zensavona/elixtagram",
               "Docs" => "https://hexdocs.pm/elixtagram"}
    ]
  end
end
