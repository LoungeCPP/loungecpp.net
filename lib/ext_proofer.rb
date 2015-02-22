class Proofer < Middleman::Extension
    def initialize(app, options_hash={}, &block)
        super
        app.after_build do |builder|
            HTML::Proofer.new(app.build_dir).run
        end
    end
end

::Middleman::Extensions.register(:proofer, Proofer)
