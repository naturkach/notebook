

- ENTRYPOINT -  is used to specify the command that should be executed when a container is started. It is the primary command that is executed when the container is run. 

  - exec form: ENTRYPOINT ["python", "-u", "server.py"]
  - shell for: ENTRYPOINT python3 -u server.py           -- in docker script will be started from shell process - can be reson of ome issues

- CMD        -  on the other hand, is used to provide default arguments for the ENTRYPOINT command. It is used to specify the arguments that should be passed to the ENTRYPOINT command when the container is started.

```
ENTRYPOINT ["python", "-u", "server.py"]
CMD ["1","5","text"]                     - default values for server.py
```

- ADD/COPY
  -  ADD directive is more powerful in two ways as follows:
   
      It can handle remote URLs<br>
      It can also auto-extract tar files.

  - COPY  It only lets you copy in a local or directory from your host (the machine-building the Docker image) into the Docker image itself
 
    When to use ADD or COPY: According to the Dockerfile best practices guide, we should always prefer COPY over ADD unless we specifically need one of the two additional features of ADD. As noted above, using ADD command automatically expands tar files and specific compressed formats, which can lead to unexpected files being written to the file system in our images.
