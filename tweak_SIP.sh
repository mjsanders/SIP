#/bin/sh
#created by maurits@lai.nl for demo purpose
#tested on DeployStudio 1.7.1 with 10.11.0 and 10.11.2
#it will change permissions of /sbin and /System/folder, and SIP should not kick in

NETBOOT_ALLOWED_BY_SIP=10.0.0.111

/bin/echo "   ${SCRIPT_NAME} - v1.0 ("`date`")"

/bin/echo "   This script will run: chflags norestricted on /System/ and /sbin/"
/bin/echo "    and chmod a+rw on /sbin with this Volume: "
/bin/echo "   /Volumes/$DS_LAST_RESTORED_VOLUME/System/"
/bin/echo "  "
/usr/bin/chflags norestricted "/Volumes/$DS_LAST_RESTORED_VOLUME/System/"
/usr/bin/chflags  norestricted "/Volumes/$DS_LAST_RESTORED_VOLUME/sbin/"
/bin/chmod a+rw "/Volumes/$DS_LAST_RESTORED_VOLUME/sbin"
/usr/bin/csrutil netboot add $NETBOOT_ALLOWED_BY_SIP
/bin/echo "  "
/bin/echo "   SIP status and netboot list(s): "
/bin/echo "`/usr/bin/csrutil status`"
/bin/echo "   SIP netboot list(s): "
/bin/echo "`/usr/bin/csrutil netboot list`"

/bin/echo "   ${SCRIPT_NAME} - end"

exit 0

