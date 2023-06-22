defmodule Monitor do
  def start_link do
    {:ok, pid} = Task.start_link(fn -> loop end)
    pid
  end

  defp loop do
    receive do
      {:notificar_cierre, comprador, vuelo} ->
        IO.puts("Notificar cierre de vuelo al comprador: #{inspect(comprador)} - #{inspect(vuelo)}")
    end
    loop
  end
end