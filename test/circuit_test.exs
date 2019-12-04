defmodule CircuitTest do
  use ExUnit.Case

  test "test1" do
    commands1 = ["R8", "U5", "L5", "D3"]
    commands2 = ["U7", "R6", "D4", "L4"]
    assert Circuit.solve_part1(commands1, commands2) == 6
  end

  test "test2" do
    commands1 = ["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"]
    commands2 = ["U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83"]
    assert Circuit.solve_part1(commands1, commands2) == 159
  end

  test "test3" do
    commands1 = String.split("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", ",")
    commands2 = String.split("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7", ",")
    assert Circuit.solve_part1(commands1, commands2) == 135
  end
end
