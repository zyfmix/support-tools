-module(publictimeline_controller).
-export([handle_get/1, handle_post/1]).

-define(DEF_USERNAME, <<"请输入用户名">>).

handle_get(Req) ->
    Data = case woomsg_common:user_state(Req) of
                    {login, Username} ->
                        publictimeline_view:index(login, Username);
                    {logout_remember, undefined} ->
                        publictimeline_view:index(logout_remember, ?DEF_USERNAME);
                    {logout_remember, Username} ->
                        publictimeline_view:index(logout_remember, Username);
                    {logout_no_remember, undefined} ->
                        publictimeline_view:index(logout_no_remember, ?DEF_USERNAME)
             end,
    Req:respond({200, [{"Content-Type","text/html"}], Data}).

handle_post(_Req) ->
    ok.

