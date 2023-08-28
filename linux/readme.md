
run curl every 2 sec:
```
while true; do curl http://127.0.0.1:45085/; sleep 2; echo; done
```

screen (run session in background and re-connect when need)
 
 - screen –S mynewsession  - create new session mynewsession
 - ctrl + a -- control command + some key:
 - ctrl + a d -- close session, but keep all processes running
 - screen –ls - show all screens
 - screen –x mynewsession  -- connect to mynewsession screen
