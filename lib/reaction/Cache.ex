defmodule Reaction.Cache do
  use ExActor.GenServer, export: __MODULE__

  defstart(start_link, do: initial_state(:ets.new(__MODULE__, [])))

  defcall check(content_id), state: table do
    content = :ets.lookup(table, content_id)
    case content do
      [] -> 
        reply(:noreply)
      _ ->
        reply(content)
    end
  end

  defcall get, state: table, do: reply(table)

  defcast add(user_id, content_id), state: table do
    
    content = :ets.lookup(table, content_id)
    case content do
      [] ->
        user_id_map_set = MapSet.new() |> MapSet.put(user_id)
        :ets.insert(table, {content_id, user_id_map_set})
        new_state(table)

      [{content_id, current_map}] ->
        user_id_map_set = MapSet.put(current_map, user_id)
        :ets.insert(table, {content_id, user_id_map_set})
        new_state(table)
    end
  end

  defcast rem(content_id, user_id), state: table do
    content = :ets.lookup(table, content_id)
    case content do
      [] ->
        new_state(table)
      [{content_id, current_map}] ->
        new_set = MapSet.delete(current_map, user_id)
        :ets.insert(table, {content_id, new_set})
        new_state(table) 
    end
  end

  defcast counter(content_id), state: table do
    content = :ets.lookup(table, content_id)
    case content do
      [] ->
        0
      [{content_id, current_map}] ->
        Enum.count(current_map) 
    end
  end
end
