#Set cpufreq to a constant
sudo modprobe cpufreq_userspace
sudo cpupower frequency-set --governor userspace
sudo cpupower --cpu all frequency-set --freq 4200MHz

cat /proc/cpuinfo | grep MHz
