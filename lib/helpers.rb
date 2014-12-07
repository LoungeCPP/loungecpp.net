module CustomHelpers
    def render_title(local_title)
        if local_title
            local_title += ' &bull; '
        else
            local_title = ''
        end

        return local_title + 'Lounge&lt;C++&gt;'
    end
end
