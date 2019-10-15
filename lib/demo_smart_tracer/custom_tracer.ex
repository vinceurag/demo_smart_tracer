defmodule DemoSmartTracerWeb.CustomTracer do
  @moduledoc false
  use SmartTracer.Custom

  def action(:call, {module, fun, args}) do
    live_view_pid = Process.whereis(:tracer_live)
    send(live_view_pid, {:call, {module, fun, args}})
  end

  def action(:return, {module, fun, arity, return_value}) do
    live_view_pid = Process.whereis(:tracer_live)
    send(live_view_pid, {:return, {module, fun, arity, return_value}})
  end
end
