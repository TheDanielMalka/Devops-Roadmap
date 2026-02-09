# Resource Allocation in Virtualization

## CPU & RAM Management
- **Static Allocation:** Resources are reserved for the VM even when it's idle.
- **Overcommitment:** Assigning more virtual resources than physical ones (risky but efficient).
- **Throttling:** Limiting a VM's usage so it doesn't slow down the whole Host.

## Comparison
- **VMs:** Get a fixed slice of the hardware "cake".
- **Containers:** Compete for the Host's resources dynamically unless limits are set.
