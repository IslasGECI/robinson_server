<a href="https://www.islas.org.mx/"><img src="https://www.islas.org.mx/img/logo.svg" width="256" /></a>
<a href="https://www.islandconservation.org/"><img src="https://github.com/IslasGECI/robinson_code/blob/develop/assets/images/ic_logo.png" align="right" width="256" /></a>


# Robinson Server

Infrastructure as Code for the Coati Eradication Project on Robinson Crusoe Island.

To create the server, execute the following commands:

```shell
docker pull islasgeci/robinson_server:latest
docker run --env DO_PAT --rm --volume ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa --volume robison_server:/src islasgeci/robinson_server:latest
```

To destroy the server, execute the following commands:

```shell
docker run --env DO_PAT --rm --volume ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa --volume robison_server:/src islasgeci/robinson_server:latest make destroy_server
```
