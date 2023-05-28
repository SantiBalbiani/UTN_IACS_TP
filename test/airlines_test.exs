defmodule AirlineTest do
  use ExUnit.Case
  # use GenServer

  setup do
    IO.puts "Corri el setup"
    {:ok, server_pid} = Airline.start_link(0)
    {:ok, server: server_pid}
  end

  test "get total boughts", %{server: pid} do
    assert 0 == GenServer.call(pid, :get)
  end

  test "can make a bought", %{server: pid} do
    GenServer.cast(pid, {:bought, self})
    assert 1 == GenServer.call(pid, :get)
  end

end
