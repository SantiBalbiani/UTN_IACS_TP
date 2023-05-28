defmodule Airline do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :airline_principal)
  end

  def init(airplanes) do
    {:ok, airplanes}
  end

  def handle_call(:get, from, state) do
    IO.puts 'Recibi pedido de cant de likes de #{inspect from}'
    {:reply, state, state}
  end

  def handle_cast({:bought, pid}, state) do
    #send pid, {:ok, "Recibi tu compra para el asiento X"}
    # todo: accum new bought
    nuevo_estado = state + 1
    {:noreply, nuevo_estado}
  end

  # --- funciones de uso ---

  def add_bought(bought) do
    GenServer.cast(bought, {:bought, self})
  end

  def get_airplanes(airplanes) do
    GenServer.call(airplanes, :get)
  end

  def buy_flight(flight) do
    # todo: GenServer.cast(flight, :get)
  end
end
