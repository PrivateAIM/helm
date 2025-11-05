# 🚀 Installing the Flame-Hub locally for development

This guide outlines the steps to install a local instance of Flame-Hub for development purposes using Kubernetes and Helm.

---

## 1. Prerequisites

* Install and start a local Kubernetes cluster that includes an ingress controller.
    * **Example using minikube:**
        ```bash
        minikube start --addons=ingress
        ```
* Clone this repository
---

## 2. Configuration

1.  **Choose a local hostname** for your hub instance.
    * **Example:** `hub.local`

2.  **Create a local values file** inside the chart directory: `charts/flame-hub/values_local.yml`

3.  **Populate `values_local.yml`** with the minimum required fields for a working hub. This file will override the defaults in `values.yaml`.

    ```yaml
    # The following values will override the values.yaml file for local development
    # run with "helm install <release-name> . -f values_local.yaml"

    global:
        flameHub:
            ingress:
                enabled: true
                ssl: true
                hostname: "hub.local" # <-- Use your chosen hostname here

    serverCore:
        env:
            masterImagesBranch: "develop"

    serverCoreWorker:
        # The name of the secret is usually the same as the ingress resource name.
        # Otherwise get the secret name from the harbor ingress resource
        # (kubectl describe ingress hub-harbor-ingress)
        caCrtSecretName: "harbor.hub.local-tls"

    harbor:
        ingress:
            core:
                hostname: "harbor.hub.local" # <-- Make sure this resolves locally
        externalURL: "https://harbor.hub.local/
    ```

---

## 3. Installation

1.  Navigate to the chart directory:
    ```bash
    cd charts/flame-hub
    ```

2.  Install the Helm chart using your local values file.
    ```bash
    helm install hub . -f values_local.yaml
    ```

---
## 4. Configure access from host computer
1.  Find out the IP of your ingress resource with `kubectl get ingress -A`
    * Example:
        ```bash
        NAMESPACE   NAME                      CLASS   HOSTS              ADDRESS        PORTS     AGE
        default     hub-flame-hub-root-path   nginx   hub.local          192.168.49.2   80        57m
        default     hub-flame-hub-sub-paths   nginx   hub.local          192.168.49.2   80        57m
        default     hub-harbor-ingress        nginx   harbor.hub.local   192.168.49.2   80, 443   57m
        ```
2.  Add entries to your `/etc/hosts` file, so your browser will resolve the hostnames correctly
    * Example:
        ```bash
        192.168.49.2 hub.local
        192.168.49.2 harbor.hub.local
        ```
## 5. Post-Installation & Debugging

* Wait for all the services and pods to start. You can monitor this with `kubectl get pods -w`.
* Access the hub at https://hub.local
* If you encounter issues, use `kubectl` to investigate:
    * `kubectl describe <resource-type> <resource-name>` (e.g., `kubectl describe pod hub-server-core-xxxxx`)
    * `kubectl logs <pod-name>` (e.g., `kubectl logs hub-server-core-xxxxx`)