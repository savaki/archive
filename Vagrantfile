require File.expand_path(File.dirname(__FILE__) + '/tasks/env')

Vagrant.configure("2") do |config|
  config.vm.box       = "precise64"
  config.vm.box_url   = "http://files.vagrantup.com/precise64.box"

  config.vm.network :public_network

  config.vm.provision :shell, :inline => "sudo apt-get update"
  config.vm.provision :shell, :inline => "sudo apt-get install -y s3cmd"
  config.vm.provision :shell, :inline => "sudo apt-get install -y dpkg-dev"
  config.vm.provision :shell, :inline => "su - vagrant -c 'cp /vagrant/dist/s3cfg     .s3cfg'"
  config.vm.provision :shell, :inline => "su - vagrant -c 'cp /vagrant/dist/update.sh .'"
  config.vm.provision :shell, :inline => "su - vagrant -c 'mkdir archive'"
  config.vm.provision :shell, :inline => "su - vagrant -c 'cd archive ; s3cmd get --recursive s3://#{S3_BUCKET}'"
  config.vm.provision :shell, :path   => "scripts/open_ssh.sh"
  config.vm.provision :shell, :inline => "ifconfig -a | grep 'inet addr' | grep -v 127.0.0.1"

  config.vm.provider :virtualbox do |vb|
    # enable the gui.  the default behavior is to start up headless
    vb.gui = true
  end
end
