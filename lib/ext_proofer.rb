class Proofer < Middleman::Extension
    def initialize(app, options_hash={}, &block)
        super
        app.after_build do |builder|
            HTML::Proofer.new(app.build_dir, {
                :typhoeus => {
                    # some linked-to TLS hosts fail to verify,
                    # but that's not our problem
                    :ssl_verifyhost => 0,
                    :ssl_verifypeer => false
                }
            }).run
        end
    end
end

::Middleman::Extensions.register(:proofer, Proofer)
