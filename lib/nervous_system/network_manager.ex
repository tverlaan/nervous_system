defmodule NervousSystem.NetworkManager do
  use GenServer
  require Logger

  @app Mix.Project.config[:app]

  def start_link(iface) do
    GenServer.start_link(__MODULE__, iface)
  end

  def init(iface) do
    iface = to_string(iface)
    {:ok, pid} = Registry.register(Nerves.Udhcpc, iface, [])
    {:ok, %{registry: pid, iface: iface}, timeout()}
  end

  def handle_info({Nerves.Udhcpc, event, %{ipv4_address: ip}}, s)
    when event in [:bound, :renew] do
    Logger.info "IP Address Changed"
    EAPMD.MDNS.set_ip ip
    EAPMD.MDNS.query
    {:noreply, s, timeout()}
  end

  def handle_info(:timeout, s) do
    for node <- EAPMD.MDNS.nodes() do
      Node.connect(node.name)
    end
    EAPMD.MDNS.query
    {:noreply, s, timeout()}
  end

  def handle_info(_event, s) do
    {:noreply, s, timeout()}
  end

  defp timeout() do
    10_000 + (length(Node.list()) * 300_000)
  end
end