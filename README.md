# Nervous System

**WARNING** this is not secure, nodename/ip/port are fully exposed

Proof of concept Nerves project that uses custom distribution and MDNS discovery. Set environment variables (NERVOUS_SSID & NERVOUS_PSK) to make wifi work and watch as two nodes auto-connect. When you add a webinterface on port 80 you can directly go to _hostname_.local. Hostname is auto-generated in erlinit.config based on the boardid. Modify that if you want to have a static hostname. Two boards should not have the same hostname as that interferes with eachother.

See **rel/vm.args** for more details on distribution and EPMD.

## Targets
Nerves applications are configured that they can produce images for target
hardware by setting `NERVES_TARGET`. By default, if MIX_TARGET is not set, Nerves
defaults to building a host target. This is useful for executing logic tests,
running utilities, and debugging. For more information about targets:
https://hexdocs.pm/nerves/targets.html#content

## Getting Started    

To start your Nerves app:
  * `export NERVES_TARGET=my_target` or prefix every command with `NERVES_TARGET=my_target`, Example: `NERVES_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: http://www.nerves-project.org/
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
