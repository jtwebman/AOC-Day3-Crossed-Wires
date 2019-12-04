defmodule Point do
  defstruct x: 0, y: 0

  def new(x, y) do
    %Point{x: x, y: y}
  end
end
