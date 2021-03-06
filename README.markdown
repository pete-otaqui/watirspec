What
-----

This repository is intended to be used as a git submodule for projects that want to implement [Watir](http://watir.com)'s API.
Since the specs were taken from [Celerity](http://github.com/jarib/celerity), making it usable on other implementations (including Watir itself) is a work in progress. Please contribute!

The specs run a small Sinatra webapp (_WatirSpec::Server_) to simulate interacting with a web server. However, most specs use the _file://_ scheme to avoid hitting the server.

How to use
----------

First add the submodule to _spec/watirspec_:

    $ git submodule add git://github.com/jarib/watirspec.git spec/watirspec

The specs will look for a *spec_helper.rb* in its parent directory (i.e. _spec/_). In this file you can load your library and set various options.

Here's an example of what _spec/spec\_helper.rb_ could look like:

    $LOAD_PATH.unshift(«lib folder»)
    require "watir_impl"

    include WatirImpl::Exception

    # configure this implementation - this also allows you to hook into the guard system
    # see http://github.com/jarib/watirspec/blob/master/lib/implementation.rb

    WatirSpec.implementation do |imp|
      imp.name          = :watir_impl
      imp.browser_args  = [:some, :arguments] # will be passed to Browser.new
      imp.browser_class = WatirImpl::Browser
    end

    WatirSpec.persistent_browser = false               # defaults to true, but can be disabled if needed
    WatirSpec::Server.autorun    = false               # defaults to true, but can be disabled if needed

    WatirSpec::Server.get("/my_route") { "content" }   # add routes to the server for implementation-specific specs

Implementation-specific specs should be placed at the root of the _spec/_ folder.
To use the setup code from watirspec, simply require `"spec/watirspec/spec_helper"` (which in turn will load your `spec/spec_helper.rb`).

Where
-----

* Source : [GitHub](http://github.com/jarib/watirspec/tree/master)
* Issues : [GitHub](http://github.com/jarib/watirspec/issues)
