---
layout: post
title:  "Fixing Fujitsu UH572 touchpad on Fedora"
date:   2015-10-12 18:42:00
categories: jekyll update
---
&hellip;that's a lot of F words. Here's the thing. 


* Open the `grub` config file.
{% highlight bash %}
sudo su
vim /etc/default/grub
{% endhighlight %}
* Find the line starting with `GRUB_CMDLINE_LINUX`. Add `i8042.notimeout i8042.nomux` to the parameters; save and close.
* Update grub and reboot.
{% highlight bash %}
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg # NOT /boot/grub2/grub.cfg
reboot
{% endhighlight %}


And now the touchpad works as it should!