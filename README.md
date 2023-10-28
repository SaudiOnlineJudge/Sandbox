# SOJ Sandbox System
A docker image `soj/sandbox`, that runs in `ubuntu:22.04`

## Runlang
A shell script that takes any code and runs it
Run `runlang -h`

### Supported Compilers
- [x] GCC [`c`]
- [x] G++ (11, 14, 17, 20, 23) [`cpp11`, `cpp14`, `cpp17`, `cpp20`, `cpp23`]
- [x] Rust [`rust`]
- [x] Java (openjdk) [`java`]
- [x] Python2 [`python2`]
- [x] Python3 [`python3`]
- [ ] C#
- [ ] Javascript
- [ ] PHP



## Security Settings
- [x] Only 1 process
- [x] Time & Memory limit
- [x] Run in isolation mode
- [x] No internet connection
- [ ] No Multi-threading (idk how to do)

## Running
```sh
TIME_LIMIT=1000
MEMORY_LIMIT=128000000
LANG=cpp17
docker run --stop-timeout 10 --name soj_sandbox_test --rm -v ./files:/root/files -m $MEMORY_LIMIT --pids-limit 5 -e LANG=$LANG -e TIME_LIMIT=$TIME_LIMIT --entrypoint ./code.sh soj/sandbox
```

Here is an example, these are the options:
- `{LANG}` should be one of the supported languages by `runlang`
- `{MEMORY_LIMIT}` is in bytes (min 6mb, you can write `1GB`, `256M`)
- `{TIME_LIMIT}` is in milliseconds (you can write `2s`)

## Future Todo
- [ ] Lightwegiht image like `alpine`
- [ ] Adding the languages of `runlang`
- [ ] Customizibility of statistics in `runlang`

## License
Open using