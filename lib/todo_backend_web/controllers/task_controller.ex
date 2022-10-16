defmodule TodoBackendWeb.TaskController do
  use TodoBackendWeb, :controller

  alias TodoBackend.Functions
  alias TodoBackend.Functions.Task

  action_fallback TodoBackendWeb.FallbackController

  def index(conn, _params) do
    tasks = Functions.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Functions.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Functions.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Functions.get_task!(id)

    with {:ok, %Task{} = task} <- Functions.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Functions.get_task!(id)

    with {:ok, %Task{}} <- Functions.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
