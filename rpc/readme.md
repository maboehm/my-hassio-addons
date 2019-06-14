# RPC Shutdown with Timeout

Copied from https://github.com/home-assistant/hassio-addons/tree/master/rpc_shutdown, but added a configurable timeout. For a detailed description look here: https://home-assistant.io/addons/rpc_shutdown/

Also removed regex from the credentials field, because it did not allow a password with a `%` in it. If your password contains a percentage sign, simply provide it as is: `user%pass%word`.