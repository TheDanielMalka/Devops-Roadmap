# Docker Networking Lab Summary

## Key Concepts
* **Default Networks**: Docker provides `bridge`, `host`, and `none` by default.
* **User-Defined Bridge**: Creating a custom network enables **Automatic DNS resolution** between containers.
* **Service Discovery**: Containers can communicate via their names instead of static IP addresses.

## Practical Experiment
1. **Network Creation**: Created a custom bridge network named `DanielNET`.
2. **Container Deployment**:
   - `web-server` (Nginx) - Serving content on port 80.
   - `tester` (Alpine) - Used for network troubleshooting.
3. **Connectivity Test**:
   - **Ping (Layer 3)**: Confirmed the server is "alive" and reachable by name.
   - **Curl (Layer 7)**: Successfully fetched the HTML content from the web server.

## Troubleshooting Tools
- `docker network inspect <name>`: View IP assignments and connected containers.
- `apk add curl`: Necessary for Alpine containers to perform HTTP requests.
