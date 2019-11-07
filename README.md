# Erlquest
This the Repo for the Cardiff Devfest 2019 talk _Learn You Some Erlang For a Great Conference_.

## Run Project

Pull this repository and navigate to the project root.
```
git clone git@github.com:JDragovichAlertLogic/erlquest.git
cd erlquest
```
Run the inlcuded start script to start the application
```
./start.sh
```
If the shell script isnt working for you, try [running it manually](#markdown-header-running-it-manually).

Once the shell is running, runn the following commands in the shell to start hot code reloading and start the application. 

```erlang
sync:start().
application:ensure_all_started(erlquest).
```

## Running it Manually
First you'll need the docker container and this repo pulled down
```
docker pull jdragovich1985/erlang-dev-fest-2019:1.0.2
```
Also make sure you've pulled this repo to your local machine.
```
git clone git@github.com:JDragovichAlertLogic/erlquest.git
```
Navigate to the root of this repositiory and run the following docker command. This will start the erlang shell
```
cd erlquest
docker run -it --rm -v `pwd`:/erlquest -p 8080:8080 jdragovich1985/erlang-dev-fest-2019:1.0.2 /bin/bash -c 'cd erlquest && rebar3 shell'
```

