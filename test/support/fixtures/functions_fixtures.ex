defmodule TodoBackend.FunctionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoBackend.Functions` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        status: "some status",
        title: "some title"
      })
      |> TodoBackend.Functions.create_task()

    task
  end
end
