# ZFS Nix Config

A NixOS flake for a "ZFS over iSCSI" storage node intended for use with Proxmox

## Non-Declarative Parts

### LIO

LIO saves a config file to `/etc/target/saveconfig.json`. Ideally, we set up LIO properly, copy this config file into the nix config and move on, but the problem is all the active LUNs get blown up on every rebuild. So, because I don't want to make a setup script, I'm just noting you'll have to set up LIO manually. This isn't so hard, here are the commands I ran in `targetcli`:

```bash
/iscsi create
cd /iscsi/(your target here)/tpg1
set attribute authentication=0 demo_mode_write_protect=0 generate_node_acls=1 cache_dynamic_acls=1
```

Source: https://blog.haschek.at/2023/zfs-over-iscsi-in-proxmox.html
