---
layout      : post
title       : Fixing Fujitsu UH572 touchpad on Fedora
date        : 2015-10-12 18:42:00
permalink   : fixing-fujitsu-fedora.html
category    : fedora
---
&hellip;that's a lot of F-words. Here's the thing. Open the <code class="language-bash">grub</code> config file:

```bash
sudo su
vim /etc/default/grub
```

Find the line starting with `GRUB_CMDLINE_LINUX`. Add `i8042.notimeout i8042.nomux` to the parameters; save and close. Finally, update grub and reboot:

```bash
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
#          NOT -o /boot/grub2/grub.cfg
reboot
```

And now the touchpad works as it should!
