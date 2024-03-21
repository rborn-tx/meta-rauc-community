FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Add a mount point for a shared data partition
dirs755 += "/data"

# Add a mount point for the uboot VFAT partition
dirs755 += "/uboot"
