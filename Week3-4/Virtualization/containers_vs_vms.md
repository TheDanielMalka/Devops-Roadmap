# Containers vs Virtual Machines (Quick Summary)

I created this table to clarify the main differences for my upcoming Python/Linux exam.

| Feature          | Virtual Machines (VMs)        | Containers (Docker)          |
|------------------|-------------------------------|------------------------------|
| **OS**           | Full Guest OS (Heavy)         | Shared Host Kernel (Light)   |
| **Size**         | Gigabytes (GB)                | Megabytes (MB)               |
| **Boot Time**    | Minutes                       | Seconds                      |
| **Isolation**    | Hardware-level (Hypervisor)   | Process-level (Namespaces)   |
| **SSH Access**   | Directly to the VM IP         | Usually via `docker exec`    |

## Key takeaway for SSH:
In a VM, you run an SSH daemon inside the guest. In containers, you usually SSH into the Host and then jump into the container using the Docker CLI.
