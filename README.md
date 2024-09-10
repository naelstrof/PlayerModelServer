# Sven Coop Player Model Server

Caches all files listed within `playermodels.txt` so that players download them on join. This happens every map load so models can be hot-loaded by players externally!

## Installation

Simply clone to your svencoop_addon/scripts/plugins folder, then add 

```
...
"plugin"
{
  "name" "PlayerModelServer"
  "script" "PlayerModelServer/PlayerModelServer"
}
...
```

to the svencoop/default_plugins.txt

## Configuration

Files within `playermodels.txt` are exactly listed like a .res file. Simply list every file you wish clients to have there like so:

```
models/player/bee29/bee29.bmp
models/player/bee29/bee29.mdl
models/player/benneq/benneq.bmp
models/player/benneq/benneq.mdl
```
