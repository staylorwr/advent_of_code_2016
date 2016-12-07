defmodule AdventOfCode.Day2.KeypadTest do
  use ExUnit.Case
  alias AdventOfCode.Day2.Keypad

  describe "next/2" do
    test "normal keys" do
      assert Keypad.next("U", "5") == "2"
      assert Keypad.next("D", "5") == "8"
      assert Keypad.next("L", "5") == "4"
      assert Keypad.next("R", "5") == "6"
    end

    test "borders" do
      assert Keypad.next("U", "1") == "1"
    end
  end
end