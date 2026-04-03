[private]
default: link

init:
  uv tool install dotbot

link:
  dotbot -c install.conf.yaml
