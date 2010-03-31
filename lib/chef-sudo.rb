require 'chef/resource'

class Chef
  class Resource
    class Sudo < Chef::Resource
      def initialize(name, collection=nil, node=nil)
        super(name, collection, node)
        @resource_name = :sudo
        @action = :execute
        @allowed_actions.push(:execute)
      end
      
      def command(arg=nil)
        set_or_return(
          :command, 
          arg, 
          :kind_of => [ String ]
        )
      end
      
      def user(arg=nil)
        set_or_return(
          :user,
          arg,
          :kind_of => [ String ]
        )
      end
      
      def group(arg=nil)
        set_or_return(
          :group,
          arg,
          :kind_of => [ String ]
        )
      end
      
      def simulate_initial_login(arg=false)
        set_or_return(
          :simulate_initial_login,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
        )
      end
    end
  end
end

class Chef
  class Provider
    class Sudo < Chef::Provider
      def load_current_resource
      end
      
      def action_execute
        command = ["sudo"]
        command << "-u #{@new_resource.user}" if @new_resource.user
        command << "-g #{@new_resource.group}" if @new_resource.group
        command << "-i" if @new_resource.simulate_initial_login
        command << @new_resource.command

        Chef::Mixin::Command.run_command(:command => command.join(' '))
        Chef::Log.info "Ran sudo [#{@new_resource.name}]"
      end
    end
  end
end

