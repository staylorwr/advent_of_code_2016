defmodule AdventOfCode.Day7Test do
  use ExUnit.Case
  alias AdventOfCode.{Day7, Helper}

  describe "is_tls?/1" do
    test "example 1", do: assert Day7.is_tls?("abba[mnop]qrst")
    test "example 2", do: refute Day7.is_tls?("abcd[bddb]xyyx")
    test "example 3", do: refute Day7.is_tls?("aaaa[qwer]tyui")
    test "example 4", do: assert Day7.is_tls?("ioxxoj[asdfgh]zxcvbn")
  end

  describe "is_ssl?/1" do
    test "example 1", do: assert Day7.is_ssl?("aba[bab]xyz")
    test "example 2", do: refute Day7.is_ssl?("xyx[xyx]xyx")
    test "example 3", do: assert Day7.is_ssl?("aaa[kek]eke")
    test "example 4", do: assert Day7.is_ssl?("zazbz[bzb]cdb")
  end

  test "problem 1", do: assert input |> Day7.tls_address_count == 115

  test "problem 2", do: assert input |> Day7.ssl_address_count == 231

  def input, do: Helper.load_input(7)
end
