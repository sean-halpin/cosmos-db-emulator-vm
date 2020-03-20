Vagrant.configure("2") do |config|
  config.vm.box = "xnohat/windows10lite"
  config.vm.box_version = "1.0.0"
  config.vm.provision :shell, path: "provision.ps1"
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.disksize.size = '20GB'
  config.vm.provider "virtualbox" do |pmv|
    pmv.memory = 8192
    pmv.cpus = 2
  end
end
