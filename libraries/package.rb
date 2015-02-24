#
# Cookbook Name:: ZEN
# Library:: package
#
# Copyright 2015, Copyright (C) 2015 The Zen Garden. All rights reserved.
#
# All rights reserved - Do Not Redistribute
#

module ZEN
  module Package
    # If we're not running in the Production environment,
    # we will update all packages on each run:
    def update_pkgs (environment)
      if environment != "Production"
        execute "yummy-update" do
          command "yum update -y"
        end
      end
    end


    # Once all base packages have been updated, lets install
    # a base set of packages that should be on every node of ours:
    def install_pkgs (pkg_list)
      if pkg_list.class == Array
        pkg_list.each do |pkg|
          package "#{pkg}" do
            action :install
          end
        end
      else
        package "#{pkg_list}" do
          action :install
        end
      end
    end
  end
end
