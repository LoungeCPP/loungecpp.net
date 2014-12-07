module CustomHelpers
    def render_title(local_title)
        if local_title
            local_title += ' &bull; '
        else
            local_title = ''
        end

        return local_title + 'Lounge&lt;C++&gt;'
    end

    def emote(code)
        name = data.emots[code]
        return image_tag "//assets.loungecpp.net/img/emote/#{name}", alt: code
    end
end
