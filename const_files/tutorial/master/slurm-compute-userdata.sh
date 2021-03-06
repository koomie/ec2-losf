#!/bin/bash -xe
# @losf_synced_file_notice@
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sed -i "s|SELINUX=enforcing|SELINUX=permissive|g" /etc/selinux/config
setenforce 0
sleep 15
echo "192.168.0.100:/home /home nfs nfsvers=3,nodev,nosuid 0 0" >> /etc/fstab
echo "192.168.0.100:/opt/ohpc/pub /opt/ohpc/pub nfs nfsvers=3,nodev 0 0" >> /etc/fstab
mount -a
cp /home/.munge /etc/munge/munge.key
chown munge:munge /etc/munge/munge.key
systemctl start munge
systemctl enable munge
cp /home/.slurmconf /etc/slurm/slurm.conf
echo SLURMD_OPTIONS="--conf-server 192.168.0.100" > /etc/sysconfig/slurmd
systemctl restart slurmd
systemctl enable slurmd
