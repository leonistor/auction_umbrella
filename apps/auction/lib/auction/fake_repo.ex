defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "Ana are mere",
      description: "lorem ipsum dolor siat amet",
      ends_at: ~N[2020-05-01 00:00:00]
    },
    %Item{
      id: 2,
      title: "WarGames Blueray",
      description: "The best computer movie on Blueray",
      ends_at: ~N[2020-04-17 12:00:00]
    },
    %Item{
      id: 1,
      title: "U2 - Achtung Baby CD",
      description: "sound of men chopping",
      ends_at: ~N[2019-05-01 04:00:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id === id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(attrs), fn key ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end

