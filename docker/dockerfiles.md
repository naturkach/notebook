

- ENTRYPOINT -  is used to specify the command that should be executed when a container is started. It is the primary command that is executed when the container is run. 

  - exec form: ENTRYPOINT ["python", "-u", "server.py"]
  - shell for: ENTRYPOINT python3 -u server.py           -- in docker script will be started from shell process - can be reson of ome issues

- CMD        -  on the other hand, is used to provide default arguments for the ENTRYPOINT command. It is used to specify the arguments that should be passed to the ENTRYPOINT command when the container is started.

```
ENTRYPOINT ["python", "-u", "server.py"]
CMD ["1","5","text"]                     - default values for server.py
```
