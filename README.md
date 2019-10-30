# Erlquest

# Run Project
First you'll need the docker container and repo pulled down

```
docker pull jdragovich1985/erlang-dev-fest-2019:1.0.2
```
Also make sure you've pulled this repo to your local machine. Once pulled navigate to the root of this repositiory and run the following docker command. This will start the erlang shell

```
docker run -it -rm -v `pwd`:/erlquest -p 8080:8080 jdragovich1985/erlang-dev-fest-2019:1.0.2 /bin/bash -c 'cd erlquest && rebar3 shell'
```

Once hte shell is running, runn the following commands in the shell to start hot code reloading and start the application. 

```erlang
sync:start().
application:ensure_all_started(erlquest).
```
