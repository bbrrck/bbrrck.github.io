---
layout: post
title:  "Fixing Fujitsu UH572 touchpad on Fedora"
date:   2015-10-12 18:42:00
permalink: fixing-fujitsu-fedora/
---
&hellip;that's a lot of F-words. Here's the thing. 

1. Open the `grub` config file.

        sudo su
        vim /etc/default/grub
        
2. Find the line starting with `GRUB_CMDLINE_LINUX`. Add `i8042.notimeout i8042.nomux` to the parameters; save and close.

3. Update grub and reboot.

        grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg # NOT /boot/grub2/grub.cfg
        reboot

And now the touchpad works as it should!