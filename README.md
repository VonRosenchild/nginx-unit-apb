# Ansible Playbook Bundle for NGINX Unit

An Ansible Playbook Bundle (APB) for deploying a single instance of NGINX Unit.

**Please Note**: This is still a WIP. Any upstream changes might break the APB without previous warning.

## Development Environment Setup

To test this APB you will first need to setup an OpenShift Origin environment with a Service Catalog and Ansible Service Broker. [Catasb](https://github.com/fusor/catasb) is a collection of playbooks to create an OpenShift environment with a Service Catalog & Ansible Service Broker in a local or EC-2 environment and will allow you to create an OpenShift Docker cluster on any machine and install all the required dependencies.

As part of setting up `catasb` you will need to set some variables on `config/my_vars.yml`. To get the NGINX Unit APB working you will need to specify the following in that file:
* scc_anyuid: true
* broker_enable_basic_auth: false
* broker_bootstrap_refresh_interval: 86400s

You will also need to install the [APB application](https://github.com/fusor/ansible-playbook-bundle).

Finally, you will need to build an NGINX Unit Docker image and tag it as `unit`. A Dockerfile can be found in `dev/Dockerfile`.

## How to Install and Test the NGINX Unit Service

1. Login to your `oc` cluster via the command that [catasb](https://github.com/fusor/catasb) will output at the end of the installation process.
2. Clone the NGINX Unit APB repository (this repository).
3. Navigate to the repository and run `apb build && apb push`.
5. Open your browser at https://192.168.37.1:8443. You'll be greeted by the OpenShift service catalog.
6. Select the NGINX Unit service, add it to `My Project`, select `Create` and click `View Project`.
    * The default options will deploy a simple PHP server.
    * Other sample configurations can be found in the `Sample Configurations` subheader.
7. After waiting for a few seconds you should see a URL pop in the top-right corner of the project overview GUI. That URL will take you to the NGINX Unit API page.

## Parameters

Name | Default Value | Required | Description
---|---|---|---
configuration | {"applications":{"example_php":{"type":"php","workers":2,"root":"/srv/src","index":"index.php"}},"listeners":{"*:8300":{"application":"example_php"}}} | Yes | NGINX Unit JSON Payload
repository | <https://gist.github.com/7bb161d271b71e139cb5e606b4f1a4b4.git> | Yes | Git Repository URL

## Sample Configurations

**Note:** Each of the following JSON Payloads has been flattened by removing all white-spaces. The original JSON payloads can be found in `dev/config.json`.

### To Deploy a PHP Service

**NGINX Unit JSON Payload:** `{"applications":{"example_php":{"type":"php","workers":2,"root":"/srv/src","index":"index.php"}},"listeners":{"*:8300":{"application":"example_php"}}}`

**Git Repository URL:** `https://gist.github.com/7bb161d271b71e139cb5e606b4f1a4b4.git`

### To Deploy a Python Service

**NGINX Unit JSON Payload:** `{"applications":{"example_python":{"type":"python","workers":2,"path":"/srv/src","module":"wsgi"}},"listeners":{"*:8400":{"application":"example_python"}}}`

**Git Repository URL:** `https://gist.github.com/cf13b560545d6a82562035a355b1a14b.git`

### To Deploy a PHP & Python Service

**NGINX Unit JSON Payload:** `{"applications":{"example_php":{"type":"php","workers":2,"root":"/srv/src/php","index":"index.php"},"example_python":{"type":"python","workers":2,"path":"/srv/src/python","module":"wsgi"}},"listeners":{"*:8300":{"application":"example_php"},"*:8400":{"application":"example_python"}}}`

**Git Repository URL:** `https://github.com/alessfg/conf-magic.git`

## License

[Simplified BSD License](https://github.com/nginxinc/nginx-unit-apb/blob/master/LICENSE)

## Author

Alessandro Fael Garcia

[NGINX Inc](https://www.nginx.com/)
