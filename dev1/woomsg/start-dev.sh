#!/bin/sh
cd `dirname $0`
exec erl -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -config log-dev.config -setcookie woomsgprivatecookie -sname woomsgserver -s reloader -s woomsg
