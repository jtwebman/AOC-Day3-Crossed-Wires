defmodule Line do
  defstruct [:point1, :point2]

  def new(point1, point2) do
    %Line{point1: point1, point2: point2}
  end

  def next_point(%Point{x: x, y: y} = start, "D" <> distance) do
    %Line{point1: start, point2: Point.new(x, y - String.to_integer(distance))}
  end

  def next_point(%Point{x: x, y: y} = start, "U" <> distance) do
    %Line{point1: start, point2: Point.new(x, y + String.to_integer(distance))}
  end

  def next_point(%Point{x: x, y: y} = start, "R" <> distance) do
    %Line{point1: start, point2: Point.new(x + String.to_integer(distance), y)}
  end

  def next_point(%Point{x: x, y: y} = start, "L" <> distance) do
    %Line{point1: start, point2: Point.new(x - String.to_integer(distance), y)}
  end

  def intersection(line1, line2) do
    a1 = line1.point2.y - line1.point1.y
    b1 = line1.point1.x - line1.point2.x
    c1 = a1 * line1.point1.x + b1 * line1.point1.y

    a2 = line2.point2.y - line2.point1.y
    b2 = line2.point1.x - line2.point2.x
    c2 = a2 * line2.point1.x + b2 * line2.point1.y

    case a1 * b2 - a2 * b1 do
      determinant when determinant == 0 ->
        nil

      determinant ->
        Point.new(
          trunc((b2 * c1 - b1 * c2) / determinant),
          trunc((a1 * c2 - a2 * c1) / determinant)
        )
        |> point_on_line(line1)
        |> point_on_line(line2)
    end
  end

  def point_on_line(
        %Point{
          x: x,
          y: y3
        } = point,
        %Line{point1: %Point{x: x, y: y1}, point2: %Point{x: x, y: y2}}
      ) do
    case y1 <= y3 and y3 <= y2 do
      true ->
        point

      _ ->
        case y2 <= y3 and y3 <= y1 do
          true -> point
          _ -> nil
        end
    end
  end

  def point_on_line(
        %Point{
          x: x3,
          y: y
        } = point,
        %Line{point1: %Point{x: x1, y: y}, point2: %Point{x: x2, y: y}}
      ) do
    case x1 <= x3 and x3 <= x2 do
      true ->
        point

      _ ->
        case x2 <= x3 and x3 <= x1 do
          true -> point
          _ -> nil
        end
    end
  end

  def point_on_line(_, _) do
    nil
  end
end
