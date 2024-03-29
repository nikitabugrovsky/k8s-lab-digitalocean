require_relative 'lib/vagrant'

work_dir = File.dirname(File.expand_path(__FILE__))
opts = vagrant_config(work_dir)
check_plugins(opts['plugins'])

Vagrant.configure("2") do |config|
  config.vm.define opts['nodes']['master']['hostname'] do |m|
    m.vm.provider opts['provider']['name'].to_sym do |provider, override|
      override.ssh.private_key_path = opts['provider']['private_key_path']
      override.vm.box = opts['provider']['box']
      override.vm.box_url = opts['provider']['box_url']
      override.nfs.functional = opts['provider']['nfs_functional']
      provider.token = "#{ENV['DO_API_KEY']}"
      provider.ssh_key_name = opts['provider']['ssh_key_name']
      provider.image = opts['provider']['image']
      provider.region = opts['provider']['region']
      provider.size = opts['provider']['size']
      provider.private_networking = opts['provider']['private_networking']
    end
    m.vm.provision opts['provisioner'][0]['name'] do |ansible|
      ansible.playbook = opts['provisioner'][0]['master_playbook']
    end
    m.vm.synced_folder ".", "/vagrant", type: opts['synced_folder']['type']
		m.vm.hostname = opts['nodes']['master']['hostname']
  end
  opts['nodes']['worker']['hostname'].each do |worker|
    config.vm.define worker do |w|
      w.vm.provider opts['provider']['name'].to_sym do |provider, override|
        override.ssh.private_key_path = opts['provider']['private_key_path']
        override.vm.box = opts['provider']['box']
        override.vm.box_url = opts['provider']['box_url']
        override.nfs.functional = opts['provider']['nfs_functional']
        provider.token = "#{ENV['DO_API_KEY']}"
        provider.ssh_key_name = opts['provider']['ssh_key_name']
        provider.image = opts['provider']['image']
        provider.region = opts['provider']['region']
        provider.size = opts['provider']['size']
        provider.private_networking = opts['provider']['private_networking']
      end
      w.vm.provision opts['provisioner'][0]['name'] do |ansible|
        ansible.playbook = opts['provisioner'][0]['worker_playbook']
      end
      w.vm.synced_folder ".", "/vagrant", type: opts['synced_folder']['type']
      w.vm.hostname = worker
    end
  end
end
