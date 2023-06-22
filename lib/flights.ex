defmodule Flights do
  def start_link do
    {:ok, pid} = Task.start_link(fn -> loop(%{}) end)
    pid
  end

  defp loop(state) do
    receive do
      {:publicar, flight} ->
        IO.puts("New flight published: #{inspect(flights)}")
        loop(Map.put(state, vuelo.id, vuelo))
      
      {:cerrar, flight_id} ->
        case Map.get(state, vuelo_id) do
          nil ->
            IO.puts("Vuelo no encontrado: #{vuelo_id}")
            loop(state)
          
          flight ->
            IO.puts("Flight closed: #{inspect(flight)}")
            loop(Map.delete(state, flight_id))
        end
    end
  end
end
