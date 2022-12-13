defmodule TodoBackendWeb.TaskView do
  use TodoBackendWeb, :view
  alias TodoBackendWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    render_many(tasks, TaskView, "task.json")
  end

  def render("show.json", %{task: task}) do
    render_one(task, TaskView, "task.json")
  end

  def render("task.json", %{task: task}) do
    %{
      id: task.id,
      title: task.title,
      status: task.status
    }
  end
end
