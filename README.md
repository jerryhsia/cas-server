# Central Authentication Service (CAS) [![License](https://img.shields.io/hexpm/l/plug.svg)](https://github.com/Jasig/cas/blob/master/LICENSE)

## Introduction
This branch hosts the [Docker](https://www.docker.com/) build configuration to run CAS with predefined users over http or https. See the `Dockerfile` for more info.

## Disclaimer
This README.md was changed by https://github.com/sergiofbsilva.
Use it at your own risk.

## Requirements
* Minimum of Docker version `1.9.x`

## Configuration

### Image
* The image will be available on the host via ports `8080` and `8443`
* The image may be accessed via the host browser

## CAS Overlay
* The build will automatically copy the contents of the `src\main\webapp` to the docker image. 
 
### SSL
* The default keystore is `etc/thekeystore`.
* The password for the keystore is `changeit`.
* It has a self-signed certificate for the name `docker.local`
    * update `/etc/hosts` using the following command line instruction
        * `sudo echo "$(docker-machine ip) docker.local" > /etc/hosts`   
* You can install `etc/jetty.cer` in your prefered browser so that it recognizes the self-signed certificate.
    - MacOSX instructions
        1. On MacOsX just run `open etc/jetty.cer`
        2. The `KeyChain` opens and asks to import file
        3. Choose `System`
        4. Search for `docker.local` and double-click it
        5. Expand `Trust` + SSL , set always trust

## Run

```bash
#docker run -p 8080:8080 -p 8443:8443 -d --name="cas" sergiofbsilva/cas-dev
./run.sh
```

## Usage

### Users
You can login using any of the users defined in `cas.properties`.
Just search for the following line if you need to change it

```
#accept.authn.users=user1::password1,user2::password2 ...
accept.authn.users=admin1::admin1,admin2::admin2,admin3::admin3
```

### Services
This setup accepts any service URL (http or https)

#### Example

`https://docker.local:8443/cas/login?service=https://localhost:8443/login/cas`