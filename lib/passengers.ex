defmodule Passenger do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :passenger_principal)
  end

  def init(interests) do
    {:ok, interests}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:interest, pid}, state) do
    send pid, {:ok, "Recibi tu interes"}
    # todo: accum new interest
    nuevo_estado = state + 1
    {:noreply, nuevo_estado}
  end

  # --- funciones de uso ---

  def add_interest(interest) do
    GenServer.cast(interest, {:interest, self()})
  end

  def get_interests(interests) do
    GenServer.call(interests, :get)
  end

  def buy_flight(_flight) do
    # todo: GenServer.cast(flight, :get)
  end
end
