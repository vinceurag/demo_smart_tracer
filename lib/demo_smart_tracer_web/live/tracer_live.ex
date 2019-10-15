defmodule DemoSmartTracerWeb.TracerLive do
  use Phoenix.LiveView

  alias DemoSmartTracerWeb.TracerView
  alias DemoSmartTracerWeb.CustomTracer

  def render(assigns) do
    TracerView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    Process.register(self(), :tracer_live)
    {:ok, assign(socket, :traces, [])}
  end

  def handle_event(
        "trace",
        %{"trace" => %{"fun_ref" => fun_ref_string, "trace_limit" => trace_limit}},
        socket
      ) do
    {fun_ref, _} = Code.eval_string(fun_ref_string)

    case CustomTracer.trace(fun_ref, String.to_integer(trace_limit)) do
      0 ->
        put_flash(socket, :error, "No function to be traced")
        {:noreply, socket}

      _ ->
        {:noreply, socket}
    end

    {:noreply, socket}
  end

  def handle_info({:call, {module_name, fun_name, args}}, socket) do
    val = "#{module_name}.#{fun_name}/#{length(args)} was called with #{inspect(args)}"
    {:noreply, update(socket, :traces, fn traces -> [val | traces] end)}
  end
end
