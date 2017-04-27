# -*- frozen-string-literal: true -*-

module GtmRails
  module Helper
    #
    # Use this method as close to the opening <head> tag as possible on every page of your website.
    #
    def google_tag_manager_script_tag(label)
      container_id = GtmRails::Config.container_ids[label]

      return '' if container_id.blank?

      <<-HTML.strip_heredoc.html_safe
        <!-- Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','#{container_id}');</script>
        <!-- End Google Tag Manager -->
      HTML
    end

    #
    # Use this method immediately after the opening <body> tag on every page of your website.
    #
    def google_tag_manager_noscript_tag(label)
      container_id = GtmRails::Config.container_ids[label]

      return '' if container_id.blank?

      <<-HTML.strip_heredoc.html_safe
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{container_id}"
        height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
      HTML
    end
  end
end
