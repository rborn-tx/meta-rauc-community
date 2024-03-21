FILESEXTRAPATHS:prepend:tdx := "${THISDIR}/files:"
SRC_URI:append:tdx = " file://toradex-rauc.rules"

do_install:append:tdx() {
    install -d ${D}${sysconfdir}/udev/mount.ignorelist.d/
    install -m 0644 ${WORKDIR}/toradex-rauc.rules ${D}${sysconfdir}/udev/mount.ignorelist.d/
}
