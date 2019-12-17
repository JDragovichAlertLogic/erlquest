#!/bin/bash

docker pull jdragovich1985/erlang-dev-fest-2019
docker run -it --rm -v `pwd`:/erlquest -p 8080:8080 jdragovich1985/erlang-dev-fest-2019:1.0.2 /bin/bash -c 'cd erlquest && rebar3 shell'
