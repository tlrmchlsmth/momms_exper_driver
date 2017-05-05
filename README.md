# momms_exper_driver

Prerequisites:

For stable graphs, we want to be able to pin cpu frequency:
On Ubuntu we need to use the acpi driver instead of the intel one:
    Set the linux kernel argument: "intel_pstate=disable".
    You can do this by adding the line:
        GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable" 
    to /etc/default/grub
Then install cpupower

Also need to install:
Rust 1.17.0-nightly and cargo
hwloc
mkl
blis
