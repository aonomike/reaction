defmodule Reaction.Cache do
  use ExActor.GenServer, export: __MODULE__

  defstart(start_link, do: initial_state(%{}))

  defcall check(content_id), state: state do
    reply(Map.has_key?(state, content_id))
  end

  defcast add(user_id, content_id), state: state do
    user_ids = Map.get(state, content_id)

    case user_ids do
      nil ->
        user_id_mapset = MapSet.new() |> MapSet.put(user_id)
        new_state(Map.put(state, content_id, user_id_mapset))

      _ ->
        new_set = MapSet.put(user_ids, user_id)
        new_map = Map.put(state, content_id, new_set)
        new_state(new_map)
    end
  end
end
